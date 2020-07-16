package com.meng.onlinehomework.Service;

import java.util.List;
import java.util.Map;

import com.meng.onlinehomework.pojo.Homework;

public interface HomeworkService {

	void Addnewhomework(Homework homework);

	List<Homework> GetHomeworkByCourseidAndtype(Map<String, Object> map);

	Homework GetHomeworkById(Integer homeworkid);

	String[] findhomeworkidByCourseid(String courseid);

	void deleHomeworkByCourseId(String courseid);

	List<Homework> findhomeworkByCourseid(String courseid);

	void deleHomeworkById(Integer id);

	List<Homework> findByHomeworktype(Integer homeworktype);

	List<Homework> findBykeyword(Map<String, Object> map);

	void updatehomeworkById(Map<String, Object> map);

}
