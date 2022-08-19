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


//���ù���Ա��½Ȩ��
@WebFilter("/jsp/root/*")
public class RootLoginFilter implements Filter{
	
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
        HttpServletRequest req =(HttpServletRequest)servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        System.out.println("hello!");
        String root = (String) req.getSession().getAttribute(Constants.ROOT_USERNAME);
        if (root==null){
        	System.out.println(root);
            System.out.println("root!!! null!!");

            ((HttpServletRequest) servletRequest).getSession().setAttribute("msg","���¼��");
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

