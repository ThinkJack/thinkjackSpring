package persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import domain.UserVO;
import dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject
	private SqlSession session;
	
	final String namespace = "mapper.UserMapper";
		
	
	
	@Override
	public void insertUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".insertUser",vo);
	}

	@Override
	public void createAuthKey(String userEmail, String userAuthCode) throws Exception {
		UserVO vo = new UserVO();
		vo.setUserAuthCode(userAuthCode);
		vo.setUserEmail(userEmail);

		session.selectOne(namespace + ".createAuthKey", vo);
	}

	@Override
	public void userAuth(String userEmail) throws Exception {

		System.out.println("userEmail"+userEmail);
		session.update(namespace + ".userAuth", userEmail);
	}

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
		//System.out.println("userDAO dto: "+dto);
		return session.selectOne(namespace+".login",dto);
			
	}

	@Override
	public UserVO read(UserVO vo) throws Exception {
		return session.selectOne(namespace+".readUser",vo);
	}

	@Override
	public void updateUser(UserVO vo) throws Exception {
		System.out.println(vo);
		session.update(namespace+".updateUser",vo);
	}

	@Override
	public void deleteUser(UserVO vo) throws Exception {
		session.update(namespace+".deleteUser",vo);
	}

	@Override
	public void naverInsertUser(LoginDTO dto) throws Exception {
		System.out.println("naverInsertUser "+dto);
		session.insert(namespace+".naverInsertUser",dto);
	}

	@Override
	public UserVO naverReadUser(LoginDTO dto) throws Exception {
		return session.selectOne(namespace+".naverReadUser",dto);
	}
}
