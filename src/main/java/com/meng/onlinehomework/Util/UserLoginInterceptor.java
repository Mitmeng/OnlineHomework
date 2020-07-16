package com.meng.onlinehomework.Util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.meng.onlinehomework.Controller.UserController;
import com.meng.onlinehomework.pojo.User;

/**
 * 登录拦截器
 */
public class UserLoginInterceptor implements HandlerInterceptor{
	
	private static final String[] Strings = { "/login", "/registration","/userregisration","/userlogin"};

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		//System.out.println("afterCompletion");
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		//System.out.println("postHandle");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//		 TODO Auto-generated method stub
		String applicationName = "/"
              + request.getContextPath().split("/")[request.getContextPath().split("/").length - 1] + "/";
      String requestUrl = request.getRequestURL().toString();
      if (requestUrl.endsWith(applicationName)) {
          return true;
      }else{
    	  boolean flag = false;
          String url = request.getRequestURL().toString();
          for (String s : Strings) {
              if (url.contains(s)) {
                  flag = true;
                  break;
              }
          }
          if (!flag) {
              User user = (User) request.getSession().getAttribute("loginuser");
              if (user != null) {
                  flag = true;
              }else{
            	  request.getRequestDispatcher("/login").forward(request,response);
            	  return flag;
              }
          }
          return flag;
      }
      
	}	
}

