package com.formhandler;

import java.io.IOException;

import com.bean.User;
import com.tool.SearchDBManager;

import atg.droplet.GenericFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

public class RegistrationFormHandler extends GenericFormHandler {
	private String userName;
	private String userId;
	private String password;
	private String dateOfBirth;
	private String email;
	private String address;
	private String sex;
	private User user;
	private SearchDBManager searchDBManager;

	public void preSubmitOperation(DynamoHttpServletRequest request,
			DynamoHttpServletResponse response) {
		User user1=new User();
		user1.setUserId(getUserId());
		user1.setUserName(getUserName());
		user1.setPassword(getPassword());
		user1.setSex(getSex());
		user1.setDateOfBirth(getDateOfBirth());
		user1.setEmail(getEmail());
		user1.setAddress(getAddress());
		setUser(user1);
	}

	public boolean handleSubmit(DynamoHttpServletRequest request,
			DynamoHttpServletResponse response) throws IOException {
		preSubmitOperation(request, response);
		if (searchDBManager.addUser(getUser())) {
			response.sendLocalRedirect("registrationSuccess.jsp", request);
			return Boolean.TRUE;
		}
		return Boolean.FALSE;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public SearchDBManager getSearchDBManager() {
		return searchDBManager;
	}

	public void setSearchDBManager(SearchDBManager searchDBManager) {
		this.searchDBManager = searchDBManager;
	}

}
