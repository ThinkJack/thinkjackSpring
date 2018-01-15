package persistence;

import javax.inject.Inject;

import domain.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dto.LoginDTO;

import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject
	private SqlSession session;
	
	final String namespace = "mapper.UserMapper";

	//회원 정보 입력
	@Override
	public void insertUser(UserVO vo) throws Exception {
		session.insert(namespace+".insertUser",vo);
	}
	//email 중복 확인
	@Override
	public UserVO authenticate(String str) throws Exception {
		return session.selectOne(namespace+".checkdupl", str);
	}
	//이름 중복 확인
	@Override
	public UserVO authenticateName(String str) throws Exception {
		return session.selectOne(namespace+".checkduplName", str);
	}
	//해당 email에 인증 키 업데이트
	@Override
	public void createAuthKey(String userEmail, String userAuthCode) throws Exception {
		UserVO vo = new UserVO();
		vo.setUserAuthCode(userAuthCode);
		vo.setUserEmail(userEmail);
		session.update(namespace + ".createAuthKey", vo);
	}
	//이메일 인증 코드 확인
	@Override
	public UserVO chkAuth(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".chkAuth", vo);
	}
	//인증 후 계정 활성화
	@Override
	public void userAuth(UserVO vo) throws Exception {
		session.update(namespace + ".userAuth", vo);
	}
	//로그인 검증
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return session.selectOne(namespace+".login",dto);
	}
	//유저 정보 확인
	@Override
	public UserVO read(UserVO vo) throws Exception {
		return session.selectOne(namespace+".readUser",vo);
	}
	//유저 정보 변경 후 업데이트
	@Override
	public void updateUser(UserVO vo) throws Exception {
		System.out.println(vo);
		session.update(namespace+".updateUser",vo);
	}
	//회원 탈퇴
	@Override
	public void deleteUser(UserVO vo) throws Exception {
		session.update(namespace+".deleteUser",vo);
	}
	//소셜 로그인 회원 정보 입력
	@Override
	public void naverInsertUser(LoginDTO dto) throws Exception {
		session.insert(namespace+".naverInsertUser",dto);
	}
	//소셜 로그인 회원 정보 확인
	@Override
	public UserVO naverReadUser(LoginDTO dto) throws Exception {
		return session.selectOne(namespace+".naverReadUser",dto);
	}
	//인증 키 재발급
	@Override
	public void updateAuthKey(String userEmail, String userAuthCode) throws Exception {
		UserVO vo = new UserVO();
		vo.setUserAuthCode(userAuthCode);
		vo.setUserEmail(userEmail);
		session.update(namespace + ".createAuthKey", vo);
	}
	//패스워드 변경
	@Override
	public void updatePassword(UserVO vo) throws Exception {
		session.update(namespace+".updatePassword",vo);
	}
	//인증 후 인증키 삭제
	@Override
	public void successAuth(UserVO vo) throws Exception {
		session.update(namespace+".successAuth",vo);
	}
	//myinfo 보드 관련 설정
	@Override
	public List<BoardVO> boardSearch(UserCriteria cri) throws Exception {
		return session.selectList(namespace + ".boardSearch", cri);
	}
	@Override
	public int boardSearchCount(UserCriteria cri) throws Exception {
		return session.selectOne(namespace+ ".boardSearchCount", cri);
	}

	@Override
	public List<SrcVO> selectSrcList(UserCriteria cri) {
		return session.selectList(namespace+".srcSearch",cri);
	}

	@Override
	public int srcListSearchCount(UserCriteria cri) throws Exception {
		return session.selectOne(namespace+ ".srcSearchCount", cri);
	}

	@Override
	public String getUserProfile(int userId) throws Exception {
		return session.selectOne(namespace + ".getUserProfile", userId);
	}

	@Override
	public UserVO getUserPw(String userEmail) throws Exception {
		return session.selectOne(namespace + ".getUserPassword",userEmail);
	}
}
