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
	

	//ע��У��
	@RequestMapping("/register")
	public String register(Student student,@RequestParam("registCode") String registCode,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String vCode = (String)request.getSession().getAttribute("registCode");
		request.getSession().removeAttribute("registCode");
		if(!vCode.equalsIgnoreCase(registCode)) {
			request.setAttribute("msg", "��֤�����");
			request.setAttribute("student", student);
			return "student/SignUp";				
		}
		String duty = student.getDuty();
		if(duty.equals("�೤")) {
			student.setStatus("1");
		} else {
			student.setStatus("0");
		}

		studentService.regist(student);
		request.setAttribute("msg", "ע��ɹ����ȴ�����Աȷ�ϣ�");
		
		return "student/success";
		
		
	}
	
	//��֤������
	@RequestMapping("/VerifyCode")
	public void VerifyCode(@RequestParam("name") String name,HttpSession session,HttpServletResponse response) throws IOException {
		VerifyCode vc = new VerifyCode();//������֤����
		BufferedImage image  = vc.getImage();//������֤��ͼƬ
		session.setAttribute(name, vc.getText());//��ȡ��֤���ı�
		System.out.println(vc.getText());
		VerifyCode.output(image, response.getOutputStream());//���ͼƬ��ҳ��
	}
	
	//��ְ֤���Ƿ���ʹ��
	@RequestMapping("valiateDuty")
	public void valiateDuty(@RequestParam("duty") String duty,HttpServletResponse response) throws IOException {
		
		System.out.println(duty);
		Student student = null;
		if(!duty.equals("ѧ��")){
			student = (Student)studentService.getByDuty(duty);
		}

		String result = null;
		if(student != null) {
			result = "��ְ���Ѿ���ʹ��";

		} else {
			result = "��ְ�����ʹ��";
		}
	
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().println(result);
		System.out.println(result);
		
	}
	
	//��֤ѧ���Ƿ���ʹ��
	@RequestMapping("valiateSno")
	public void valiateSno(@RequestParam("sno") String sno,HttpServletResponse response) throws IOException {
		
		Student student = (Student)studentService.getBySno(sno);
		String result = null;
		if(student != null) {
			result = "��ѧ���Ѿ���ʹ��";

		} else {
			result = "��ѧ�ſ���ʹ��";

		}
	
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().println(result);
		
	}
	
	//��¼��ע��ҳ������
	@RequestMapping("/preregister")
	public String preregister() {
		return "student/SignUp";	
	}
}
