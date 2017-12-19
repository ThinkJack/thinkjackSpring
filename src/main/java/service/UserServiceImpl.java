package service;

import javax.inject.Inject;

import common.MailHandler;
import common.TempKey;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import domain.UserVO;
import dto.LoginDTO;
import persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO dao;

	@Inject
	private JavaMailSender mailSender;

	@Override
	public void regist(UserVO user) throws Exception {

		//System.out.println(user);
		dao.insertUser(user);
		System.out.println(user);
		String key = new TempKey().getKey(50,false);

		dao.createAuthKey(user.getUserEmail(),key); //인증키 db 저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Thinkjack 서비스 이메일 인증]");
		sendMail.setText(
				new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost:8080/user/emailConfirm?userEmail=").append(user.getUserEmail()).append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("testmailsender1122@gmail.com", "Thinkjack 개발자");
		System.out.println("getEmail"+user.getUserEmail());
		sendMail.setTo(user.getUserEmail());
		sendMail.send();
		
	}

	@Override
	public void userAuth(String userEmail) throws Exception {
		dao.userAuth(userEmail);
	}


	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		//System.out.println("service dto: "+dto);
		return dao.login(dto);
	}

	@Override
	public void modifyUser(UserVO user) throws Exception {
		dao.updateUser(user);

	}

	@Override
	public void deleteUser(UserVO user) throws Exception {
		System.out.println(user);
		dao.deleteUser(user);
	}

	@Override
	public UserVO naverLogin(LoginDTO dto) throws Exception {

		UserVO vo =new UserVO();

		vo=dao.naverReadUser(dto);
		//System.out.println(vo);
		if(vo==null){
		try{
		dao.naverInsertUser(dto);
		}catch (Exception e) {
			e.printStackTrace();
		}}
		return dao.naverReadUser(dto);
	}

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
		//facebook login 관련


	@Override
	public String authenticate(String str) throws Exception {
		System.out.println("인증 중");

		UserVO vo = dao.authenticate(str);

		if(vo == null) {
			return "T";
		}else if(vo.getUserState() == 0){
			return "F";
		}else{
			return "D";
		}
	}
}
