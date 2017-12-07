package persistence;

import domain.UserVO;
import dto.LoginDTO;

public interface UserDAO {
	public void insertUser(UserVO vo) throws Exception;
	
	public UserVO login(LoginDTO dto)throws Exception;
		
}
