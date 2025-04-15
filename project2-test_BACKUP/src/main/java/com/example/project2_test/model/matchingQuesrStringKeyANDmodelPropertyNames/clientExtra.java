package com.example.project2_test.model.matchingQuesrStringKeyANDmodelPropertyNames; 
  
public class clientExtra{ 
	 
private String clientID;
	 
private String clientName;
	 
private String emailClient;
	 
private String clientRelationshaipDate;

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

public clientExtra(String clientID, String clientName, String emailClient, String clientRelationshaipDate) {
	super();
	this.clientID = clientID;
	this.clientName = clientName;
	this.emailClient = emailClient;
	this.clientRelationshaipDate = clientRelationshaipDate;
}
 


}