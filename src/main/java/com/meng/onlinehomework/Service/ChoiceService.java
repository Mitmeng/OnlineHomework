package com.meng.onlinehomework.Service;

import java.util.List;
import java.util.Map;

import com.meng.onlinehomework.pojo.Choice;

public interface ChoiceService {

	void deleStuHomeworkByHomeworkid(Integer integer);

	void AddQuestion(Choice choice);

	List<Choice> getchoicehomeworkByHId(Integer homeworkid);

	void UpdateCorrectanswer(Map<String, Object> map);

	List<Choice> findBykeyword(String keyword);

	List<Choice> findAllChoice();

	Choice findById(Integer question1);

	void deleteById(Integer id);

	void updateChoice(Choice choice);

}
