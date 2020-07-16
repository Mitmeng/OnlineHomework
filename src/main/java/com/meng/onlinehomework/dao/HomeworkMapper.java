package com.meng.onlinehomework.dao;

import java.util.List;
import java.util.Map;

import com.meng.onlinehomework.pojo.Homework;

public interface HomeworkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Homework record);

    int insertSelective(Homework record);

    Homework selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Homework record);

    int updateByPrimaryKey(Homework record);

	List<Homework> selectByCourseidandType(Map<String, Object> map);

	String[] selectIdByCourseid(String courseid);

	void deleteByCourseId(String courseid);

	List<Homework> selectByCourseid(String courseid);

	List<Homework> selectByhomeworktype(Integer homeworktype);

	List<Homework> selectBykeyandhomeworktype(Map<String, Object> map);

	void updateById(Map<String, Object> map);

}