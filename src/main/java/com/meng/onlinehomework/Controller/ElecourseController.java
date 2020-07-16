package com.meng.onlinehomework.Controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.meng.onlinehomework.Service.CourseService;
import com.meng.onlinehomework.Service.ElecourseService;
import com.meng.onlinehomework.Service.HomeworkService;
import com.meng.onlinehomework.Service.StuhomeworkService;
import com.meng.onlinehomework.Service.UserService;
import com.meng.onlinehomework.pojo.Course;
import com.meng.onlinehomework.pojo.Elecourse;
import com.meng.onlinehomework.pojo.Homework;
import com.meng.onlinehomework.pojo.Stuhomework;


/*
 * 选课关系
 */
@Controller
public class ElecourseController {

	@Autowired
	private ElecourseService elecourseService;
	@Autowired
	private CourseService courseservice;
	@Autowired
	private UserService userService;
	@Autowired
	private HomeworkService homeworkService;
	@Autowired
	private StuhomeworkService stuhomeworkService;
	//实验ajax查询课程的选课学生，页面动态生成表格 
	@ResponseBody
	@RequestMapping("/seleCouseStuByCouId")

	public Map<String, Object> seleCouseStuByCourseId(String courseid){
		Map<String, Object> elecoustuMap = new HashMap<String,Object>();
		List<Elecourse> elecourselist = elecourseService.SeleCouseStuByCourseId(courseid);
		boolean ret = elecourselist.isEmpty();
		elecoustuMap.put("ret", ret);
		elecoustuMap.put("elecourselist", elecourselist);
		//return "redirect:/courseslist";
		return elecoustuMap;
	}	
	
	//查询可选课程
	@RequestMapping(value={"elecoustulist"})
	public String Elecoustulist(HttpSession session,ModelMap modelMap,String courseid){
		//System.out.println("****************");
		String teacherid = (String) session.getAttribute("userid");
		List<Course> courselist = courseservice.GetCourseByteaid(teacherid);
		List<Elecourse> elecourseslist = elecourseService.SeleCouseStuByCourseId(courseid);
		modelMap.addAttribute("courselist",courselist);
		modelMap.addAttribute("elecourseslist", elecourseslist);
		return "elecoursestulist";
	}
	
	//学生选课
	@RequestMapping("/addcourse")
	public String stuselectcourse(HttpSession session ,String courseid,String coursename,String teachername){
		Elecourse elecourse = new Elecourse();
		elecourse.setCourseid(courseid);
		elecourse.setCoursename(coursename);
		elecourse.setTeachername(teachername);
		String stuid = (String) session.getAttribute("userid");
		String stuname =(String) session.getAttribute("username");
		elecourse.setStuid(stuid);
		elecourse.setStuname(stuname);
		elecourseService.Addelecourse(elecourse);
		//该课程选课人数加一
		courseservice.updateTotaladdByCourseid(courseid);
		//添加该课程的全部作业
		List<Homework> homeworklist = homeworkService.findhomeworkByCourseid(courseid);
		for(int l=0;l<homeworklist.size();l++){
			Stuhomework stuhomework = new Stuhomework();
			stuhomework.setHomeworkid(homeworklist.get(l).getId());
			stuhomework.setHomeworktitle(homeworklist.get(l).getTitle());
			stuhomework.setHomeworktype(homeworklist.get(l).getHomeworktype());
			stuhomework.setScore(0);
			stuhomework.setStuid(stuid);
			stuhomework.setSubmits(0);
			//选课学生添加已存在作业
			stuhomeworkService.insertstuhomework(stuhomework);
		}
		return "redirect:stumycourselist";
	}
	
	
	//导入选课

	@RequestMapping(value="/importselectstu",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String Importselectstu(MultipartFile file,String courseid,HttpSession session ){
		String message;
		String teachername = (String) session.getAttribute("username");
		Course course = courseservice.GetCourseByCourseid(courseid);
		int successcount=0;
		int error =0;
		//获取文件名
		String filename = file.getOriginalFilename();
		//转换成输入流
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
					for(int k = 0;k<userlist.size();k++){
						Elecourse elecourse = new Elecourse();
						elecourse.setCourseid(courseid);
						elecourse.setCoursename(course.getCoursename());
						elecourse.setTeachername(teachername);
						//第一列是学号
						elecourse.setStuid(userlist.get(k).get(0));
						//第二列是姓名
						elecourse.setStuname(userlist.get(k).get(1));
						//插入选课
						try {
							//验证用户是否已存在
							if(userService.findUserInfoByUserid(userlist.get(k).get(0))!=null){
								//用户存在，查询学生是否已经选课
								Map<String, Object> map = new HashMap<>();
								map.put("stuid", userlist.get(k).get(0));
								map.put("courseid", courseid);
								if(elecourseService.findByStuidAndCourseid(map)==null){
									elecourseService.Addelecourse(elecourse);
									//更新选课情况
									courseservice.updateTotaladdByCourseid(courseid);
									//添加学生课程作业
									List<Homework> homeworklist = homeworkService.findhomeworkByCourseid(courseid);
									for(int l=0;l<homeworklist.size();l++){
										Stuhomework stuhomework = new Stuhomework();
										stuhomework.setHomeworkid(homeworklist.get(l).getId());
										stuhomework.setHomeworktitle(homeworklist.get(l).getTitle());
										stuhomework.setHomeworktype(homeworklist.get(l).getHomeworktype());
										stuhomework.setScore(0);
										stuhomework.setStuid(userlist.get(k).get(0));
										stuhomework.setSubmits(0);
										//选课学生添加已存在作业
										stuhomeworkService.insertstuhomework(stuhomework);
									}
									successcount++;
								}					
							}else{
								error++;
							}
							//message="导入成功!共导入"+successcount+"名学生，"+error+"名学生未注册!";
						} catch (Exception e) {
							// TODO Auto-generated catch block
							message="文件上传异常!";
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
					for(int k = 0;k<userlist.size();k++){
						Elecourse elecourse = new Elecourse();
						elecourse.setCourseid(courseid);
						elecourse.setCoursename(course.getCoursename());
						elecourse.setTeachername(teachername);
						//第一列是学号
						elecourse.setStuid(userlist.get(k).get(0));
						//第二列是姓名
						elecourse.setStuname(userlist.get(k).get(1));
						//插入选课
						try {
							//验证用户是否已存在
							if(userService.findUserInfoByUserid(userlist.get(k).get(0))!=null){
								//用户存在，查询学生是否已经选课
								Map<String, Object> map = new HashMap<>();
								map.put("stuid", userlist.get(k).get(0));
								map.put("courseid", courseid);
								if(elecourseService.findByStuidAndCourseid(map)==null){
									elecourseService.Addelecourse(elecourse);
									//更新选课情况
									courseservice.updateTotaladdByCourseid(courseid);
									//添加学生课程作业
									List<Homework> homeworklist = homeworkService.findhomeworkByCourseid(courseid);
									for(int l=0;l<homeworklist.size();l++){
										Stuhomework stuhomework = new Stuhomework();
										stuhomework.setHomeworkid(homeworklist.get(l).getId());
										stuhomework.setHomeworktitle(homeworklist.get(l).getTitle());
										stuhomework.setHomeworktype(homeworklist.get(l).getHomeworktype());
										stuhomework.setScore(0);
										stuhomework.setStuid(userlist.get(k).get(0));
										stuhomework.setSubmits(0);
										//选课学生添加已存在作业
										stuhomeworkService.insertstuhomework(stuhomework);
									}
									successcount++;
								}		
							}else{
								error++;
							}
							//message="导入成功!共导入"+successcount+"名学生，"+error+"名学生未注册!";
						} catch (Exception e) {
							// TODO Auto-generated catch block
							message="文件上传异常!";
							e.printStackTrace();
						}
						
					}
				}
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			message="文件上传异常!";
			e.printStackTrace();
		}
		message="导入成功!共导入"+successcount+"名学生，"+error+"名学生未注册!";			
		return message;
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
	
	
	//批量删除学生选课（学生退课）
	@ResponseBody
	@RequestMapping("/delelecourseByIds")
	public void DelelecourseByIds(String delitems){
		String[] strs = delitems.split(",");
		for(int i=0;i<strs.length;i++){
			//根据id查询该选课记录
			Elecourse elecourse = elecourseService.findById(Integer.parseInt(strs[i]));
			//根据课程号查询该课程的所有作业
			List<Homework> homeworklist = homeworkService.findhomeworkByCourseid(elecourse.getCourseid());
			//根据作业id和学号删除学生课程作业
			for(int j=0;j<homeworklist.size();j++){
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("homeworkid", homeworklist.get(j).getId());
				map.put("stuid", elecourse.getStuid());
				System.out.println( elecourse.getStuid());
				System.out.println(homeworklist.get(j).getId());
				stuhomeworkService.deleteByIdAndStuid(map);
				//stuhomeworkService.deleStuHomeworkByHomeworkid(homeworklist.get(j).getId());
			}
			//更新课程的选课人数
			courseservice.updateTotaldownByCourseId(elecourse.getCourseid());
			//删除选课学生
			elecourseService.deleteById(elecourse.getId());
		}
	}
	
	//删除学生选课（学生退课）
	@ResponseBody
	@RequestMapping("/delelecourseById")
	public void DelelecourseById(Integer id){
		//根据id查询该选课记录
		Elecourse elecourse = elecourseService.findById(id);
		//根据课程号查询该课程的所有作业
		List<Homework> homeworklist = homeworkService.findhomeworkByCourseid(elecourse.getCourseid());
		//根据作业id和学号删除学生课程作业
		for(int j=0;j<homeworklist.size();j++){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("homeworkid", homeworklist.get(j).getId());
			map.put("stuid", elecourse.getStuid());
			System.out.println( elecourse.getStuid());
			System.out.println(homeworklist.get(j).getId());
			stuhomeworkService.deleteByIdAndStuid(map);
			//stuhomeworkService.deleStuHomeworkByHomeworkid(homeworklist.get(j).getId());
		}
		//更新课程的选课人数
		courseservice.updateTotaldownByCourseId(elecourse.getCourseid());
		//删除选课学生
		elecourseService.deleteById(elecourse.getId());
		
	}
	
	
}
