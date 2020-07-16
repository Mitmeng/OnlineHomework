package com.meng.onlinehomework.Service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meng.onlinehomework.Service.ElecourseService;
import com.meng.onlinehomework.dao.ElecourseMapper;
import com.meng.onlinehomework.pojo.Elecourse;

@Service
@Transactional
public class ElecourseServiceImpl implements ElecourseService{

	@Autowired
	private ElecourseMapper elecourseMapper;

	@Override
	public List<Elecourse> SeleCouseStuByCourseId(String courseid) {
		// TODO Auto-generated method stub
		return elecourseMapper.selectByCourseId(courseid);
	}

	@Override
	public void deleEleCourseByCourseId(String courseid) {
		// TODO Auto-generated method stub
		elecourseMapper.deleteByCourseid(courseid);
	}

	@Override
	public List<Elecourse> seleCourseBystuid(String loginuserid) {
		// TODO Auto-generated method stub
		return elecourseMapper.selecCourseBystuid(loginuserid);
	}

	@Override
	public void Addelecourse(Elecourse elecourse) {
		// TODO Auto-generated method stub
		elecourseMapper.insert(elecourse);
	}

	@Override
	public Object findByStuidAndCourseid(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return elecourseMapper.findByStuidAndCourseid(map);
	}

	@Override
	public Elecourse findById(int parseInt) {
		// TODO Auto-generated method stub
		return elecourseMapper.selectByPrimaryKey(parseInt);
	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		elecourseMapper.deleteByPrimaryKey(id);
	}
	
	
}
