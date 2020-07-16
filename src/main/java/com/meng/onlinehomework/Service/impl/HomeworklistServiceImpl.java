package com.meng.onlinehomework.Service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meng.onlinehomework.Service.HomeworklistService;
import com.meng.onlinehomework.dao.HomeworklistMapper;
import com.meng.onlinehomework.pojo.Homeworklist;
@Service
@Transactional
public class HomeworklistServiceImpl implements HomeworklistService {

	@Autowired
	private HomeworklistMapper homeworklistMapper;
	
	@Override
	public void addStuHomeworklist(Homeworklist homeworklist) {
		// TODO Auto-generated method stub
		homeworklistMapper.insert(homeworklist);
	}

	@Override
	public Homeworklist findById(Integer homeworklistid) {
		// TODO Auto-generated method stub
		return homeworklistMapper.selectByPrimaryKey(homeworklistid);
	}

	@Override
	public void addquestionone(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		homeworklistMapper.addquestionone(map);
	}

	@Override
	public void addquestiontwo(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		homeworklistMapper.addquestiontwo(map);
	}

	@Override
	public void addquestionthree(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		homeworklistMapper.addquestionthree(map);
	}

	@Override
	public void addquestionfour(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		homeworklistMapper.addquestionfour(map);
	}

	@Override
	public void addquestionfive(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		homeworklistMapper.addquestionfive(map);
	}

	@Override
	public Homeworklist findquestionById(Integer id) {
		// TODO Auto-generated method stub
		return homeworklistMapper.selectquestionById(id);
	}

}
