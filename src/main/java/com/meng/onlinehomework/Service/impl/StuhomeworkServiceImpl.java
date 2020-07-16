package com.meng.onlinehomework.Service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meng.onlinehomework.Service.StuhomeworkService;
import com.meng.onlinehomework.dao.StuhomeworkMapper;
import com.meng.onlinehomework.pojo.Homework;
import com.meng.onlinehomework.pojo.Stuhomework;

@Service
@Transactional
public class StuhomeworkServiceImpl implements StuhomeworkService{

	@Autowired
	private StuhomeworkMapper stuhomeworkMapper;

	@Override
	public List<Stuhomework> getstuhomeworklist(Integer homeworkid) {
		// TODO Auto-generated method stub
		return stuhomeworkMapper.selectByhomeworkid(homeworkid);
	}

	@Override
	public List<Stuhomework> getstuhwbycidandht(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return stuhomeworkMapper.selectByhomeworkidtype(map);
	}

	@Override
	public boolean inserscordbyid(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return stuhomeworkMapper.updatescordById(map);
	}

	@Override
	public void insertstuhomework(Stuhomework stuhomework) {
		// TODO Auto-generated method stub
		int success = stuhomeworkMapper.insert(stuhomework);
	}

	@Override
	public void deleStuHomeworkByHomeworkid(Integer integer) {
		// TODO Auto-generated method stub
		stuhomeworkMapper.deleteByHomeworkId(integer);
	}

	@Override
	public List<Stuhomework> GetstuhomeworkBystuId(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return stuhomeworkMapper.selectBystuIdandScore(map);
	}

	@Override
	public String[] GethomeworkIdsByStuId(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return stuhomeworkMapper.selecthomeworkIDbystuId(map);
	}

	@Override
	public int selectcountBySubmit(Integer homeworkid) {
		// TODO Auto-generated method stub
		return stuhomeworkMapper.selectCountBySubmit(homeworkid);
	}

	@Override
	public Stuhomework findStuHomework(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return stuhomeworkMapper.selectByHomeworkIdandStuId(map);
	}

	@Override
	public void insertScoreBymap(Map<String, Object> map) {
		// TODO Auto-generated method stub
		stuhomeworkMapper.insertScoreBymap(map);
	}

	@Override
	public void updateContentByID(Map<String, Object> map) {
		// TODO Auto-generated method stub
		stuhomeworkMapper.updateContentById(map);
	}

	@Override
	public int selectsumBySubScore(Integer id) {
		// TODO Auto-generated method stub
		return stuhomeworkMapper.selectCountBySubScore(id);
	}

	@Override
	public double GetscoreAvgByHomeworkid(Integer id) {
		// TODO Auto-generated method stub
		return stuhomeworkMapper.getscoreAvgByHomeworkid(id);
	}

	@Override
	public int getgoodScoreByHomeworkid(Integer id) {
		// TODO Auto-generated method stub
		return stuhomeworkMapper.getgoodScoreByHomeworkid(id);
	}

	@Override
	public int getpassScoreByHomeworkid(Integer id) {
		// TODO Auto-generated method stub
		return stuhomeworkMapper.getpassScoreByHomeworkid(id);
	}

	@Override
	public List<Stuhomework> findByStuid(String loginuserid) {
		// TODO Auto-generated method stub
		return stuhomeworkMapper.selectByStuid(loginuserid);
	}

	@Override
	public Stuhomework findById(Integer stuhomeworkid) {
		// TODO Auto-generated method stub
		return stuhomeworkMapper.selectByPrimaryKey(stuhomeworkid);
	}

	@Override
	public void updatedelContentByID(Integer id) {
		// TODO Auto-generated method stub
		stuhomeworkMapper.updatedelById(id);
	}

	@Override
	public void deleteByIdAndStuid(Map<String, Object> map) {
		// TODO Auto-generated method stub
		stuhomeworkMapper.deleteByIdAndStuid(map);
	}

	@Override
	public Integer getcountByScore(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return stuhomeworkMapper.selectcountByScore(map);
	}

	@Override
	public void deleteByStuid(String stuid) {
		// TODO Auto-generated method stub
		stuhomeworkMapper.deleteByStuid(stuid);
	}

	@Override
	public void updatetitleByHomeworkid(Map<String, Object> map) {
		// TODO Auto-generated method stub
		stuhomeworkMapper.updateByHomeworkid(map);
	}


	
	
}
