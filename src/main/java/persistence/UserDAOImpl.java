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
	public UserVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("userDAO dto: "+dto);
		return session.selectOne(namespace+".login",dto);
			
	}
	
	

}
