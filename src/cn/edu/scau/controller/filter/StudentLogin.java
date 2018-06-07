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

/**
 * Servlet Filter implementation class StudentLogin
 */
@WebFilter(filterName="StudentLogin",urlPatterns={"/student/*", "/otherMsg", "/classNews", "/lookImage", "/download", "/preWriter", "/writerMessage", "/classMyMsg", "/delMesBySelf", "/classLookThroughMsg","/changePassword", "/communicate",  "/personalMsg"},initParams={@WebInitParam(name="regist",value="/SignUp.jsp")})
public class StudentLogin implements Filter {
	private FilterConfig fConfig;
 
    public StudentLogin() {
    }

	public void destroy() {
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse) response;
		String signup = fConfig.getInitParameter("regist");
		HttpSession session = req.getSession();
		if(session.getAttribute("student") == null && !req.getServletPath().endsWith(signup)) {
			req.setAttribute("msg", "Äã»¹Î´µÇÂ¼");
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
		} else {
			chain.doFilter(request, response);
		}
		
	}


	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.fConfig = fConfig;
	}

}
