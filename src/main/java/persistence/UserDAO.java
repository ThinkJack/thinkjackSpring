package persistence;

import domain.BoardVO;
import domain.SearchCriteria;
import domain.UserCriteria;
import domain.UserVO;
import dto.LoginDTO;

import java.util.List;

public interface UserDAO {
	public void insertUser(UserVO vo) throws Exception;

	public UserVO login(LoginDTO dto) throws Exception;

	public UserVO read(UserVO vo) throws Exception;

	public void updateUser(UserVO vo) throws Exception;

	public void deleteUser(UserVO vo) throws Exception;

	public void naverInsertUser(LoginDTO dto) throws Exception;

	public UserVO naverReadUser(LoginDTO dto) throws Exception;

	public void createAuthKey(String userEmail, String userAuthCode) throws Exception;

	public UserVO chkAuth(UserVO vo) throws Exception;

	public void userAuth(UserVO vo) throws Exception;

	public UserVO authenticate(String str) throws Exception;

	public UserVO authenticateName(String str) throws Exception;

	public void updateAuthKey(String userEmail, String userAuthCode) throws Exception;

	public void updatePassword(UserVO vo) throws Exception;

	public void successAuth (UserVO vo) throws Exception;

    public List<BoardVO> boardSearch(UserCriteria cri)throws Exception;

    public int boardSearchCount(UserCriteria cri)throws Exception;

	String getUserProfile(int userId) throws Exception;

}