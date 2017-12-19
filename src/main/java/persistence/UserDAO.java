package persistence;

import domain.UserVO;
import dto.LoginDTO;

public interface UserDAO {
	public void insertUser(UserVO vo) throws Exception;

	public UserVO login(LoginDTO dto) throws Exception;

	public UserVO read(UserVO vo) throws Exception;

	public void updateUser(UserVO vo) throws Exception;

	public void deleteUser(UserVO vo) throws Exception;

	public void naverInsertUser(LoginDTO dto) throws Exception;

	public UserVO naverReadUser(LoginDTO dto) throws Exception;

	public void createAuthKey(String userEmail, String userAuthCode) throws Exception;

	public void userAuth(String userEmail) throws Exception;

	public UserVO authenticate(String str) throws Exception;
}