package com.meng.onlinehomework.dao;

import java.util.Map;

import com.meng.onlinehomework.pojo.Homeworklist;

public interface HomeworklistMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Homeworklist record);

    int insertSelective(Homeworklist record);

    Homeworklist selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Homeworklist record);

    int updateByPrimaryKey(Homeworklist record);

	void addquestionone(Map<String, Integer> map);

	void addquestiontwo(Map<String, Integer> map);

	void addquestionthree(Map<String, Integer> map);

	void addquestionfour(Map<String, Integer> map);

	void addquestionfive(Map<String, Integer> map);

	Homeworklist selectquestionById(Integer id);
}