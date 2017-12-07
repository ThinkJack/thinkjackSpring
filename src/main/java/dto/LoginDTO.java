package dto;

public class LoginDTO {
	private String userEmail;
	private String userPassword;
	private boolean useCookies;

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

	@Override
	public String toString() {
		return "LoginDTO{" +
				"userEmail='" + userEmail + '\'' +
				", userPassword='" + userPassword + '\'' +
				", useCookies=" + useCookies +
				'}';
	}
}
