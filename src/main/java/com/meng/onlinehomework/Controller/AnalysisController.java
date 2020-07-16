package com.meng.onlinehomework.Controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meng.onlinehomework.Service.CourseService;
import com.meng.onlinehomework.Service.ElecourseService;
import com.meng.onlinehomework.Service.HomeworkService;
import com.meng.onlinehomework.Service.StuhomeworkService;
import com.meng.onlinehomework.pojo.Course;
import com.meng.onlinehomework.pojo.Homework;

/**
 * 统计分析
 * @author Administrator
 *
 */
@Controller
public class AnalysisController {

	@Autowired
	private HomeworkService homeworkService;
	@Autowired
	private StuhomeworkService stuhomeworkService;
	@Autowired
	private CourseService courseService;
	@Autowired 
	private ElecourseService elecourseService;
	
	//课程作业提交情况分析
	@RequestMapping("/courseAnalysis")
	public String CourseAnalysis(HttpSession session,ModelMap modelMap){
		String loginuserid = (String) session.getAttribute("userid");
		//登录教师的所有课程
		List<Course> courselist = courseService.GetCourseByteaid(loginuserid);
		//遍历所有课程
		List<Object> courses = new ArrayList<>();
		for(int i=0;i<courselist.size();i++){
			List<Map<String, Object>> homeworklist = new ArrayList<>();
			//对应课程的所有作业
			List<Homework> homeworks = homeworkService.findhomeworkByCourseid(courselist.get(i).getCourseid());
			if(homeworks!=null){
				//遍历该课程的所有作业
				for(int j=0;j<homeworks.size();j++){
					Map<String, Object> homeworkmap = new HashMap<>();
					//已提交学生人数
					int count = stuhomeworkService.selectcountBySubmit(homeworks.get(j).getId());
					int sum = stuhomeworkService.selectsumBySubScore(homeworks.get(j).getId());
					homeworkmap.put("x", homeworks.get(j).getTitle());
					homeworkmap.put("y", count);
					homeworkmap.put("a", courselist.get(i).getTotal()-count);
					homeworkmap.put("z", sum);
					homeworklist.add(j, homeworkmap);
				}
				if(homeworklist!=null&&courselist.get(i).getTotal()!=0){
					courses.add(i, homeworklist);
				}
			}
			
		}
		//每门课程作业的提交情况
		modelMap.addAttribute("courselist", courses);
		//课程基本信息
		modelMap.addAttribute("course", courselist);
		return "courseanalysispage";
	}
	
	//成绩统计(初始页面)
	@RequestMapping("/scoreAnalysis")
	public String ScoreAnalysis(HttpSession session,ModelMap modelMap){
		//获取登录用户
		String loginuserid = (String) session.getAttribute("userid");
		//登录教师的所有课程
		List<Course> courselist = courseService.GetCourseByteaid(loginuserid);	
		modelMap.addAttribute("courselist", courselist);		
		return "scoreanalysis";
	}
	//成绩统计，子标签（折线图）
	@RequestMapping("/analysischildren")
	public String scoreAnalysischild(HttpSession session,String courseId,ModelMap modelMap){
      //获取登录用户
		String loginuserid = (String) session.getAttribute("userid");
		//登录教师的所有课程
		List<Course> courselist = courseService.GetCourseByteaid(loginuserid);
		List<Homework> homeworklist;
		Course course ;
		//用于饼状图索引
		String courseIdd;
		if(courseId=="xxx"||courseId.equals("xxx")){
			//该课程的所有作业
			 homeworklist = homeworkService.findhomeworkByCourseid(courselist.get(0).getCourseid());
			 course = courseService.GetCourseByCourseid(courselist.get(0).getCourseid());
			 courseIdd = course.getCourseid();
		}
		else{
			homeworklist = homeworkService.findhomeworkByCourseid(courseId);
			course= courseService.GetCourseByCourseid(courseId);
			courseIdd = course.getCourseid();
		}

			List<Map<String, Object>> scorelist = new ArrayList<>();
			System.out.println("这是所有的课程作业列表:"+homeworklist.toString());
			
			//后台封装
			List<Object> countlist = new ArrayList<>();
			List<Object> greadlist = new ArrayList<>();
			List<Object> passlist = new ArrayList<>();
			List<Object> titlelist = new ArrayList<>();
			//遍历该课程的所有作业
			for(int j=0;j<homeworklist.size();j++){
				System.out.println("这是第"+j+"门作业："+homeworklist.get(j).getTitle());
				Map<String, Object> map = new HashMap<>();

				//作业的平均分、优秀率、及格率
				//获得该课程作业的平均分
				double count = stuhomeworkService.GetscoreAvgByHomeworkid(homeworklist.get(j).getId());
				
				//成绩优秀的人数
				double goodcount = stuhomeworkService.getgoodScoreByHomeworkid(homeworklist.get(j).getId());
				//优秀率计算
				BigDecimal  b   =   new   BigDecimal(goodcount/(double)course.getTotal());  
				double   gread   =   b.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue(); 
				
				//成绩及格的人数
				double passcount = stuhomeworkService.getpassScoreByHomeworkid(homeworklist.get(j).getId());
				//及格率计算
				BigDecimal  c   =   new   BigDecimal(passcount/(double)course.getTotal());  
				double   pass   =   c.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue(); 
				
				countlist.add(count);
				greadlist.add(gread*100);
				passlist.add(pass*100);
				titlelist.add(homeworklist.get(j).getTitle());
				map.put("counts", count);
				map.put("great", gread*100);
				map.put("pass", pass*100);
				map.put("homework", homeworklist.get(j).getTitle());
				//一个课程作业
				scorelist.add(j, map);				
		}
		
		modelMap.addAttribute("coursescore", scorelist);
		modelMap.addAttribute("courselist", course);
		modelMap.addAttribute("courseids", courseIdd);
		return "scoreanalysichild";
	}

	
	
	//成绩统计，子标签（饼状图）
	@RequestMapping("/analysipiechildren")
	public String scorepieanalysichild(HttpSession session,Integer homeworkid,ModelMap modelMap){
		//成绩优秀
		Map<String, Integer> greadmap = new HashMap<>();
		greadmap.put("homeworkid", homeworkid);
		greadmap.put("max", 101);
		greadmap.put("min", 90);
		//成绩良好
		Map<String, Integer> goodmap = new HashMap<>();
		goodmap.put("homeworkid", homeworkid);
		goodmap.put("max", 90);
		goodmap.put("min", 80);
		//成绩中
		Map<String, Integer> sosomap = new HashMap<>();
		sosomap.put("homeworkid", homeworkid);
		sosomap.put("max", 80);
		sosomap.put("min", 70);
		//成绩及格
		Map<String, Integer> onlypass = new HashMap<>();
		onlypass.put("homeworkid", homeworkid);
		onlypass.put("max", 70);
		onlypass.put("min", 60);
		//成绩不及格
		Map<String, Integer> unpass = new HashMap<>();
		unpass.put("homeworkid", homeworkid);
		unpass.put("max", 60);
		unpass.put("min", 0);
		
		//用于存储没一门作业对应成绩的人数
		Map<String, Integer> number = new HashMap<>();
		String hometitle = homeworkService.GetHomeworkById(homeworkid).getTitle();

		number.put("great", stuhomeworkService.getcountByScore(greadmap));
		number.put("good", stuhomeworkService.getcountByScore(goodmap));
		number.put("soso", stuhomeworkService.getcountByScore(sosomap));
		number.put("onlypass", stuhomeworkService.getcountByScore(onlypass));
		number.put("unpass", stuhomeworkService.getcountByScore(unpass));
		modelMap.addAttribute("number", number);
		modelMap.addAttribute("hometitle", hometitle);
		return "scorepie";
	}
	
	//成绩统计，子标签（成绩人数分布,初始页）
	@RequestMapping("/scoreanalypie")
	public String Scoreanalypie(HttpSession session,String courseid,ModelMap modelMap){
		List<Homework> homeworklist;
		if(courseid=="xxx"||courseid.equals("xxx")){
			//获取登录用户
			String loginuserid = (String) session.getAttribute("userid");
			//登录教师的所有课程
			List<Course> courselist = courseService.GetCourseByteaid(loginuserid);
			homeworklist = homeworkService.findhomeworkByCourseid(courselist.get(0).getCourseid());
		}else{
			homeworklist = homeworkService.findhomeworkByCourseid(courseid);
		}	
		modelMap.addAttribute("homeworklist", homeworklist);
		modelMap.addAttribute("homeworkid", homeworklist.get(0).getId());
		return "scoreanalysispie";
	}
	
}
