package cllockin;

public class BusinessModel {
	
	private String firstName;
	private String lastName;
	private String accountEmail;
	private String accountpassword;
	private String businessName;
	private String businessPhone;
	private String defaultPaymentPeriod;
	private String accountType;
	
	public BusinessModel() {}
	
	public BusinessModel(String firstName, String lastName, String accountEmail, String accountPassword, 
			String businessName, String businessPhone, String defaultPaymentPeriod, String accountType) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.accountEmail = accountEmail;
		this.accountpassword = accountPassword;
		this.businessName = businessName;
		this.businessPhone = businessPhone;
		this.defaultPaymentPeriod = defaultPaymentPeriod;
		this.accountType = accountType;
	}
	
	public String toString() {
		return firstName + " | " + lastName + " | " + accountEmail + " | " + accountpassword + " | " + businessName + " | " + businessPhone
				+ " | " + defaultPaymentPeriod + " | " + accountType;
	}
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAccountEmail() {
		return accountEmail;
	}
	public void setAccountEmail(String accountEmail) {
		this.accountEmail = accountEmail;
	}
	public String getAccountpassword() {
		return accountpassword;
	}
	public void setAccountpassword(String accountpassword) {
		this.accountpassword = accountpassword;
	}
	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	public String getBusinessPhone() {
		return businessPhone;
	}
	public void setBusinessPhone(String businessPhone) {
		this.businessPhone = businessPhone;
	}
	public String getDefaultPaymentPeriod() {
		return defaultPaymentPeriod;
	}
	public void setDefaultPaymentPeriod(String defaultPaymentPeriod) {
		this.defaultPaymentPeriod = defaultPaymentPeriod;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	

}
