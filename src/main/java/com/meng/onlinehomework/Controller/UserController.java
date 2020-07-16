package com.meng.onlinehomework.Controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.meng.onlinehomework.Service.CourseService;
import com.meng.onlinehomework.Service.ElecourseService;
import com.meng.onlinehomework.Service.StuHomeworklistService;
import com.meng.onlinehomework.Service.StuhomeworkService;
import com.meng.onlinehomework.Service.UserService;
import com.meng.onlinehomework.pojo.Elecourse;
import com.meng.onlinehomework.pojo.User;



/**
 * 用户管理
 * @author Administrator
 *
 */
@Controller
public class UserController {

	@Autowired
	private UserService userservice;
	
	@Autowired 
	private ElecourseService elecourseService;
	
	@Autowired
	private StuhomeworkService stuhomeworkService;
	
	@Autowired
	private StuHomeworklistService stuhomeworklistService;
	
	@Autowired 
	private CourseService courseService;
	
//	public static User getLoginUser(HttpServletRequest request) {
//		// TODO Auto-generated method stub
//		User loginuser = (User) request.getSession().getAttribute("loginuser");
//		
//		return loginuser;
//	}
	
	
	//入口
	@RequestMapping(value={"/","/login"})
	public String welcome(HttpSession session){
		session.invalidate();
		return "login";
	}
	
	//教师登录，跳转教师用户页面
	@RequestMapping("/fortecindex")
	public String fortecindexPage(String loginname,Model model){
		model.addAttribute("loginname", loginname);
		return "tecindex";
	}
	
	//学生登录，跳转学生用户界面
	@RequestMapping("/forstuindex")
	public String forstuindexPage(String loginname,Model model){
		model.addAttribute("loginname", loginname);
		return "stuindex";
	}
	
	//管理员登录，跳转管理员界面
		@RequestMapping("/formanagerindex")
		public String formanagerindexPage(String loginname,Model model){
			model.addAttribute("loginname", loginname);
			return "managerindex";
		}
	
	//用户登录
	@RequestMapping(value = "/userlogin",method = RequestMethod.POST)
	public String UserLogin(HttpSession session, String userid,String password,Model model) throws IOException{
		try {
			if(userservice.userLogin(userid, password)){
				User  user = userservice.findUserInfoByUserid(userid);
				session.setAttribute("loginuser",user);
				session.setAttribute("userid", user.getUserid());
				session.setAttribute("id", user.getId());
				session.setAttribute("username", user.getUsername());
				session.setAttribute("loginpassword", user.getPassword());
				model.addAttribute("msg", "success");
				model.addAttribute("loginname", user.getUsername());
				if(user.getUsertype()==1){
					return "redirect:fortecindex";
				}
				else if(user.getUsertype()==0){
					return "redirect:forstuindex";
				}
				else{
					return "redirect:formanagerindex";
				}
			}else{
				model.addAttribute("msg", "error");
				return "login";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("msg", "error");
		return "login";
	}
	
	//管理员用户管理
	@RequestMapping("/usermanager")
	public String Usermanager(Integer usertype,ModelMap modelMap){

	List<User> userlist = userservice.finduserByUsertype(usertype);
	modelMap.addAttribute("userlist", userlist);
	modelMap.addAttribute("usertype", usertype);
		
		return "usermanagerlist";
	}
	
	//跳转注册页面
	@RequestMapping("/registration")
	public String getRegistration(){
	
		return "registration";
	}
	
	//用户注册
	@RequestMapping("/userregisration")
	public String Userregisration(User user,Model model) throws Exception{
		System.out.println("ddskfkdffdjfdjfjd");
		System.out.println(user.toString());
		User users = userservice.findUserInfoByUserid(user.getUserid());
		if(users!=null){
			model.addAttribute("msg", "error");
			return "registration";
		}
		else{
			userservice.addUser(user);
			model.addAttribute("msg", "success");
			System.out.println("发的门店反馈v发动革命开发的");
			return "login";
		}
	}
	
	//用户退出登录
	@RequestMapping("/logout")
	public String Logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
	//用户修改密码
	@RequestMapping("/updatepassword")
	public String Updatepassword(HttpSession session,String newpassword){
		User user = (User) session.getAttribute("loginuser");
		user.setPassword(newpassword);
		userservice.updateuserByid(user);
		return  "redirect:/";
	}
	
	//管理员批量删除用户
	@ResponseBody
	@RequestMapping("/deleteuserByIds")
	public void DeleteuserByIds(String delitems){
		String[] strs = delitems.split(","); 
		for(int i = 0;i < strs.length;i++){
			//删除用户同时要删除该用户的所有选课信息和课程作业信息
			User user = userservice.findById(Integer.parseInt(strs[i]));
			//获取学生的选课信息
			List<Elecourse> stuelecourse = elecourseService.seleCourseBystuid(user.getUserid());
			for(int j=0;j<stuelecourse.size();j++){
				courseService.updateTotaldownByCourseId(stuelecourse.get(i).getCourseid());
				elecourseService.deleteById(stuelecourse.get(j).getId());
			}
			//删除该学生的所有学生作业
			stuhomeworkService.deleteByStuid(user.getUserid());
			//删除套题
			stuhomeworklistService.deleByStuid(user.getUserid());
			userservice.deleteUserById(Integer.parseInt(strs[i]));
		}
	}
	
	//管理员修改用户信息
	@ResponseBody
	@RequestMapping("/updateuser")
	public void Updateuser(User user){
//		System.out.println(user.getPassword());
//		System.out.println(user.getUserid());
//		System.out.println(user.getUsername());
//		System.out.println(user.getId());
//		System.out.println(user.getUsertype());
		userservice.updateuserByid(user);
	}

	//管理员删除用户
	@ResponseBody
	@RequestMapping("/deleteuserById")
	public void DeleteuserById(String id){
		//删除用户同时要删除该用户的所有选课信息和课程作业信息
		User user = userservice.findById(Integer.parseInt(id));
		//获取学生的选课信息
		List<Elecourse> stuelecourse = elecourseService.seleCourseBystuid(user.getUserid());
		for(int i=0;i<stuelecourse.size();i++){
			//选课人数减一
			courseService.updateTotaldownByCourseId(stuelecourse.get(i).getCourseid());
			elecourseService.deleteById(stuelecourse.get(i).getId());
		}
		//删除该学生的所有学生作业
		stuhomeworkService.deleteByStuid(user.getUserid());
		//删除套题
		stuhomeworklistService.deleByStuid(user.getUserid());
		userservice.deleteUserById(Integer.parseInt(id));
	}
	
	//管理员重置密码
	@ResponseBody
	@RequestMapping("/updatepasswordById")
	public void UpdatepasswordById(String id){
		userservice.updatePasswordById(Integer.parseInt(id));
	}
	
	//模糊查询
	@RequestMapping("/selectByKey")
	public String SelectByKey(String key,ModelMap modelMap){
		Map<String, Object> map = new HashMap<>();
		
		map.put("key", key);
		List<User> userlist = userservice.selectByKey(map);
		modelMap.addAttribute("userlist", userlist);
		return "usermanagerlist";
	}
	
	//管理员上传用户
	@RequestMapping(value="/importUser",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String importUser(MultipartFile file,Integer usertype){
		System.out.println("这是导入用户");
		int successcount=0;
		int error =0;
		String msg;
		//获取文件名
		String filename = file.getOriginalFilename();
		System.out.println(filename);
		//Workbook workbook = null;
		try {
			InputStream is = file.getInputStream();
			if(file.getOriginalFilename().endsWith("xlsx")){
				//excel2007
				XSSFWorkbook workbooks = new XSSFWorkbook(is);
				//遍历该表格中所有的工作表，i表示工作表的数量 getNumberOfSheets表示工作表的总数
				for (int i = 0; i < workbooks.getNumberOfSheets(); i++) {
					XSSFSheet xssfsheet = workbooks.getSheetAt(i);
					/*
					 * 循环行Row,excel表格的第一行为标题，i从1开始
					 * 用于存储用户第一行和第二行数据，即学号和姓名
					 */
					List<Map<Integer, String>> userlist = new ArrayList();
					for(int j=1;j<=xssfsheet.getLastRowNum();j++){
						Map<Integer, String> map = new HashMap<>();
						//第几行
						XSSFRow xssfRow = xssfsheet.getRow(j);
						for(int k=0;k<xssfRow.getPhysicalNumberOfCells();k++){
							XSSFCell xssfCell = xssfRow.getCell(k);
							String content = xssfCell.getStringCellValue();
							map.put(k,content);
						}
						userlist.add(map);
					}
					//将数据封装并插入数据库
					for(int h = 0;h<userlist.size();h++){
						User user = new User();
						user.setUsertype(usertype);
						//第一列是学号
						user.setUserid(userlist.get(h).get(0));
						//第二列是姓名
						user.setUsername(userlist.get(h).get(1));
						//默认密码为123456
						user.setPassword("123456");
						try {
							if(userservice.findUserInfoByUserid(userlist.get(h).get(0))==null){
								userservice.addUser(user);
								successcount++;
							}else {
								error++;
							}
						} catch (Exception e) {
							// TODO Auto-generated catch block
							msg="上传文件异常!";
							e.printStackTrace();
						}
					}
				}				
			}else{
				//excel2003
				HSSFWorkbook wb = new HSSFWorkbook(is);
				//遍历该表格中所有的工作表，i表示工作表的数量 getNumberOfSheets表示工作表的总数
				for (int i = 0; i < wb.getNumberOfSheets(); i++) {
					HSSFSheet sheet = wb.getSheetAt(i);
					/*
					 * 循环行Row,excel表格的第一行为标题，i从1开始
					 * 用于存储用户第一行和第二行数据，即学号和姓名
					 */
					List<Map<Integer, String>> userlist = new ArrayList();
					for(int j=1;j<sheet.getLastRowNum();j++){
						Map<Integer, String> map = new HashMap<>();
						//第几行
						HSSFRow xssfRow = sheet.getRow(j);
						//第几列
						for(int k=0;k<xssfRow.getLastCellNum();k++){
							HSSFCell hssfcell = xssfRow.getCell(k);
							map.put(k,getValue(hssfcell));
						}
						userlist.add(map);
					}
					//将数据封装并插入数据库
					for(int h = 0;h<userlist.size();h++){
						User user = new User();
						user.setUsertype(usertype);
						//第一列是学号
						user.setUserid(userlist.get(h).get(0));
						//第二列是姓名
						user.setUsername(userlist.get(h).get(1));
						//默认密码为123456
						user.setPassword("123456");
						try {
							if(userservice.findUserInfoByUserid(userlist.get(h).get(0))==null){
								userservice.addUser(user);
								successcount++;
							}else{
								error++;
							}
							
						} catch (Exception e) {
							// TODO Auto-generated catch block
							msg="上传文件异常!";
							e.printStackTrace();
						}
					}
				}
			  }
			}catch (IOException e) {
			// TODO Auto-generated catch block
				msg = "上传文件异常!";
			e.printStackTrace();
		}
		msg ="上传成功!插入"+successcount+"名用户,"+error+"名用户已存在 。";
		System.out.println(msg);
		return msg;
	}
	
	//excel2003
	@SuppressWarnings("static-access")  
	  private String getValue(HSSFCell hssfCell){  
	    if(hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN){  
	      return String.valueOf( hssfCell.getBooleanCellValue());  
	    }else if(hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC){  
	      return String.valueOf( hssfCell.getNumericCellValue());  
	    }else{  
	      return String.valueOf( hssfCell.getStringCellValue());  
	    }  
	  } 
	
}

