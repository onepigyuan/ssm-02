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

//≈‰÷√¿œ ¶µ«¬Ω»®œﬁ
@WebFilter("/jsp/teacher/*")
public class TeacherLoginFilter implements Filter{
	
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
        HttpServletRequest req =(HttpServletRequest)servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        System.out.println("hello!");
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        String uri = request.getRequestURI();
        System.out.println(uri);
        String teacher = (String) req.getSession().getAttribute(Constants.TEACHER_USERNAME);
        if (teacher==null){
        	System.out.println(teacher);
            System.out.println("root!!! null!!");

            ((HttpServletRequest) servletRequest).getSession().setAttribute("msg","«Îµ«¬º£°");
            resp.sendRedirect("/ssm-02/index.jsp");

        }

        else {
            filterChain.doFilter(servletRequest,servletResponse);
        }
		
	}

	
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}

