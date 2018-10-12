package cllockin;

public class EmployeeModel {

	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String phone;
	private double weeklyHoursWorked;
	private double biWeeklyHoursWorked;
	private double monthlyHoursWorked;
	private double totalHoursWorked;
	private boolean paid;
	
	public EmployeeModel() {}
	
	public EmployeeModel(String firstName, String lastName, String email, String phone, String password) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.weeklyHoursWorked = 0.0;
		this.monthlyHoursWorked = 0.0;
		this.setBiWeeklyHoursWorked(0.0);
		this.totalHoursWorked = 0.0;
		this.paid = false;
	}
	
	public String toString() {
		return firstName + " | " + lastName + " | " + email + " | " + password + " | " + weeklyHoursWorked + " | " + biWeeklyHoursWorked
				+ " | " + monthlyHoursWorked + " | " + totalHoursWorked + " | " + paid;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public double getWeeklyHoursWorked() {
		return weeklyHoursWorked;
	}
	public void setWeeklyHoursWorked(double weeklyHoursWorked) {
		this.weeklyHoursWorked = weeklyHoursWorked;
	}
	public double getMonthlyHoursWorked() {
		return monthlyHoursWorked;
	}
	public void setMonthlyHoursWorked(double monthlyHoursWorked) {
		this.monthlyHoursWorked = monthlyHoursWorked;
	}
	public double getTotalHoursWorked() {
		return totalHoursWorked;
	}
	public void setTotalHoursWorked(double totalHoursWorked) {
		this.totalHoursWorked = totalHoursWorked;
	}
	public boolean isPaid() {
		return paid;
	}
	public void setPaid(boolean paid) {
		this.paid = paid;
	}



	public double getBiWeeklyHoursWorked() {
		return biWeeklyHoursWorked;
	}



	public void setBiWeeklyHoursWorked(double biWeeklyHoursWorked) {
		this.biWeeklyHoursWorked = biWeeklyHoursWorked;
	}
	
	
	
}
