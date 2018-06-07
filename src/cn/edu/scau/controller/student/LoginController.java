package cn.edu.scau.controller.student;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.scau.bean.Student;
import cn.edu.scau.service.StudentService;

@Controller
public class LoginController {
	
	@Autowired
	private StudentService studentService;
	
	//退出登录
		@RequestMapping("/quit")
		public String quit(HttpSession session) {
			session.invalidate();
			return "redirect:/index.jsp";
		}
		
		//登录校验
		@RequestMapping("/login")
		public String login(Student student,HttpServletRequest request) {
			//表单的账户和密码
			String sno = student.getSno();
			String password = student.getPassword();
			//数据库里的账户
			Student stu = (Student)studentService.getBySno(sno);
			if(stu == null) {
				request.setAttribute("msg", "该账号还未注册，请先注册！");
				request.setAttribute("student", student);
				return "forward:/index.jsp";
			} else {
				if(!stu.getPassword().equals(password)) {
					request.setAttribute("msg", "账号或密码输入不正确");
					request.setAttribute("student", student);
					return "forward:/index.jsp";
				} else if (stu.getStatus().equals("0")){
					request.setAttribute("msg", "管理员还未确认，请耐心等待~~");
					request.setAttribute("student", student);
					return "forward:/index.jsp";
				} else {
					request.getSession().setAttribute("student", stu);
					return "student/classFrame";
				}
			}
				
		}
}
