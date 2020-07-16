package com.meng.onlinehomework.dao;

import java.util.List;
import java.util.Map;

import com.meng.onlinehomework.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User selectByUserId(String userid);
	
	List<User> selectAllUser();

	List<User> selectAllTeacher();

	List<User> selectByUsertype(Integer usertype);

	List<User> selectByKey(Map<String, Object> map);

	void updatePassworkById(Integer id);
}