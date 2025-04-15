package com.example.project2_test.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="employee")
public class employee{
/*
	| -> define a category employee 
		| -> employee-id [employee id gets generated automatically in the given format [JTC-001 | JTC-002 ...]]
		| -> employee-name
		| -> employee-dept
		| -> employee-email [employee-email must be unique [red :- email is already in use [JSP] | green :- successful registration]]
		| -> employee-phone. 
		| -> employee-date-of-joining [dd-mm-yyyy [current-date]]
		| -> project
*/
	@Id
	@Column 
private String employeeId;
	@Column(name="employeeDOJ")
private String employeeDOJ;
	@Column(name="employeeName")
private String employeeName;
	@Column(name="employeeDept")
private String employeeDept;
	@Column(name="employeeEmail")
private String employeeEmail;
	@Column(name="employeePhone")
private String employeePhone;
	
	 @Column(name="projectIdInEmployee")	
	private String projectIdInEmployee;
	
	/*
	@ManyToOne
	@JoinColumn(name="projectIdInEmployee", referencedColumnName = "projectId")	
private project projectIdInEmployee;
*/
	
	
public employee() {
		super();
	}
public String getProjectIdInEmployee() {
	return projectIdInEmployee;
}
public void setProjectIdInEmployee(String projectIdInEmployee) {
	this.projectIdInEmployee = projectIdInEmployee;
}
public employee(String employeeId, String employeeDOJ, String employeeName, String employeeDept, String employeeEmail,
		String employeePhone, String projectIdInEmployee) {
	super();
	this.employeeId = employeeId;
	this.employeeDOJ = employeeDOJ;
	this.employeeName = employeeName;
	this.employeeDept = employeeDept;
	this.employeeEmail = employeeEmail;
	this.employeePhone = employeePhone;
	this.projectIdInEmployee = projectIdInEmployee;
}
public employee(String employeeId, String employeeDOJ, String employeeName, String employeeDept, String employeeEmail,
		String employeePhone) {
	super();
	this.employeeId = employeeId;
	this.employeeDOJ = employeeDOJ;
	this.employeeName = employeeName;
	this.employeeDept = employeeDept;
	this.employeeEmail = employeeEmail;
	this.employeePhone = employeePhone;
}
public String getEmployeeId() {
	return employeeId;
}
public void setEmployeeId(String employeeId) {
	this.employeeId = employeeId;
}
public String getEmployeeDOJ() {
	return employeeDOJ;
}
public void setEmployeeDOJ(String employeeDOJ) {
	this.employeeDOJ = employeeDOJ;
}
public String getEmployeeName() {
	return employeeName;
}
public void setEmployeeName(String employeeName) {
	this.employeeName = employeeName;
}
public String getEmployeeDept() {
	return employeeDept;
}
public void setEmployeeDept(String employeeDept) {
	this.employeeDept = employeeDept;
}
public String getEmployeeEmail() {
	return employeeEmail;
}
public void setEmployeeEmail(String employeeEmail) {
	this.employeeEmail = employeeEmail;
}
public String getEmployeePhone() {
	return employeePhone;
}
public void setEmployeePhone(String employeePhone) {
	this.employeePhone = employeePhone;
}
@Override
public String toString() {
	return "employee [employeeId=" + employeeId + ", employeeDOJ=" + employeeDOJ + ", employeeName=" + employeeName
			+ ", employeeDept=" + employeeDept + ", employeeEmail=" + employeeEmail + ", employeePhone=" + employeePhone
			+ ", projectIdInEmployee=" + projectIdInEmployee + "]";
}


//@ManyToOne
//@JoinColumn(name="projectId", referencedColumnName="projectId")
//column will be maintained here
 




}