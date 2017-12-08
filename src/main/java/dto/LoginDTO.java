package dto;

public class LoginDTO {
	private String userEmail;
	private String userPassword;
	private boolean useCookies;
	private String userSocialId;
	private String userName;

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public boolean isUseCookies() {
		return useCookies;
	}

	public void setUseCookies(boolean useCookies) {
		this.useCookies = useCookies;
	}

	public String getUserSocialId() {
		return userSocialId;
	}

	public void setUserSocialId(String userSocialId) {
		this.userSocialId = userSocialId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "LoginDTO{" +
				"userEmail='" + userEmail + '\'' +
				", userPassword='" + userPassword + '\'' +
				", useCookies=" + useCookies +
				", userSocialId='" + userSocialId + '\'' +
				", userName='" + userName + '\'' +
				'}';
	}
}
