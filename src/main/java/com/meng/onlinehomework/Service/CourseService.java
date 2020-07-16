package com.meng.onlinehomework.Service;

import java.util.List;

import com.meng.onlinehomework.pojo.Course;

public interface CourseService {

	List<Course> GetCourseByteaid(String loginuserid);

	void AddNewCourse(Course course);

	int deleCourseById(Integer id);

	Course GetCourseByCourseid(String courseid);

	String selectCourseIdById(int parseInt);

	List<Course> selectAll();

	void updateTotaladdByCourseid(String courseid);

	Integer getTotalByCourseid(String courseid);

	void updateTotaldownByCourseId(String courseid);

	

}
