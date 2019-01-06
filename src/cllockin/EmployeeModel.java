package cllockin;

import java.util.Date;

public class EmployeeModel {

	private int empid;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String phone;
	private int id;
	private String active;
	private String date;
	private double hourlyRate;
	
	public EmployeeModel() {}
	
	public EmployeeModel(String firstName, String lastName, String email, 
			String phone, String password, int id, String active, int empid, String date, double hourlyRate) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.id = id;
		this.active = active;
		this.empid = empid;
		this.date = date;
		this.hourlyRate = hourlyRate;
	}
	
	public boolean employeeCompare(EmployeeModel emp) {
		if(this.firstName.equals(emp.firstName) && this.lastName.equals(emp.lastName) && this.empid == emp.empid 
				&& this.email.equals(emp.email) && this.password.equals(emp.password) && this.phone.equals(emp.phone)
				&& this.id == emp.id && this.active.equals(emp.active) && this.date.equals(emp.date) 
				&& this.hourlyRate ==emp.hourlyRate) {
			return true;
		}
		return false;
	}
	
	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String toString() {
		return firstName + " | " + lastName + " | " + email + " | " + password  + " | " + phone + 
				" | " + id + " | " + active + " | " + empid + " | " + date + " | " + hourlyRate;
	}
	
	public double getHourlyRate() {
		return hourlyRate;
	}

	public void setHourlyRate(double hourlyRate) {
		this.hourlyRate = hourlyRate;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}

	public int getEmpid() {
		return empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}
	
	
	
}
