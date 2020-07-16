package com.meng.onlinehomework.Service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meng.onlinehomework.Service.ChoiceService;
import com.meng.onlinehomework.dao.ChoiceMapper;
import com.meng.onlinehomework.pojo.Choice;


@Service
@Transactional
public class ChoiceServiceImpl implements ChoiceService {

	@Autowired
	private ChoiceMapper choiceMapper;

	@Override
	public void deleStuHomeworkByHomeworkid(Integer integer) {
		// TODO Auto-generated method stub
		choiceMapper.deleteByHomeworkId(integer);
	}

	@Override
	public void AddQuestion(Choice choice) {
		// TODO Auto-generated method stub
		choiceMapper.insert(choice);
	}

	@Override
	public List<Choice> getchoicehomeworkByHId(Integer homeworkid) {
		// TODO Auto-generated method stub
		return choiceMapper.selectByHomeworkId(homeworkid);
	}

	@Override
	public void UpdateCorrectanswer(Map<String, Object> map) {
		// TODO Auto-generated method stub
		choiceMapper.AddCorrectByHIdandQnum(map);
	}

	@Override
	public List<Choice> findBykeyword(String keyword) {
		// TODO Auto-generated method stub
		return choiceMapper.selectBykeyword(keyword);
	}

	@Override
	public List<Choice> findAllChoice() {
		// TODO Auto-generated method stub
		return choiceMapper.selectAllChoice();
	}

	@Override
	public Choice findById(Integer question1) {
		// TODO Auto-generated method stub
		return choiceMapper.selectByPrimaryKey(question1);
	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		choiceMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void updateChoice(Choice choice) {
		// TODO Auto-generated method stub
		choiceMapper.updateByPrimaryKey(choice);
	}

	
}
