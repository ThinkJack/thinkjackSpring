package domain;

public class UserVO {

	private int userId;
	private String userEmail;
	private String userName;
	private String userPassword;
	private int userState;
	private String userSocialId;
	private String userAuthCode;
	private String userProfile;



	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public int getUserState() {
		return userState;
	}

	public void setUserState(int userState) {
		this.userState = userState;
	}

	public String getUserSocialId() {
		return userSocialId;
	}

	public void setUserSocialId(String userSocialId) {
		this.userSocialId = userSocialId;
	}

	public String getUserAuthCode() {
		return userAuthCode;
	}

	public void setUserAuthCode(String userAuthCode) {
		this.userAuthCode = userAuthCode;
	}

	public String getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}

	@Override
	public String toString() {
		return "UserVO{" +
				"userId=" + userId +
				", userEmail='" + userEmail + '\'' +
				", userName='" + userName + '\'' +
				", userPassword='" + userPassword + '\'' +
				", userState=" + userState +
				", userSocialId='" + userSocialId + '\'' +
				", userAuthCode='" + userAuthCode + '\'' +
				", userProfile='" + userProfile + '\'' +
				'}';
	}
}
