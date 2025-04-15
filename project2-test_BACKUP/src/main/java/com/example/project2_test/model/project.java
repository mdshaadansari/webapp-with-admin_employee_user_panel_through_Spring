package com.example.project2_test.model ;

import java.util.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
 

@Entity
@Table(name="project")
public class project{

/*
| -> project-id [project id gets generated automatically in the given format [project-001 | project-002 ...]]
		| -> project-name 
		| -> project-start-date
		| -> project-end-date
		| -> client
		| -> employee
*/
	@Id
	@Column
private String projectId;
	@Column
private String projectName;
	@Column(name="projectDateOfStart")
private String startDate;
	@Column(name="projectDateOfEnd")
private String endDate;
	@Column(name = "clientIdInProject")
private String clientIdInProject;

	/*	
	@ManyToOne
	@JoinColumn(name = "clientIdInProject", referencedColumnName = "clientid")
private client clientIdInProject;

	@OneToMany(mappedBy="projectIdInEmployee")
private List<employee> employee;
*/
	
	
public project(String projectId, String projectName, String startDate, String endDate, String clientIdInProject) {
	super();
	this.projectId = projectId;
	this.projectName = projectName;
	this.startDate = startDate;
	this.endDate = endDate;
	this.clientIdInProject = clientIdInProject;
}
public project() {
		super();
	}
public project(String projectId, String projectName, String startDate, String endDate) {
	super();
	this.projectId = projectId;
	this.projectName = projectName;
	this.startDate = startDate;
	this.endDate = endDate;
}
public String getProjectId() {
	return projectId;
}
public void setProjectId(String projectId) {
	this.projectId = projectId;
}
public String getProjectName() {
	return projectName;
}
public void setProjectName(String projectName) {
	this.projectName = projectName;
}
public String getStartDate() {
	return startDate;
}
public void setStartDate(String startDate) {
	this.startDate = startDate;
}
public String getEndDate() {
	return endDate;
}
public void setEndDate(String endDate) {
	this.endDate = endDate;
}
public String getClientIdInProject() {
	return clientIdInProject;
}
public void setClientIdInProject(String clientIdInProject) {
	this.clientIdInProject = clientIdInProject;
}
/*
//@OneToMany(mappedBy="project")
private employee employee;


//@OneToMany(mappedBy="clientId")
private client client;

*/



}