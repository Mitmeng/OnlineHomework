package com.meng.onlinehomework.Service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meng.onlinehomework.Service.UserService;
import com.meng.onlinehomework.dao.UserMapper;
import com.meng.onlinehomework.pojo.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired 
	private UserMapper userMapper;

	@Override
	public boolean userLogin(String userid, String password) {
		// TODO Auto-generated method stub
		
		if(password.equals(findUserPwdByUserid(userid)))
			return true;
		else
			return false;
	}

	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		userMapper.insert(user);
		return 0;
	}

	@Override
	public int addUserList(List<User> list) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteUserById(Integer id) {
		// TODO Auto-generated method stub
		int i = userMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteAll(List<String> list) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public User findUserInfoByUserid(String userid) {
		// TODO Auto-generated method stub
		return userMapper.selectByUserId(userid);
	}

	@Override
	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public String findUserPwdByUserid(String userid) {
		// TODO Auto-generated method stub
		return userMapper.selectByUserId(userid).getPassword();
	}

	@Override
	public List<User> findAllTeacher() {
		// TODO Auto-generated method stub
		return userMapper.selectAllTeacher();
	}

	@Override
	public List<User> finduserByUsertype(Integer usertype) {
		// TODO Auto-generated method stub
		return userMapper.selectByUsertype(usertype);
	}

	@Override
	public List<User> selectByKey(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectByKey(map);
	}

	@Override
	public void updateuserByid(User user) {
		// TODO Auto-generated method stub
		userMapper.updateByPrimaryKey(user);
	}

	@Override
	public void updatePasswordById(Integer id) {
		// TODO Auto-generated method stub
		userMapper.updatePassworkById(id);
	}

	@Override
	public User findById(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(id);
	}

	

}
