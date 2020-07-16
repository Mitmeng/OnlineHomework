package com.meng.onlinehomework.Service;

import java.util.List;
import java.util.Map;

import com.meng.onlinehomework.pojo.Homework;
import com.meng.onlinehomework.pojo.Stuhomework;

public interface StuhomeworkService {

	List<Stuhomework> getstuhomeworklist(Integer homeworkid);

	List<Stuhomework> getstuhwbycidandht(Map<String, Object> map);

	boolean inserscordbyid(Map<String, Object> map);

	void insertstuhomework(Stuhomework stuhomework);

	void deleStuHomeworkByHomeworkid(Integer integer);

	List<Stuhomework> GetstuhomeworkBystuId(Map<String, Object> map);

	String[] GethomeworkIdsByStuId(Map<String, Object> map);

	int selectcountBySubmit(Integer homeworkid);

	Stuhomework findStuHomework(Map<String, Object> map);

	void insertScoreBymap(Map<String, Object> map);

	void updateContentByID(Map<String, Object> map);

	int selectsumBySubScore(Integer id);

	double GetscoreAvgByHomeworkid(Integer id);

	int getgoodScoreByHomeworkid(Integer id);

	int getpassScoreByHomeworkid(Integer id);

	List<Stuhomework> findByStuid(String loginuserid);

	Stuhomework findById(Integer stuhomeworkid);

	void updatedelContentByID(Integer id);

	void deleteByIdAndStuid(Map<String, Object> map);

	Integer getcountByScore(Map<String, Integer> greadmap);

	void deleteByStuid(String stuid);

	void updatetitleByHomeworkid(Map<String, Object> map);


}
