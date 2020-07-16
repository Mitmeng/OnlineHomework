package com.meng.onlinehomework.Controller;

import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meng.onlinehomework.Service.ChoiceService;
import com.meng.onlinehomework.Service.CourseService;
import com.meng.onlinehomework.Service.ElecourseService;
import com.meng.onlinehomework.Service.HomeworkService;
import com.meng.onlinehomework.Service.StuhomeworkService;
import com.meng.onlinehomework.Service.UserService;
import com.meng.onlinehomework.pojo.Course;
import com.meng.onlinehomework.pojo.Elecourse;
import com.meng.onlinehomework.pojo.User;

/**
 * 课程管理
 * @author mengfengming
 *
 */
@Controller
public class CourseController {
	
	@Autowired
	private CourseService courseservice;
	@Autowired 
	private ElecourseService elecourseService;
	@Autowired
	private HomeworkService homeworkService;
	@Autowired
	private StuhomeworkService stuhomeworkService;
	@Autowired
	private ChoiceService choiceService;
	@Autowired
	private UserService userService;
	
	//课程管理，根据教师返回所教的所有课程
	@RequestMapping("/courseslist")
	public String GetCourseList(HttpSession session,ModelMap model,String courseid){
		String loginuserid = (String) session.getAttribute("userid");
		List<Course> courseslist = courseservice.GetCourseByteaid(loginuserid);
		List<Elecourse> elecoustu = elecourseService.SeleCouseStuByCourseId(courseid);
		model.addAttribute("courselist", courseslist);
		model.addAttribute("elecoustulist", elecoustu);
		return "coursestable";
	}
	
	//添加新课程
	@RequestMapping("/addnewcourse")
	@ResponseBody
	public String AddnewCourse(HttpSession session,Course course){
		String teacherid = (String) session.getAttribute("userid");
		course.setTeacherid(teacherid);
		course.setTotal(0);
		courseservice.AddNewCourse(course);
	//	List<Course> courseslist = courseservice.GetCourseByteaid(loginuserid);
		return "redirect:/courseslist";
	}
	
	/*
	 * 删除课程
	 * 同时删除该课程的全部作业
	 * 也同时删掉该全部该课程的选课
	 * 也同时删除选课学生的全部作业
	 */
	@ResponseBody
	@RequestMapping("delcourseById")
	public String DelecourseById(Integer id,String courseid){
		courseservice.deleCourseById(id);
		//删掉该全部该课程的选课
		elecourseService.deleEleCourseByCourseId(courseid);
		//获取该课程的全部作业的id
		String[] ids = homeworkService.findhomeworkidByCourseid(courseid);
		//删除选课学生的全部作业(选择题)
		for(int i=0;i<ids.length;i++){
			//删除选择题
			choiceService.deleStuHomeworkByHomeworkid(Integer.parseInt(ids[i]));
			//删除非选择题
			stuhomeworkService.deleStuHomeworkByHomeworkid(Integer.parseInt(ids[i]));
		}
		//删除该课程的全部作业
		homeworkService.deleHomeworkByCourseId(courseid);
		
		
		return "redirect:/courseslist";
	}
	
	/*
	 * 批量删除课程
	 * 同时删除该课程的全部作业
	 * 也同时删掉该全部该课程的选课
	 * 也同时删除选课学生的全部作业
	 */
	@ResponseBody
	@RequestMapping("deletecourseByIds")
	public void DeleteCourseByIds( String delitems){
		//System.out.println(delitems);
		String[] strs = delitems.split(","); 
		for(int i = 0;i < strs.length;i++){
			String courseid = courseservice.selectCourseIdById(Integer.parseInt(strs[i]));
			
			courseservice.deleCourseById(Integer.parseInt(strs[i]));
			//删掉该全部该课程的选课
			elecourseService.deleEleCourseByCourseId(courseid);
			System.out.println("删除第"+Integer.parseInt(strs[i])+"个");
			//获取该课程的全部作业的id
			String[] ids = homeworkService.findhomeworkidByCourseid(courseid);
			
			//删除选课学生的全部作业(选择题)
			for(int j=0;j<ids.length;j++){
				//删除选择题
				choiceService.deleStuHomeworkByHomeworkid(Integer.parseInt(ids[j]));
				//删除非选择题
				stuhomeworkService.deleStuHomeworkByHomeworkid(Integer.parseInt(ids[j]));
			}
			//删除该课程的全部作业
			homeworkService.deleHomeworkByCourseId(courseid);
			
		}
		
		//return "redirect:/courseslist";
	}
	
	//学生已选课的列表
	
	@RequestMapping("/stumycourselist")
	public String selecstucourseByuserid(HttpSession session,ModelMap map){
		String loginuserid = (String) session.getAttribute("userid");
		List<Elecourse> courselist = elecourseService.seleCourseBystuid(loginuserid);
		for(int i=0;i<courselist.size();i++){
			//将该门课的选课人数赋值给id
		int total = courseservice.getTotalByCourseid(courselist.get(i).getCourseid());
		courselist.get(i).setId(total);
		}
		map.addAttribute("courselist", courselist);
		return "stumycourse";
	}
	
	
	//学生选课列表，显示所有该学生没选过的课
	@RequestMapping("/stueleccourse")
	public String forstuselectcourse(HttpSession session,ModelMap map){
		String loginuserid = (String) session.getAttribute("userid");
		System.out.println(loginuserid);
		//查找所有的课程
		List<Course> allcourselist = courseservice.selectAll();
		//查找该生的所有选课
		List<Elecourse> mycourselist = elecourseService.seleCourseBystuid(loginuserid);
		for(int i = 0;i<mycourselist.size();i++){
			Iterator<Course> it = allcourselist.iterator();  
			while(it.hasNext()){  
			   String item = it.next().getCourseid();
			    if (mycourselist.get(i).getCourseid().equals(item)) {  
			        it.remove();  
			    }  
			}  
		}
		System.out.println(allcourselist.size());
		List<User> teacherlist = userService.findAllTeacher();
		for(int k=0;k<allcourselist.size();k++){
			for(int l=0;l<teacherlist.size();l++){
				if(teacherlist.get(l).getUserid().equals(allcourselist.get(k).getTeacherid())){
					allcourselist.get(k).setTeacherid(teacherlist.get(l).getUsername());
				}
			}
		}
		map.addAttribute("allcourselist", allcourselist);
		return "stuselectcourse";
	}
}
