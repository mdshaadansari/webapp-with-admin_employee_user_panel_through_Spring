package com.example.project2_test.model.matchingQuesrStringKeyANDmodelPropertyNames;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
 
public class employeeExtra{ 
private String employeeId; 
private String employeeDOJ; 
private String employeeName; 
private String employeeDept; 
private String employeeEmail; 
private String employeePhone;
	 	
	private String projectIdInEmployee;
	 
	
public employeeExtra() {
		super();
	}
public String getProjectIdInEmployee() {
	return projectIdInEmployee;
}
public void setProjectIdInEmployee(String projectIdInEmployee) {
	this.projectIdInEmployee = projectIdInEmployee;
}
public employeeExtra(String employeeId, String employeeDOJ, String employeeName, String employeeDept, String employeeEmail,
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
public employeeExtra(String employeeId, String employeeDOJ, String employeeName, String employeeDept, String employeeEmail,
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