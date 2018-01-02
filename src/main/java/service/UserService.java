package service;

import domain.UserVO;
import dto.LoginDTO;
import org.springframework.social.facebook.api.User;

public interface UserService {
	public void regist(UserVO user) throws Exception;

	public UserVO login(LoginDTO dto) throws Exception;

	public UserVO modifyUser(UserVO user) throws Exception;

	public UserVO naverLogin(LoginDTO dto) throws Exception;

	public UserVO googleLogin(LoginDTO dto) throws Exception;

	public UserVO userAuth(UserVO user) throws Exception;

	public void deleteUser(UserVO user) throws Exception;

	public String authenticate(String str) throws Exception;

	public String authenticateName(String str) throws Exception;

	public void findPassword(UserVO user) throws Exception;

	public void modifypassUser(UserVO user) throws Exception;

}
