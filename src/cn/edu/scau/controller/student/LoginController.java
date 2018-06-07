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
	
	//�˳���¼
		@RequestMapping("/quit")
		public String quit(HttpSession session) {
			session.invalidate();
			return "redirect:/index.jsp";
		}
		
		//��¼У��
		@RequestMapping("/login")
		public String login(Student student,HttpServletRequest request) {
			//�����˻�������
			String sno = student.getSno();
			String password = student.getPassword();
			//���ݿ�����˻�
			Student stu = (Student)studentService.getBySno(sno);
			if(stu == null) {
				request.setAttribute("msg", "���˺Ż�δע�ᣬ����ע�ᣡ");
				request.setAttribute("student", student);
				return "forward:/index.jsp";
			} else {
				if(!stu.getPassword().equals(password)) {
					request.setAttribute("msg", "�˺Ż��������벻��ȷ");
					request.setAttribute("student", student);
					return "forward:/index.jsp";
				} else if (stu.getStatus().equals("0")){
					request.setAttribute("msg", "����Ա��δȷ�ϣ������ĵȴ�~~");
					request.setAttribute("student", student);
					return "forward:/index.jsp";
				} else {
					request.getSession().setAttribute("student", stu);
					return "student/classFrame";
				}
			}
				
		}
}
