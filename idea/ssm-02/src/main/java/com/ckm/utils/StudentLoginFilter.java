package com.ckm.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//ÅäÖÃÑ§ÉúµÇÂ½È¨ÏÞ
@WebFilter("/jsp/student/*")
public class StudentLoginFilter implements Filter{
	
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
        HttpServletRequest req =(HttpServletRequest)servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        System.out.println("hello!");
        String student = (String) req.getSession().getAttribute(Constants.STUDENT_USERNAME);
        if (student==null){
        	System.out.println(student);
            System.out.println("root!!! null!!");

            ((HttpServletRequest) servletRequest).getSession().setAttribute("msg","ÇëµÇÂ¼£¡");
            resp.sendRedirect("/index.jsp");

        }
        else {
            filterChain.doFilter(servletRequest,servletResponse);
        }
		
	}

	
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}

