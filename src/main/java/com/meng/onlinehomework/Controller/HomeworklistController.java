package com.meng.onlinehomework.Controller;

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

import com.meng.onlinehomework.Service.ChoiceService;
import com.meng.onlinehomework.Service.CourseService;
import com.meng.onlinehomework.Service.ElecourseService;
import com.meng.onlinehomework.Service.HomeworkService;
import com.meng.onlinehomework.Service.HomeworklistService;
import com.meng.onlinehomework.Service.StuHomeworklistService;
import com.meng.onlinehomework.pojo.Choice;
import com.meng.onlinehomework.pojo.Course;
import com.meng.onlinehomework.pojo.Elecourse;
import com.meng.onlinehomework.pojo.Homework;
import com.meng.onlinehomework.pojo.Homeworklist;
import com.meng.onlinehomework.pojo.Stuhomework;
import com.meng.onlinehomework.pojo.Stuhomeworklist;import ch.qos.logback.core.joran.conditional.IfAction;

/**
 * 教师添加套题
 * @author Administrator
 *
 */
@Controller
public class HomeworklistController {

	@Autowired 
	private HomeworklistService homeworklistService;
	
	@Autowired
	private HomeworkService homeworkService;
	
	@Autowired
	private StuHomeworklistService stuHomeworklistService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private ChoiceService choiceService;
	
	@Autowired
	private ElecourseService elecourseService;
	
	//教师添加套题
	@RequestMapping("/addhomeworklist")
	public String Addhomeworklist(HttpSession session,ModelMap modelMap){
		String loginuserid = (String) session.getAttribute("userid");
		List<Course> courseslist = courseService.GetCourseByteaid(loginuserid);
		//modelMap.addAttribute("homeworktype", homeworktype);
		modelMap.addAttribute("courselist", courseslist);
		return "foraddhomeworklistpage";
	}
	//套题添加标题和描述信息
	@RequestMapping("/foraddquerstionlist")
	public String Foraddquerstionlist(Homeworklist homeworklist,ModelMap modelMap){
		homeworklist.setCoursename(courseService.GetCourseByCourseid(homeworklist.getCourseid()).getCoursename());
		homeworklist.setCount(0);
		//插入返回插入的id
		homeworklistService.addStuHomeworklist(homeworklist);
		
		Integer homeworklistid = homeworklist.getId();
		System.out.println("这是返回的id:"+homeworklistid);
		List<Elecourse> stulist = elecourseService.SeleCouseStuByCourseId(homeworklist.getCourseid());
		for(int i=0;i<stulist.size();i++){
			Stuhomeworklist stuhomeworklist = new Stuhomeworklist();
			//插入选课学生的学生作业
			stuhomeworklist.setStuid(stulist.get(i).getStuid());
			stuhomeworklist.setStuname(stulist.get(i).getStuname());
			stuhomeworklist.setAnswer1(null);
			stuhomeworklist.setAnswer2(null);
			stuhomeworklist.setAnswer3(null);
			stuhomeworklist.setAnswer4(null);
			stuhomeworklist.setAnswer5(null);
			stuHomeworklistService.addstuHomeworklist(stuhomeworklist);
			
		}
		List<Object> homeworklists = new ArrayList<>();
		modelMap.addAttribute("homeworkli", homeworklistService.findById(homeworklistid));
		modelMap.addAttribute("homeworklistid", homeworklistid);
		modelMap.addAttribute("count", 0);
		modelMap.addAttribute("homeworklist", homeworklists);
		return "addquestionlist";
	}
	
	//获取相应题目类型的题目列表
	@RequestMapping("/questiondetial")
	public String Questiondetial(Integer homeworktype,String keyword,Integer homeworklistid,ModelMap modelMap){
		System.out.println(homeworklistid);
		System.out.println(homeworktype);
		System.out.println(keyword);
		if(homeworktype==1){
			List<Choice> choicelist;
			if(keyword==null||keyword==""||keyword.equals("")){
				 choicelist = choiceService.findAllChoice();
			}else{
				 choicelist = choiceService.findBykeyword(keyword);
			}
			modelMap.addAttribute("homeworklist", choicelist);
			modelMap.addAttribute("homeworklistid", homeworklistid);
			return "choicequestionlist";
		}
		else{
			List<Homework> homeworklist;
			if(keyword==null||keyword==""||keyword.equals("")){
				homeworklist = homeworkService.findByHomeworktype(homeworktype);
			}else{
				Map<String, Object> map = new HashMap<>();
				map.put("key", keyword);
				map.put("homeworktype", homeworktype);
				homeworklist = homeworkService.findBykeyword(map);
			}
			modelMap.addAttribute("homeworklist", homeworklist);
			modelMap.addAttribute("homeworklistid", homeworklistid);
			return "questionlist";
		}
	}
	
	//添加题目
	@ResponseBody
	@RequestMapping("/addquestion")
	public Map<String, Object> Addquestions(Integer homeworkid,Integer homeworktype,Integer homeworklistid){
		String msg;
		Homeworklist homeworklist = homeworklistService.findById(homeworklistid);
		Integer count = homeworklist.getCount();
		Map<String, Object> returnmap = new HashMap<>();
		returnmap.put("homeworklistid", homeworklistid);
		Map<String, Integer> map = new HashMap<>();
		map.put("homeworkid", homeworkid);
		map.put("homeworktype", homeworktype);
		map.put("id", homeworklistid);
		System.out.println("count="+count);
		if(count==0){
			homeworklistService.addquestionone(map);
			msg="success";
		}else if(count==1){
			
			if(homeworktype.equals(homeworklist.getQuestion1type())&&homeworkid.equals(homeworklist.getQuestion1())){
				msg="havaone";
				System.out.println("这是msg:"+msg);
			}else{
				homeworklistService.addquestiontwo(map);
				msg="success";
			}
		}else if (count==2) {
			
			if((homeworktype.equals(homeworklist.getQuestion1type())&&homeworkid.equals(homeworklist.getQuestion1()))||
					(homeworktype.equals(homeworklist.getQuestion2type())&&homeworkid.equals(homeworklist.getQuestion2()))){
				msg="havaone";
				System.out.println(msg);
			}else{
				homeworklistService.addquestionthree(map);
				msg="success";
			}
			
		}else if (count==3) {
			if((homeworktype.equals(homeworklist.getQuestion1type())&&homeworkid.equals(homeworklist.getQuestion1()))||
					(homeworktype.equals(homeworklist.getQuestion2type())&&homeworkid.equals(homeworklist.getQuestion2()))||
					(homeworktype.equals(homeworklist.getQuestion3type())&&homeworkid.equals(homeworklist.getQuestion3()))){
				msg="havaone";
				System.out.println(msg);
			}else{
				homeworklistService.addquestionfour(map);
				msg="success";
			}	
		}else if (count==4) {
			if((homeworktype.equals(homeworklist.getQuestion1type())&&homeworkid.equals(homeworklist.getQuestion1()))||
					(homeworktype.equals(homeworklist.getQuestion2type())&&homeworkid.equals(homeworklist.getQuestion2()))||
					(homeworktype.equals(homeworklist.getQuestion3type())&&homeworkid.equals(homeworklist.getQuestion3()))||
					(homeworktype.equals(homeworklist.getQuestion4type())&&homeworkid.equals(homeworklist.getQuestion4()))){
				msg="havaone";
				System.out.println(msg);
			}else{
				homeworklistService.addquestionfive(map);
				msg="success";
			}
		}else{
			msg="error";
		}
		returnmap.put("msg", msg);
		return returnmap;
	}
	

	//添加题目成功后跳转
	@RequestMapping("/questionslist")
	public String Questionslist(Integer homeworklistid ,ModelMap modelMap){
		System.out.println("测试跳转后的id"+homeworklistid);
		Homeworklist homeworksss = homeworklistService.findquestionById(homeworklistid);
		System.out.println(homeworksss.toString());
		Homeworklist homeworkli = homeworklistService.findById(homeworklistid);
		System.out.println(homeworkli.toString());
		System.out.println("第一题的题目id为："+homeworkli.getQuestion1());
		List<Object> homeworklist = new ArrayList<>();
		boolean ques = homeworkli.getQuestion1()!=null;
		System.out.println("测试添加成功后是否获取到内容："+ques);
		if(homeworkli.getQuestion1()!=null){
			if(homeworkli.getQuestion1type()==1){
				//选择题
				Choice choice = choiceService.findById(homeworkli.getQuestion1());
				Map<String, Object> map = new HashMap<>();
				map.put("homeworktype",1);
				map.put("question", choice);
				homeworklist.add(0,map);
			}else{
				//非选择题
				Homework homework = homeworkService.GetHomeworkById(homeworkli.getQuestion1());
				Map<String, Object> map = new HashMap<>();
				map.put("homeworktype",homeworkli.getQuestion1());
				map.put("question", homework);
				homeworklist.add(0,map);
			}
		}
		if(homeworkli.getQuestion2()!=null){
			if(homeworkli.getQuestion2type()==1){
				//选择题
				Choice choice = choiceService.findById(homeworkli.getQuestion2());
				Map<String, Object> map = new HashMap<>();
				map.put("homeworktype",1);
				map.put("question", choice);
				homeworklist.add(1,map);
			}else{
				//非选择题
				Homework homework = homeworkService.GetHomeworkById(homeworkli.getQuestion2());
				Map<String, Object> map = new HashMap<>();
				map.put("homeworktype",homeworkli.getQuestion2());
				map.put("question", homework);
				homeworklist.add(1,map);
			}
		}
		if(homeworkli.getQuestion3()!=null){
			if(homeworkli.getQuestion3type()==1){
				//选择题
				Choice choice = choiceService.findById(homeworkli.getQuestion3());
				Map<String, Object> map = new HashMap<>();
				map.put("homeworktype",1);
				map.put("question", choice);
				homeworklist.add(2,map);
			}else{
				//非选择题
				Homework homework = homeworkService.GetHomeworkById(homeworkli.getQuestion3());
				Map<String, Object> map = new HashMap<>();
				map.put("homeworktype",homeworkli.getQuestion3());
				map.put("question", homework);
				homeworklist.add(2,map);
			}
		}
		if(homeworkli.getQuestion4()!=null){
			if(homeworkli.getQuestion4type()==1){
				//选择题
				Choice choice = choiceService.findById(homeworkli.getQuestion4());
				Map<String, Object> map = new HashMap<>();
				map.put("homeworktype",1);
				map.put("question", choice);
				homeworklist.add(3,map);
			}else{
				//非选择题
				Homework homework = homeworkService.GetHomeworkById(homeworkli.getQuestion4());
				Map<String, Object> map = new HashMap<>();
				map.put("homeworktype",homeworkli.getQuestion4());
				map.put("question", homework);
				homeworklist.add(3,map);
			}
		}
		if(homeworkli.getQuestion5()!=null){
			if(homeworkli.getQuestion5type()==1){
				//选择题
				Choice choice = choiceService.findById(homeworkli.getQuestion5());
				Map<String, Object> map = new HashMap<>();
				map.put("homeworktype",1);
				map.put("question", choice);
				homeworklist.add(4,map);
			}else{
				//非选择题
				Homework homework = homeworkService.GetHomeworkById(homeworkli.getQuestion5());
				Map<String, Object> map = new HashMap<>();
				map.put("homeworktype",homeworkli.getQuestion5());
				map.put("question", homework);
				homeworklist.add(4,map);
			}
		}
		//已添加的题目内容
		modelMap.addAttribute("homeworklist", homeworklist);
		System.out.println("这是已添加的题目内容信息："+homeworklist.toString());
		modelMap.addAttribute("homeworkli", homeworkli);
		modelMap.addAttribute("homeworklistid", homeworklistid);
		modelMap.addAttribute("count", homeworkli.getCount());
		return"addquestionlist";
	}
	
	
	
}
