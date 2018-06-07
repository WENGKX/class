package cn.edu.scau.controller.student;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.scau.bean.Student;
import cn.edu.scau.service.StudentService;
import cn.itcast.utils.VerifyCode;

@Controller
public class RegisterController {
	
	@Autowired
	private StudentService studentService;
	

	//注册校验
	@RequestMapping("/register")
	public String register(Student student,@RequestParam("registCode") String registCode,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String vCode = (String)request.getSession().getAttribute("registCode");
		request.getSession().removeAttribute("registCode");
		if(!vCode.equalsIgnoreCase(registCode)) {
			request.setAttribute("msg", "验证码错误！");
			request.setAttribute("student", student);
			return "student/SignUp";				
		}
		String duty = student.getDuty();
		if(duty.equals("班长")) {
			student.setStatus("1");
		} else {
			student.setStatus("0");
		}

		studentService.regist(student);
		request.setAttribute("msg", "注册成功，等待管理员确认！");
		
		return "student/success";
		
		
	}
	
	//验证码请求
	@RequestMapping("/VerifyCode")
	public void VerifyCode(@RequestParam("name") String name,HttpSession session,HttpServletResponse response) throws IOException {
		VerifyCode vc = new VerifyCode();//创建验证码类
		BufferedImage image  = vc.getImage();//创建验证码图片
		session.setAttribute(name, vc.getText());//获取验证码文本
		System.out.println(vc.getText());
		VerifyCode.output(image, response.getOutputStream());//输出图片到页面
	}
	
	//验证职务是否已使用
	@RequestMapping("valiateDuty")
	public void valiateDuty(@RequestParam("duty") String duty,HttpServletResponse response) throws IOException {
		
		System.out.println(duty);
		Student student = null;
		if(!duty.equals("学生")){
			student = (Student)studentService.getByDuty(duty);
		}

		String result = null;
		if(student != null) {
			result = "该职务已经被使用";

		} else {
			result = "该职务可以使用";
		}
	
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().println(result);
		System.out.println(result);
		
	}
	
	//验证学号是否已使用
	@RequestMapping("valiateSno")
	public void valiateSno(@RequestParam("sno") String sno,HttpServletResponse response) throws IOException {
		
		Student student = (Student)studentService.getBySno(sno);
		String result = null;
		if(student != null) {
			result = "该学号已经被使用";

		} else {
			result = "该学号可以使用";

		}
	
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().println(result);
		
	}
	
	//登录跳注册页面请求
	@RequestMapping("/preregister")
	public String preregister() {
		return "student/SignUp";	
	}
}
