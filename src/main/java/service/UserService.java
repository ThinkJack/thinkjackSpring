package service;

import domain.UserVO;
import dto.LoginDTO;
import org.springframework.social.facebook.api.User;

public interface UserService {
	public void regist(UserVO user) throws Exception;

	public UserVO login(LoginDTO dto) throws Exception;

	public void modifyUser(UserVO user) throws Exception;

	public UserVO naverLogin(LoginDTO dto) throws Exception;

	public UserVO googleLogin(LoginDTO dto) throws Exception;

	public void userAuth(String userEmail) throws Exception;

	public void deleteUser(UserVO user) throws Exception;
}
