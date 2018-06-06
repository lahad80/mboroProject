package com.lahad.DAO;


import java.util.List;

import com.lahad.beans.User;



public interface UserDAO {
	
	   public void addUser(String email, String userName, String password);
	   public User findUserById(int id);
	   public List<User> findUserByEmail(String theEmail);
	   public boolean isEmailAvailable(String email);
	   public Boolean isUserNameAvailable(String theUserName);
	   public void updateUser(int id, String email, String userName, String password);
	   public void deleteUser(int id);
}


