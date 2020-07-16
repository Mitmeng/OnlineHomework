package com.meng.onlinehomework.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.json.JsonArray;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meng.onlinehomework.Service.ChoiceService;
import com.meng.onlinehomework.Service.CourseService;
import com.meng.onlinehomework.Service.ElecourseService;
import com.meng.onlinehomework.Service.HomeworkService;
import com.meng.onlinehomework.Service.StuhomeworkService;
import com.meng.onlinehomework.pojo.Choice;
import com.meng.onlinehomework.pojo.Course;
import com.meng.onlinehomework.pojo.Elecourse;
import com.meng.onlinehomework.pojo.Homework;
import com.meng.onlinehomework.pojo.Stuhomework;

/*
 * 作业管理
 */

@Controller
public class HomeworkController {

	@Autowired 
	private HomeworkService homeworkService;
	@Autowired
	private CourseService courseservice;
	@Autowired
	private StuhomeworkService stuhomeworkService;
	@Autowired
	private ElecourseService elecourseService;
	@Autowired
	private ChoiceService choiceService;
	
	//添加新作业页面下拉菜单内容
	@RequestMapping("/addquerstions")
	public String Addnewquerstions(HttpSession session,Integer homeworktype,ModelMap modelMap){
		String loginuserid = (String) session.getAttribute("userid");
		List<Course> courseslist = courseservice.GetCourseByteaid(loginuserid);
		modelMap.addAttribute("homeworktype", homeworktype);
		modelMap.addAttribute("courselist", courseslist);
		//添加题目类型为选择题
		if(homeworktype==1){
			return "addchoice";
		}else{
			return "addquerstionpage";
		}
	}
	/*
	 * 添加新作业（填空题、编程题、简答题）
	 * 添加新作业的同时，将选了该门课程的学生都添加相应的作业
	 */
	@RequestMapping("/addnewquerstion")
	public String Addnewquerstion(Homework homework){
		homework.setCoursename(courseservice.GetCourseByCourseid(homework.getCourseid()).getCoursename());
		homeworkService.Addnewhomework(homework);
		System.out.println();
		List<Elecourse> stuidlist = elecourseService.SeleCouseStuByCourseId(homework.getCourseid());
		for(int i=0;i<stuidlist.size();i++){
			Stuhomework stuhomework = new Stuhomework();
			//插入homework后，返回该记录的索引
			stuhomework.setHomeworkid(homework.getId());
			stuhomework.setHomeworktitle(homework.getTitle());
			stuhomework.setHomeworktype(homework.getHomeworktype());
			stuhomework.setScore(0);
			stuhomework.setContent(null);
			stuhomework.setStuid(stuidlist.get(i).getStuid());
			stuhomework.setSubmits(0);
			stuhomeworkService.insertstuhomework(stuhomework);
		}
		return "redirect:courseslist";
	}
	
	/**
	 * 添加新作业，选择题
	 * 加入作业表同时，数据也存入选择题题库
	 * 同时，将选了该门课程的学生都添加相应的中作业
	 * @param data
	 */
	@ResponseBody
	@RequestMapping(value="/addchoicehomework",method=RequestMethod.POST)
	public void AddnewChoiceHomework(@RequestBody Map<String,Object> data){
		String courseId = (String) data.get("courseid");
		String title = (String) data.get("titles");
		//题目与选项
		List<Map<String,Object>> listMap = (List<Map<String,Object>>) data.get("listMap");
		//正确答案
		List<String> correctlist = (List<String>) data.get("correctanswer");
		System.out.println(correctlist.toString());
		Homework homework = new Homework();
		homework.setCoursename(courseservice.GetCourseByCourseid(courseId).getCoursename());
		homework.setCourseid(courseId);
		homework.setHomeworktype(1);
		homework.setTitle(title);
		homework.setContent(title);
		//添加作业，作业为选择题，题目保存在choice表中
		homeworkService.Addnewhomework(homework);
		List<Elecourse> stuidlist = elecourseService.SeleCouseStuByCourseId(courseId);
		//插入学生选课
		for(int i=0;i<stuidlist.size();i++){
			Stuhomework stuhomework = new Stuhomework();
			//插入homework后，返回该记录的索引
			stuhomework.setHomeworkid(homework.getId());
			stuhomework.setHomeworktitle(homework.getTitle());
			stuhomework.setHomeworktype(homework.getHomeworktype());
			stuhomework.setScore(0);
			stuhomework.setContent(null);
			stuhomework.setStuid(stuidlist.get(i).getStuid());
			stuhomework.setSubmits(0);
			stuhomeworkService.insertstuhomework(stuhomework);
		}
		//将题目存入choice表
		//List<Object> choicelist = null;
		for(int i = 0; i<listMap.size();i++){
			Integer correct = Integer.parseInt(correctlist.get(i));
			Choice choice = new Choice();
			choice.setHomeworkid(homework.getId());
			choice.setQuestionnumber(i+1);
			choice.setQuestion((String) listMap.get(i).get("question"));
			choice.setCorrectanswer(correct+1);
			List<Map<String,Object>> answer = (List<Map<String,Object>>) listMap.get(i).get("answer");
			//System.out.println(listMap.get(i).get("question"));
			//Map<String, Object> map = new HashMap<>();
			//map.put("question",(String) listMap.get(i).get("question"));
			//List<String> answers = null;
			for(int j=0;j<answer.size();j++){
				String optionanswer = (String) answer.get(j).get("option");
				//answers.add(optionanswer);
				if(j==0){
					choice.setAnswera(optionanswer);
				}
				if(j==1){
					choice.setAnswerb(optionanswer);
				}
				if(j==2){
					choice.setAnswerc(optionanswer);
				}
				if(j==3){
					choice.setAnswerd(optionanswer);
				}
				if(j==4){
					choice.setAnswere(optionanswer);
				}
				if(j==5){
					choice.setAnswerf(optionanswer);
				}
				if(j==6){
					choice.setAnswerg(optionanswer);
				}
			}
		//	map.put("answers", answers);
			//循环一次添加一个记录
			choiceService.AddQuestion(choice);
			//choicelist.add(map);
		}
		//return homework.getId();
		
	}
		
	//作业管理（下拉菜单（编程题的完整管理页面）（编程题、简答题）
	@RequestMapping("/homeworkmanager")
	public String Homeworkmanagerfour(HttpSession session,Integer homeworkid,Integer homeworktype,String courseid,ModelMap modelMap){
		String loginuserid = (String) session.getAttribute("userid");
		List<Course> courseslist = courseservice.GetCourseByteaid(loginuserid);
		List<Stuhomework> stuhomeworklist = stuhomeworkService.getstuhomeworklist(homeworkid);
		Homework homework = homeworkService.GetHomeworkById(homeworkid);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("courseid", courseid);
		map.put("homeworktype", homeworktype);
		List<Homework> homeworklist = homeworkService.GetHomeworkByCourseidAndtype(map);
		modelMap.addAttribute("courselist", courseslist);
		modelMap.addAttribute("homeworklist", homeworklist);
		modelMap.addAttribute("stuhomeworklist", stuhomeworklist);
		modelMap.addAttribute("homework", homework);
		if(homeworktype==1){
			return "managerhomeworkone";
		}
		if(homeworktype==2){
			return "managerhomeworktwo";
		}
		if(homeworktype==4){
			return "managerhomeworkfour";
		}
		else if(homeworktype==3){
			
			return "managerhomeworkthree";
		}
		return "error";
	}
	

	//学生未完成的作业
	@RequestMapping("/studohomework")
	public String Studoinghomework(HttpSession session,ModelMap modelMap){
		String loginuserid = (String) session.getAttribute("userid");
		//查询还未做的作业,或做了老师未批改的作业
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("stuid", loginuserid);
		map.put("submits", 0);
		List<Stuhomework> stuhomeworklist = stuhomeworkService.GetstuhomeworkBystuId(map);
		List<Homework> homeworklist = new ArrayList<>();
		for(int i=0;i<stuhomeworklist.size();i++){
			Homework homework = homeworkService.GetHomeworkById(stuhomeworklist.get(i).getHomeworkid());
			//查询目前已经提交作业的人的数量
			int submitnumber  = stuhomeworkService.selectcountBySubmit(stuhomeworklist.get(i).getHomeworkid());
			homework.setContent(Integer.toString(submitnumber));
			homeworklist.add(i, homework);
		}

		modelMap.addAttribute("homeworklist", homeworklist);
		
		return "dohomework";
	}
	
	
	//学生具体做的作业，作业内容详情
	@RequestMapping("/homeworkdetails")
	public String Homeworkdetail(Integer homeworkid,Integer homeworktype,Integer jump,ModelMap modelMap,HttpSession session ){
		String loginuserid = (String) session.getAttribute("userid");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("stuid", loginuserid);
		map.put("homeworkid", homeworkid);
		Stuhomework myhomework = stuhomeworkService.findStuHomework(map);
		//选中的作业
		Homework dohomework = homeworkService.GetHomeworkById(homeworkid);
		//homework
		modelMap.addAttribute("dohomework", dohomework);
		//stuhomework
		modelMap.addAttribute("myhomework", myhomework);
		modelMap.addAttribute("jump", jump);
		if(homeworktype==4||homeworktype==3||homeworktype==2){
			return "doinghomework";
		}
		else if(homeworktype==1){
			return "doingchoice";
		}else{
			return "error";
		}
	}
	
	//学生作业管理
	@RequestMapping("/minehomework")
	public String stuminehomework(HttpSession session,ModelMap modelMap ){
		String loginuserid = (String) session.getAttribute("userid");
		//学生的所有作业信息
		List<Stuhomework> stuhomeworklist = stuhomeworkService.findByStuid(loginuserid);
		//作业对应的课程信息
		List<Homework>  homeworklist = new ArrayList<>();
		for(int i=0;i<stuhomeworklist.size();i++){
			homeworklist.add(i,homeworkService.GetHomeworkById(stuhomeworklist.get(i).getHomeworkid()));
		}
		modelMap.addAttribute("stuhomeworklist", stuhomeworklist);
		modelMap.addAttribute("homeworklist", homeworklist);
		return "stuhomeworkmanager";
	}
	
	
	//登录教师的全部作业
	@RequestMapping("/allhomework")
	public String Allhomework(HttpSession session,ModelMap modelMap){
		String loginuserid = (String) session.getAttribute("userid");
		List<Course> courses = courseservice.GetCourseByteaid(loginuserid);
		List<Homework> allhomework = new ArrayList<>();
		int index = 0;
		for(int i=0;i<courses.size();i++){
			List<Homework> homeworks = homeworkService.findhomeworkByCourseid(courses.get(i).getCourseid());
			for(int j=0;j<homeworks.size();j++){
				//将content替换为已提交学生人数
				int total = stuhomeworkService.selectcountBySubmit(homeworks.get(j).getId());
				String to = Integer.toString(total);
				homeworks.get(j).setContent(to);
				allhomework.add(index, homeworks.get(j));
				index++;
			}
		}
		modelMap.addAttribute("allhomework", allhomework);
		return "allhomeworkpage";
	}
	
	//删除课程作业
	@RequestMapping("/delhomeworkById")
	@ResponseBody
	public String DelhomeworkById(Integer id){
		//删除作业
		homeworkService.deleHomeworkById(id);
		//删除学生作业
		stuhomeworkService.deleStuHomeworkByHomeworkid(id);
		return "success";
	}
	
	
	//高亮显示的作业详情
	@RequestMapping("/stuhomeworkdetail")
	public String Stuhomeworkdetail(Integer stuhomeworkid,ModelMap modelMap){
		Stuhomework stuhomework = stuhomeworkService.findById(stuhomeworkid);
		modelMap.addAttribute("stuhomework", stuhomework);
		return "highlightpage";
	}
	
	
	//作业题目详情
	@RequestMapping("/homeworkdetail")
	public String Homeworkdetail(Integer id,Integer homeworktype,Integer flag,ModelMap modelMap){
		//flag用于判断是修改还是查看
		if(homeworktype!=1){
			System.out.println(id);
			Homework homework = homeworkService.GetHomeworkById(id);
			System.out.println(homework.getContent());
			modelMap.addAttribute("homework", homework);
			modelMap.addAttribute("flag", flag);
			return "teahomeworkdrtail";
		}else{
			List<Choice> choicehomework = choiceService.getchoicehomeworkByHId(id);
			modelMap.put("title", homeworkService.GetHomeworkById(id).getTitle());
			modelMap.addAttribute("choicehomework", choicehomework);
			modelMap.addAttribute("flag", flag);
			return "choicehomeworkdetail";
		}
	}
	
	//教师修改作业内容
	@RequestMapping("/updatequerstion")
	public String Updatequerstion(String content,String title,Integer homeworkid){
		//修改作业的同时，也要修改相应的学生作业
		Map<String, Object> map = new HashMap<>();
		map.put("id", homeworkid);
		map.put("title", title);
		map.put("content", content);
		//修改作业内容
		homeworkService.updatehomeworkById(map);
		//修改学生作业
		stuhomeworkService.updatetitleByHomeworkid(map);
		
		return "redirect:/allhomework";
	}
	
}
