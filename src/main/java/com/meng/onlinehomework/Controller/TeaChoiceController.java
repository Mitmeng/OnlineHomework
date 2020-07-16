package com.meng.onlinehomework.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.meng.onlinehomework.Service.ChoiceService;

/*
 * 选择题
 */

@Controller
public class TeaChoiceController {

	@Autowired
	private ChoiceService choiceService;
	
	
	@RequestMapping("addchoicehomeworkpage")
	public String Addchoicehomeworkpage(){
		return "addchoice";
	}
	
	//添加作业（选择题）
	@RequestMapping("addchoicehomework")
	public String Addchoicehomework(){
		return "";
	}
	
}
