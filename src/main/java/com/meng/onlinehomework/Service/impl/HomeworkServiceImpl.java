package com.meng.onlinehomework.Service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meng.onlinehomework.Service.HomeworkService;
import com.meng.onlinehomework.dao.HomeworkMapper;
import com.meng.onlinehomework.pojo.Homework;

@Service
@Transactional
public class HomeworkServiceImpl implements HomeworkService{

	@Autowired
	private HomeworkMapper homeworkMapper;

	@Override
	public void Addnewhomework(Homework homework) {
		// TODO Auto-generated method stub
		homeworkMapper.insert(homework);
	}

	@Override
	public List<Homework> GetHomeworkByCourseidAndtype(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return homeworkMapper.selectByCourseidandType(map);
	}

	@Override
	public Homework GetHomeworkById(Integer homeworkid) {
		// TODO Auto-generated method stub
		return homeworkMapper.selectByPrimaryKey(homeworkid);
	}

	@Override
	public String[] findhomeworkidByCourseid(String courseid) {
		// TODO Auto-generated method stub
		return homeworkMapper.selectIdByCourseid(courseid);
	}

	@Override
	public void deleHomeworkByCourseId(String courseid) {
		// TODO Auto-generated method stub
		homeworkMapper.deleteByCourseId(courseid);
	}

	@Override
	public List<Homework> findhomeworkByCourseid(String courseid) {
		// TODO Auto-generated method stub
		return homeworkMapper.selectByCourseid(courseid);
	}

	@Override
	public void deleHomeworkById(Integer id) {
		// TODO Auto-generated method stub
		homeworkMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Homework> findByHomeworktype(Integer homeworktype) {
		// TODO Auto-generated method stub
		return homeworkMapper.selectByhomeworktype(homeworktype);
	}

	@Override
	public List<Homework> findBykeyword(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return homeworkMapper.selectBykeyandhomeworktype(map);
	}

	@Override
	public void updatehomeworkById(Map<String, Object> map) {
		// TODO Auto-generated method stub
		homeworkMapper.updateById(map);
	}
	
	
}
