package service;

import javax.inject.Inject;

import common.MailHandler;
import common.SrcFileSet;
import common.TempKey;
import domain.BoardVO;
import domain.SrcVO;
import domain.UserCriteria;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import domain.UserVO;
import dto.LoginDTO;
import persistence.UserDAO;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO dao;

	@Inject
	private JavaMailSender mailSender;
	@Inject
	PasswordEncoder passwordEncoder;

	@Override
	public void regist(UserVO user) throws Exception {

		String encPassword = passwordEncoder.encode(user.getUserPassword());
		user.setUserPassword(encPassword);
		//System.out.println("암호화된 비밀번호 : "+user.getUserPassword());

		dao.insertUser(user);
//		System.out.println(user);
		String key = new TempKey().getKey(50,false);

		dao.createAuthKey(user.getUserEmail(),key); //인증키 db 저장
		//메일 전송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Thinkjack 서비스 이메일 인증]");
		sendMail.setText(
				new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://http://rnasterpiece.pro/user/emailConfirm?userEmail=").append(user.getUserEmail()).append("&userAuthCode=").append(key).append("' target='_blank'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("testmailsender1122@gmail.com", "Thinkjack 개발자");
		//System.out.println("getEmail"+user.getUserEmail());
		sendMail.setTo(user.getUserEmail());
		sendMail.send();
	}

	//이메일 인증 키 검증
	@Override
	public UserVO userAuth(UserVO user) throws Exception {
        UserVO vo =new UserVO();
		System.out.println(user+"user");
        vo=dao.chkAuth(user);
        //System.out.println("ser.userAuth.chkauth"+vo);
        if(vo!=null){
            try{
            	System.out.println(vo+"vo");
                dao.userAuth(user);
				dao.successAuth(vo);
            }catch (Exception e) {
                e.printStackTrace();
            }}
        return vo;
	}
	//패스워드 찾기 이메일 인증 검증
	@Override
	public UserVO userAuthFindPassword(UserVO user) throws Exception {
		UserVO vo =new UserVO();
		vo=dao.chkAuth(user);
		if(vo!=null){
			try{
				dao.successAuth(user);
			}catch (Exception e) {
				e.printStackTrace();
			}}
		return vo;
	}
	//로그인
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		//System.out.println("service dto: "+dto);
		try {
			String pw = dao.getUserPw(dto.getUserEmail()).getUserPassword();
			String rawPw = dto.getUserPassword();
			System.out.println("db pW  : "+pw);
			System.out.println("입렵Pw:"+rawPw);
			System.out.println(passwordEncoder.matches(rawPw, pw));
			if(passwordEncoder.matches(rawPw, pw)) {
				System.out.println("비밀번호 일치");
				dto.setUserPassword(pw);
			}else {
				//============System.out.println("비밀번호 불일치");=======================
				//주석 해제 시 비 암호화 설정된 db Pw  값으로  로그인 되지 않음
				//dto.setUserPassword(pw);
			}
		}catch(NullPointerException npe){
			UserVO vo=new UserVO();
			vo=null;
			System.out.println(vo);
			return vo;
		}catch (Exception e){
			UserVO vo=new UserVO();
			vo=null;
			return vo;
		}
		return dao.login(dto);
	}
	//회원 정보 변경
	@Override
	public UserVO modifyUser(UserVO user) throws Exception {
		dao.updateUser(user);
		return  dao.read(user);
	}
	//회원 탈퇴
	@Override
	public void deleteUser(UserVO user) throws Exception {
		//System.out.println(user);
		dao.deleteUser(user);
	}

	@Override
	public UserVO naverLogin(LoginDTO dto) throws Exception {

		UserVO vo =new UserVO();
		vo=dao.naverReadUser(dto);
		if(vo==null){
			try{
				dao.naverInsertUser(dto);
			}catch (Exception e) {
			e.printStackTrace();
			}}
		return dao.naverReadUser(dto);
	}
	//구글 oauth login
    @Override
    public UserVO googleLogin(LoginDTO dto) throws Exception {
        UserVO vo =new UserVO();
        vo=dao.naverReadUser(dto);
        if(vo==null){
            try{
                dao.naverInsertUser(dto);
            }catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }}
        return dao.naverReadUser(dto);
    }
    //이메일 아이디 중복 관련 코드 전송
	@Override
	public String authenticate(String str) throws Exception {
		UserVO vo = dao.authenticate(str);
	//	System.out.println("dao vo:"+vo);
		if(vo == null) {
			return "T";
		}else if(vo.getUserState() == 0){
			return "F";
		}else{
			return "D";
		}
	}
	//이름 중복관련 코드 전송
	@Override
	public String authenticateName(String str) throws Exception {
		UserVO vo = dao.authenticateName(str);
		System.out.println("dao vo:"+vo);
		if(vo == null) {
			return "T";
		}else{
			return "F";
		}
	}
	//비밀번호 찾기
	@Override
	public void findPassword(UserVO user) throws Exception {
		String key = new TempKey().getKey(50,false);

		dao.updateAuthKey(user.getUserEmail(),key); //인증키 db 저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Thinkjack 서비스 패스워드 찾기]");
		sendMail.setText(
				new StringBuffer().append("<h1>아래 주소로 접속하여 패스워드를 변경해주세요</h1>").append("<a href='http://rnasterpiece.pro/user/findPasswordConfirm?userEmail=").append(user.getUserEmail()).append("&userAuthCode=").append(key).append("' target='_blank'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("testmailsender1122@gmail.com", "Thinkjack 개발자");
		//System.out.println("getEmail"+user.getUserEmail());
		sendMail.setTo(user.getUserEmail());
		sendMail.send();
	}

	@Override
	public void modifypassUser(UserVO user) throws Exception {
		//System.out.println("dao.vo 입력 값"+user);

		String encPassword = passwordEncoder.encode(user.getUserPassword());
		user.setUserPassword(encPassword);
		//System.out.println("암호화된 비밀번호 : "+user.getUserPassword());
		try {
			dao.successAuth(user);
			dao.updatePassword(user);

		//	System.out.println("코드 삭제");
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	//마이페이지 관련 서비스
	@Override
	public List<BoardVO> boardSearch(UserCriteria cri) throws Exception {
		return dao.boardSearch(cri);
	}

	@Override
	public List<SrcVO> selectSrcList(UserCriteria cri) throws Exception{

		SrcFileSet srcFileSet = new SrcFileSet();
		List list = dao.selectSrcList(cri);

		list = srcFileSet.setList(list);

		return list;
	}

	@Override
	public int srcListSearchCount(UserCriteria cri) throws Exception {
		return dao.srcListSearchCount(cri);
	}

	@Override
	public int boardSearchCount(UserCriteria cri) throws Exception {
		return dao.boardSearchCount(cri);
	}

	@Override
	public void deleteImage(String userId) throws Exception {
		dao.deleteImage(userId);
	}
}
