package com.example.project2_test.model; 
 
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
 
@Entity
@Table(name="client")
public class client{
/*| -> client-id [client id gets generated automatically in the given format [client-001 | client-002 ...]]
		| -> client-name [company-name] 
		| -> contact-person-details [name | email | phone | designation]
			| -> a client can have more then one content-person.
		| -> client-relationship-date
		| -> projects.
*/
	@Id
	@Column 
private String clientID;
	@Column
private String clientName;
	@Column
private String emailClient;
	@Column
private String clientRelationshaipDate;

/*
@OneToMany(mappedBy = "clientIdInContactPerson")
private List<contactPerson> contactPerson;


@OneToMany(mappedBy = "clientIdInProject")
private List<project> project;
*/
	
	

public client(String clientID, String clientName, String emailClient, String clientRelationshaipDate) {
	super();
	this.clientID = clientID;
	this.clientName = clientName;
	this.emailClient = emailClient;
	this.clientRelationshaipDate = clientRelationshaipDate;
}
 

public client() {
	super();
}


public String getClientID() {
	return clientID;
}


public void setClientID(String clientID) {
	this.clientID = clientID;
}


public String getClientName() {
	return clientName;
}


public void setClientName(String clientName) {
	this.clientName = clientName;
}


public String getEmailClient() {
	return emailClient;
}


public void setEmailClient(String emailClient) {
	this.emailClient = emailClient;
}


public String getClientRelationshaipDate() {
	return clientRelationshaipDate;
}


public void setClientRelationshaipDate(String clientRelationshaipDate) {
	this.clientRelationshaipDate = clientRelationshaipDate;
}

 
 
  

 
 

 

/*
//@ManyToOne
//@JoinColumn(name="projectId", referencedColumnName="projectId")
//column will be maintained here
 private project project;
*/
}