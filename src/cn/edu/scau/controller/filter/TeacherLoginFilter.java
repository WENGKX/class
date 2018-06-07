package cn.edu.scau.controller.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName="TeacherLoginFilterimplements",urlPatterns={"/teacher/*" ,"/teacherQuit","/teacherEdit","/teacherDelete","/teacherQueryAll","/preTeacherAddMenber","/teacherAddMenber","/preteacherAdvanceQuery","/teacherAdvanceQuery"},initParams={@WebInitParam(name="login",value="/teacher/teacherLogin")})
public class TeacherLoginFilter implements Filter {
	private FilterConfig fConfig;
	 
    public TeacherLoginFilter() {
    }

	public void destroy() {
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse) response;
		String login = fConfig.getInitParameter("login");
		HttpSession session = req.getSession();
		if(session.getAttribute("teacher") == null && !req.getServletPath().endsWith(login)){
			req.setAttribute("msg", "Äã»¹Î´µÇÂ¼");
			req.getRequestDispatcher("/teacher/teacherLogin").forward(req, resp);
		} else {
			chain.doFilter(request, response);
		}
		
	}


	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.fConfig = fConfig;
	}
}
