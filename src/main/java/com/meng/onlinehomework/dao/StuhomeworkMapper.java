package com.meng.onlinehomework.dao;

import java.util.List;
import java.util.Map;

import com.meng.onlinehomework.pojo.Homework;
import com.meng.onlinehomework.pojo.Stuhomework;

public interface StuhomeworkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Stuhomework record);

    int insertSelective(Stuhomework record);

    Stuhomework selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Stuhomework record);

    int updateByPrimaryKey(Stuhomework record);

	List<Stuhomework> selectByhomeworkid(Integer homeworkid);

	List<Stuhomework> selectByhomeworkidtype(Map<String, Object> map);

	boolean updatescordById(Map<String, Object> map);

	void deleteByHomeworkId(Integer integer);

	List<Stuhomework> selectBystuIdandScore(Map<String, Object> map);

	String[] selecthomeworkIDbystuId(Map<String, Object> map);

	int selectCountBySubmit(Integer homeworkid);

	Stuhomework selectByHomeworkIdandStuId(Map<String, Object> map);

	void insertScoreBymap(Map<String, Object> map);

	void updateContentById(Map<String, Object> map);

	int selectCountBySubScore(Integer id);

	double getscoreAvgByHomeworkid(Integer id);

	int getgoodScoreByHomeworkid(Integer id);

	int getpassScoreByHomeworkid(Integer id);

	List<Stuhomework> selectByStuid(String loginuserid);

	void updatedelById(Integer id);

	void deleteByIdAndStuid(Map<String, Object> map);

	Integer selectcountByScore(Map<String, Integer> map);

	void deleteByStuid(String stuid);

	void updateByHomeworkid(Map<String, Object> map);
	
}