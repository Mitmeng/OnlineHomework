package com.meng.onlinehomework.dao;

import java.util.List;

import com.meng.onlinehomework.pojo.Course;

public interface CourseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);

	List<Course> selectByTeacherId(String loginuserid);

	Course selectByCourseId(String courseid);

	String selectCourseIdById(int parseInt);

	List<Course> selectAll();

	void updateTotaladdByCourseid(String courseid);

	Integer getTotalByCourseId(String courseid);

	void updateTotaldownByCourseId(String courseid);
}