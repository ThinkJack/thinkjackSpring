package service;

import domain.UserVO;
import dto.LoginDTO;

public interface UserService {
	public void regist(UserVO user) throws Exception;

	public UserVO login(LoginDTO dto) throws Exception;

	public void modifyUser(UserVO user) throws Exception;

	public UserVO naverLogin(LoginDTO dto) throws Exception;
}
