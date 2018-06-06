package com.lahad.beans;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;


public class User {
	
	private int id;
	
    @NotEmpty(message = "Please enter your email.")
    @Pattern(regexp="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
    		+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message="Email format incorrect")
   // @Email(message = "Email format incorrect")
    private String email;
    
    @Pattern(message="userName format incorrect", regexp = "^[A-Za-z0-9_-]{5,15}$")
    @Size(min = 5, max = 15, message = "userName must be between 5 and 15 characters")
    private String userName; 
     
    @Size(min = 5, max = 15, message = "password must be between 5 and 15 characters")
    private String password;
    
    public User(){
		
	}
	public User(String email,String userName, String password){
		this.email = email;
		this.userName = userName;
		this.password = password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
 
    public String getEmail() {
        return email;
    }
 
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getUserName() {
        return userName;
    }
 
    public void setUserName(String userName) {
        this.userName = userName;
    }
 
    public String getPassword() {
        return password;
    }
 
    public void setPassword(String password) {
        this.password = password;
    }
}