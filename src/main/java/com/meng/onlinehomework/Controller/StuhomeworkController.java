package com.meng.onlinehomework.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meng.onlinehomework.Service.CourseService;
import com.meng.onlinehomework.Service.HomeworkService;
import com.meng.onlinehomework.Service.StuhomeworkService;
import com.meng.onlinehomework.pojo.Course;
import com.meng.onlinehomework.pojo.Homework;
import com.meng.onlinehomework.pojo.Stuhomework;

/**
 * 学生作业管理
 * @author Administrator
 *
 */

@Controller
public class StuhomeworkController {

	@Autowired
	private StuhomeworkService stuhomeworkService;
	@Autowired
	private CourseService courseservice;
	@Autowired HomeworkService homeworkService;
	
	//用于作业管理,简答题
	@RequestMapping("/stuhomeworklistfour")
	public String getstuhomeworklistfour(Integer homeworkid,ModelMap map){
		
		List<Stuhomework> stuhomeworklist = stuhomeworkService.getstuhomeworklist(homeworkid);
	//	System.out.println(stuhomeworklist.toString());
		map.addAttribute("stuhomeworklist", stuhomeworklist);
		return "stushortanswerhomework";
	}
	
	/*
	 * 批改作业
	 * falg用于判断是否有学生提交作业
	 */
	@RequestMapping("/quickcorrectfour")
	public String getstuhomeworkforquick(Integer flag,Integer homeworktype,Integer homeworkid,HttpSession session,ModelMap modelMap){
		Homework homework = homeworkService.GetHomeworkById(homeworkid);
		String loginuserid = (String) session.getAttribute("userid");
		List<Course> courselist = courseservice.GetCourseByteaid(loginuserid);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("homeworkid", homeworkid);
		map.put("score", 0);
		map.put("submits", 1);
		List<Stuhomework> stuhomeworklist = stuhomeworkService.getstuhwbycidandht(map);
		modelMap.addAttribute("courselist", courselist);
		modelMap.addAttribute("stuhomeworklist", stuhomeworklist);
		modelMap.addAttribute("flag", flag);
		modelMap.addAttribute("homework", homework);
		if(homeworktype==4){
			return "quickcorrectfour";
		}
		if(homeworktype==3){
			return "quickcorrectthree";
		}
		if(homeworktype==2){
			return "quickcorrecttwo";
		}
		return "error";
	}
	
	//根据课程号选择该课程的作业
	@ResponseBody
	@RequestMapping("quickfourcourse")
	public Map<String, Object> selehomeworkbycourseid(String courseid,Integer homeworktype){
		Map<String, Object> elehomeworkMap = new HashMap<String,Object>();
		Map<String, Object> maps = new HashMap<String,Object>();
		maps.put("courseid", courseid);
		maps.put("homeworktype",homeworktype );
		List<Homework> homeworklist = homeworkService.GetHomeworkByCourseidAndtype(maps);
		elehomeworkMap.put("homeworklist", homeworklist);
		return elehomeworkMap;
	}
	
	//批改作业
	@RequestMapping("/insertgrade")
	public String Inserthomescord(String score,Integer id){
		int scores;
		if(score=="A"||score.equals("A")){
			scores = 95;
			//scores = (int) (90+(Math.random()*((100-90)+1)));
		}else if(score=="B"||score.equals("B")){
			scores = 85;
			//scores = (int) (80+(Math.random()*((90-80)+1)));
		}else if(score=="C"||score.equals("C")){
			scores = 75;
			//scores = (int) (70+(Math.random()*((80-70)+1)));
		}else if(score=="D"||score.equals("D")){
			scores = 65;
			//scores = (int) (60+(Math.random()*((70-60)+1)));
		}else{
			scores = 55;
			//scores = (int) (20+(Math.random()*((60-20)+1)));
		}
		System.out.println(scores);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("score",scores );
		boolean ret = stuhomeworkService.inserscordbyid(map);
		if(ret){
			return "success";
		}
		else
			return "error";
	}
	
	//作业管理
	@RequestMapping("/homeworkmanagerthree")
	public String homeworkmanager(){
		return "managerhomeworkthree";
	}
	
	
	//学生提交作业
	@RequestMapping("/doorupdatestuhomework")
	public void Doupdatestuhomework(String content,Integer stuhomeworkid,Integer submits){
		//flag用于判断是提交1还是保存0
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("id", stuhomeworkid);
		map.put("submits",submits );
		map.put("content",content );
		stuhomeworkService.updateContentByID(map);
	//	return "forward:/studohomework";
	}
	
	//查询某学生的作业情况
	@RequestMapping("/detailcontent")
	public String Stuminehomework(HttpSession session,Integer homeworkid,Integer stuhomeworkid,ModelMap modelMap){
		Homework homework = homeworkService.GetHomeworkById(homeworkid);
		Stuhomework stuhomework = stuhomeworkService.findById(stuhomeworkid);
		modelMap.addAttribute("homework", homework);
		modelMap.addAttribute("stuhomework", stuhomework);
		return "detailcontentpage";
	}
	
	//删除学生作业（相当于更新）
	@ResponseBody
	@RequestMapping("/delStuHomeworkById")
	public void UpdateStuHomeworkById(Integer id){
		stuhomeworkService.updatedelContentByID(id);
	}
	
	//批量删除学生作业（相当于更新）
	@ResponseBody
	@RequestMapping("/delStuHomeworkByIds")
	public void UpdateStuHomeworkByIds(String delitems){
		String[] strs = delitems.split(","); 
		for(int i = 0;i < strs.length;i++){
			stuhomeworkService.updatedelContentByID(Integer.parseInt(strs[i]));
		}
		
	}
	
	
	
	
}
