package com.example.project2_test.model.matchingQuesrStringKeyANDmodelPropertyNames ;

import java.util.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
 
 
public class projectExtra{
 
private String projectId; 
private String projectName; 
private String startDate; 
private String endDate; 
private String clientIdInProject;
 
	
public projectExtra(String projectId, String projectName, String startDate, String endDate, String clientIdInProject) {
	super();
	this.projectId = projectId;
	this.projectName = projectName;
	this.startDate = startDate;
	this.endDate = endDate;
	this.clientIdInProject = clientIdInProject;
}
public projectExtra() {
		super();
	}
public projectExtra(String projectId, String projectName, String startDate, String endDate) {
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


}