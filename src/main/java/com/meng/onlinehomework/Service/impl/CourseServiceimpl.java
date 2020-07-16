package com.meng.onlinehomework.Service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.meng.onlinehomework.Service.CourseService;
import com.meng.onlinehomework.dao.CourseMapper;
import com.meng.onlinehomework.pojo.Course;

@Service
@Transactional
public class CourseServiceimpl implements CourseService {

	@Autowired
	private CourseMapper courseMapper;
	
	@Override
	public List<Course> GetCourseByteaid(String loginuserid) {
		// TODO Auto-generated method stub
		List<Course> list = new ArrayList<Course>();
		list = courseMapper.selectByTeacherId(loginuserid);
		return list;
	}

	@Override
	public void AddNewCourse(Course course) {
		// TODO Auto-generated method stub
		courseMapper.insert(course);
	}

	@Override
	public int deleCourseById(Integer id) {
		// TODO Auto-generated method stub
		return courseMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Course GetCourseByCourseid(String courseid) {
		// TODO Auto-generated method stub
		return courseMapper.selectByCourseId(courseid);
	}

	@Override
	public String selectCourseIdById(int parseInt) {
		// TODO Auto-generated method stub
		return courseMapper.selectCourseIdById(parseInt);
	}

	@Override
	public List<Course> selectAll() {
		// TODO Auto-generated method stub
		return courseMapper.selectAll();
	}

	@Override
	public void updateTotaladdByCourseid(String courseid) {
		// TODO Auto-generated method stub
		courseMapper.updateTotaladdByCourseid(courseid);
	}

	@Override
	public Integer getTotalByCourseid(String courseid) {
		// TODO Auto-generated method stub
		return courseMapper.getTotalByCourseId(courseid);
	}

	@Override
	public void updateTotaldownByCourseId(String courseid) {
		// TODO Auto-generated method stub
		courseMapper.updateTotaldownByCourseId(courseid);
	}

}
