package service;

import domain.UserVO;
import dto.LoginDTO;

public interface UserService {
	public void regist(UserVO user) throws Exception;

	public UserVO login(LoginDTO dto) throws Exception;
	
}
