package com.meng.onlinehomework.Service;

import java.util.Map;

import com.meng.onlinehomework.pojo.Homeworklist;

public interface HomeworklistService {

	void addStuHomeworklist(Homeworklist homeworklist);

	Homeworklist findById(Integer homeworklistid);

	void addquestionone(Map<String, Integer> map);

	void addquestiontwo(Map<String, Integer> map);

	void addquestionthree(Map<String, Integer> map);

	void addquestionfour(Map<String, Integer> map);

	void addquestionfive(Map<String, Integer> map);

	Homeworklist findquestionById(Integer homeworklistid);

}
