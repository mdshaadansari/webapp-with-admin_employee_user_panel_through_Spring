package com.example.project2_test.model.matchingQuesrStringKeyANDmodelPropertyNames;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
 
 
public class contactPersonExtra {
 
 
public int contactPersonId ;
 
	private String contactPersonName;
 
	private String contactPersonEmail; 
	private String contactPersonPhone;
 
	private String contactPersonDesignation;

 
	private String clientIdInContactPerson;
	
 
public contactPersonExtra(String contactPersonName, String contactPersonEmail, String contactPersonPhone,
		String contactPersonDesignation, String clientIdInContactPerson) {
	super();
	this.contactPersonName = contactPersonName;
	this.contactPersonEmail = contactPersonEmail;
	this.contactPersonPhone = contactPersonPhone;
	this.contactPersonDesignation = contactPersonDesignation;
	this.clientIdInContactPerson = clientIdInContactPerson;
}
 
	public contactPersonExtra() {
		super();
	}

	public String getContactPersonName() {
		return contactPersonName;
	}

	public void setContactPersonName(String contactPersonName) {
		this.contactPersonName = contactPersonName;
	}

	public String getContactPersonEmail() {
		return contactPersonEmail;
	}

	public void setContactPersonEmail(String contactPersonEmail) {
		this.contactPersonEmail = contactPersonEmail;
	}

	public String getContactPersonPhone() {
		return contactPersonPhone;
	}

	public void setContactPersonPhone(String contactPersonPhone) {
		this.contactPersonPhone = contactPersonPhone;
	}

	public String getContactPersonDesignation() {
		return contactPersonDesignation;
	}

	public void setContactPersonDesignation(String contactPersonDesignation) {
		this.contactPersonDesignation = contactPersonDesignation;
	}

	public String getClientIdInContactPerson() {
		return clientIdInContactPerson;
	}

	public void setClientIdInContactPerson(String clientIdInContactPerson) {
		this.clientIdInContactPerson = clientIdInContactPerson;
	}

}