package com.meng.onlinehomework.dao;

import java.util.List;
import java.util.Map;

import com.meng.onlinehomework.pojo.Choice;

public interface ChoiceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Choice record);

    int insertSelective(Choice record);

    Choice selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Choice record);

    int updateByPrimaryKey(Choice record);

	void deleteByHomeworkId(Integer integer);

	List<Choice> selectByHomeworkId(Integer homeworkid);

	void AddCorrectByHIdandQnum(Map<String, Object> map);

	List<Choice> selectBykeyword(String keyword);

	List<Choice> selectAllChoice();
}