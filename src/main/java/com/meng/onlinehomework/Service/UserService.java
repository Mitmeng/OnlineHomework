package com.meng.onlinehomework.Service;

import java.util.List;
import java.util.Map;

import com.meng.onlinehomework.pojo.User;

public interface UserService {
	
	public boolean userLogin(String userid,String password)throws Exception;
	
	public int addUser(User user);
	
	public int addUserList(List<User> list)throws Exception;
	
	public void deleteUserById(Integer id);
	
	public int deleteAll(List<String> list)throws Exception;
	
	public User findUserInfoByUserid(String userid)throws Exception;
	
	public String findUserPwdByUserid(String userid)throws Exception;
	
	public List<User> findAllUser()throws Exception;

	public List<User> findAllTeacher();

	public List<User> finduserByUsertype(Integer usertype);

	public List<User> selectByKey(Map<String, Object> map);

	public void updateuserByid(User user);

	public void updatePasswordById(Integer id);

	public User findById(Integer id);


}
