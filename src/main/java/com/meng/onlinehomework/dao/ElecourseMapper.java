package com.meng.onlinehomework.dao;

import java.util.List;
import java.util.Map;

import com.meng.onlinehomework.pojo.Elecourse;

public interface ElecourseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Elecourse record);

    int insertSelective(Elecourse record);

    Elecourse selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Elecourse record);

    int updateByPrimaryKey(Elecourse record);

	List<Elecourse> selectByCourseId(String courseid);

	void deleteByCourseid(String courseid);

	List<Elecourse> selecCourseBystuid(String loginuserid);

	Object findByStuidAndCourseid(Map<String, Object> map);
}