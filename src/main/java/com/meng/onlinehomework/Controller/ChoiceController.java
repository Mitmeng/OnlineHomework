package com.meng.onlinehomework.Controller;

import java.util.ArrayList;
import java.util.Arrays;
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

import com.meng.onlinehomework.Service.ChoiceService;
import com.meng.onlinehomework.Service.StuhomeworkService;
import com.meng.onlinehomework.pojo.Choice;
import com.meng.onlinehomework.pojo.Homework;
import com.meng.onlinehomework.pojo.Stuhomework;

/**
 * 选择题管理
 * @author Mengfengming
 *
 */
@Controller
public class ChoiceController {

	@Autowired 
	private ChoiceService choiceService;
	@Autowired
	private StuhomeworkService stuhomeworkService;
	
	/*
	 * 成功将选择题添加到数据库后
	 * 教师设置该份选择题的正确答案，以备学生做题时自动打分
	 */
	@RequestMapping("/choicelist")
	public String Choicelist(Integer homeworkid,ModelMap map){
		List<Choice> choicehomeworklist = choiceService.getchoicehomeworkByHId(homeworkid);
		map.addAttribute("choicehomeworklist", choicehomeworklist);
		map.addAttribute("homeworkid", homeworkid);
		
		return"choicepage";
	}
	
	
	//学生做作业（选择题）
	@RequestMapping("/pakegechoice")
	@ResponseBody
	public List<Map<String, Object>> pakegeChoice(String homeworkid){
		//Integer  = Integer.parseInt(data);
		List<Choice> choicehomeworklist = choiceService.getchoicehomeworkByHId(Integer.parseInt(homeworkid));
		List<Map<String, Object>> datas = new ArrayList<>();
		
		for(int i=0;i<choicehomeworklist.size();i++){
			Map< String, Object> map = new HashMap<>();
			map.put("question", choicehomeworklist.get(i).getQuestion());
			List<String> answers = new ArrayList<>();
			if(choicehomeworklist.get(i).getAnswera()!=null){
				answers.add(choicehomeworklist.get(i).getAnswera());
			}
			if(choicehomeworklist.get(i).getAnswerb()!=null){
				answers.add(choicehomeworklist.get(i).getAnswerb());
			}
			if(choicehomeworklist.get(i).getAnswerc()!=null){
				answers.add(choicehomeworklist.get(i).getAnswerc());
			}
			if(choicehomeworklist.get(i).getAnswerd()!=null){
				answers.add(choicehomeworklist.get(i).getAnswerd());
			}
			if(choicehomeworklist.get(i).getAnswere()!=null){
				answers.add(choicehomeworklist.get(i).getAnswere());
			}
			if(choicehomeworklist.get(i).getAnswerf()!=null){
				answers.add(choicehomeworklist.get(i).getAnswerf());
			}
			if(choicehomeworklist.get(i).getAnswerg()!=null){
				answers.add(choicehomeworklist.get(i).getAnswerg());
			}
			
			map.put("answers", answers);
			map.put("correctAnswer", choicehomeworklist.get(i).getCorrectanswer());
			
			datas.add(map);
		}
		return datas;
	}
	
	
	//设置学生答案（选择题）
	@ResponseBody
	@RequestMapping("/setchoicescore")
	public void SetStuchoicescore(HttpSession session,String score,Integer homeworkid,String userAnswer){
		System.out.println("这是设置选择题答案");
		System.out.println(homeworkid);
		System.out.println(score);
//		float price = Float.parseFloat( score);
//		System.out.println(price);
//		Integer csorre = Math.getExponent(price);
//		System.out.println(csorre);
		int idx = score.lastIndexOf(".");
		String strNum = score.substring(0,idx);
		Integer num = Integer.valueOf(strNum);
		System.out.println("num:"+num);
//		Integer scores = Integer.parseInt(score);
		String loginuserid = (String) session.getAttribute("userid");
		Map<String, Object> map = new HashMap<>();
		map.put("stuid", loginuserid);
		map.put("homeworkid", homeworkid);
		map.put("score", num);
		map.put("content", userAnswer);
		stuhomeworkService.insertScoreBymap(map);
	}
	
	
	//查看选择题题目
	@RequestMapping("/choicedetail")
	public String Choicedetail(Integer homeworkid,ModelMap modelMap){
		Stuhomework stuhomework = stuhomeworkService.findById(homeworkid);
		String[] strs = stuhomework.getContent().split(",");
		List<Integer> answerlist = new ArrayList<>();
		//answerlist = Arrays.asList(strs);
		for(String str : strs) {
			  int i = Integer.parseInt(str);
			  answerlist.add(i);
			}
		List<Choice> lChoices = choiceService.getchoicehomeworkByHId(stuhomework.getHomeworkid());
		modelMap.addAttribute("lChoices", lChoices);
		modelMap.addAttribute("stuanswer", answerlist);
		modelMap.addAttribute("stuhomework", stuhomework);
		return "stuchoicehomework";
	}
	
	
	//删除选择题
	@ResponseBody
	@RequestMapping("/delChoice")
	public void DelChoice(Integer id){
		choiceService.deleteById(id);
	}
	
	//跳转到修改选择题
	@RequestMapping("/forupdatechoice")
	public String forupdatechoice(Integer id,Integer flag,ModelMap modelMap){
		Choice choice = choiceService.findById(id);
		modelMap.addAttribute("choice", choice);
		if(flag==1){
			//这是修改
			
		}
		return "updatechoice";
	}
	//这是修改选择题
	@RequestMapping("/updatechoicess")
	public String Updatechoice(Choice choice){
		System.out.println("sdhdskjhdsjdsj");
		choiceService.updateChoice(choice);
		return"redirect:/homeworkdetail?id="+choice.getId()+"&homeworktype=1&flag=1";
	}
}
