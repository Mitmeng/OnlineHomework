package com.meng.onlinehomework.Service;

import java.util.List;
import java.util.Map;

import com.meng.onlinehomework.pojo.Elecourse;

public interface ElecourseService {

	List<Elecourse> SeleCouseStuByCourseId(String courseid);

	void deleEleCourseByCourseId(String courseid);

	List<Elecourse> seleCourseBystuid(String loginuserid);

	void Addelecourse(Elecourse elecourse);

	Object findByStuidAndCourseid(Map<String, Object> map);

	Elecourse findById(int parseInt);

	void deleteById(Integer id);
	

}
