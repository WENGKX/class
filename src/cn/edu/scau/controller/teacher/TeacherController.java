package cn.edu.scau.controller.teacher;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.scau.bean.Student;
import cn.edu.scau.bean.Teacher;
import cn.edu.scau.service.StudentService;
import cn.edu.scau.service.TeacherService;

@Controller
public class TeacherController {
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private StudentService studentService;
	
	/*
	 * �õ���ҳ����ѧ����Ϣ
	 */
	public PageInfo<Student> getPage(Integer pn) {
		// �ⲻ��һ����ҳ��ѯ��
		// ����PageHelper��ҳ���
		// �ڲ�ѯ֮ǰֻ��Ҫ���ã�����ҳ�룬�Լ�ÿҳ�Ĵ�С
		PageHelper.startPage(pn, 6);
		//���Է�ҳ��1��Ҫ��Ϊ��0��
		List<Student> stus = studentService.getStusWhereStatus("1");
		// ʹ��pageInfo��װ��ѯ��Ľ����ֻ��Ҫ��pageInfo����ҳ������ˡ�
		// ��װ����ϸ�ķ�ҳ��Ϣ,���������ǲ�ѯ���������ݣ�����������ʾ��ҳ��	
		PageInfo<Student> page = new PageInfo<>(stus, 5);
		return page;
	}
	
	/*
	 * �߼���ѯ
	 */
	@RequestMapping("/teacherAdvanceQuery")
	public String teacherAdvanceQuery(Student student, @RequestParam("pn")Integer pn,HttpServletRequest request) {
		String sno = student.getSno();
		String sname = student.getSname();
		String grade =  student.getGrade();
		String duty = student.getDuty();
		if(student.getDuty().equals("��ѡ")){
			student.setDuty(null);
		}
		student.setStatus("1");
		// �ⲻ��һ����ҳ��ѯ��
		// ����PageHelper��ҳ���
		// �ڲ�ѯ֮ǰֻ��Ҫ���ã�����ҳ�룬�Լ�ÿҳ�Ĵ�С
		PageHelper.startPage(pn, 6);
		//���Է�ҳ��1��Ҫ��Ϊ��0��
		List<Student> stus = studentService.advanceQuery(student);
		// ʹ��pageInfo��װ��ѯ��Ľ����ֻ��Ҫ��pageInfo����ҳ������ˡ�
		// ��װ����ϸ�ķ�ҳ��Ϣ,���������ǲ�ѯ���������ݣ�����������ʾ��ҳ��	
		PageInfo<Student> page = new PageInfo<>(stus, 5);
		request.setAttribute("url", "teacherAdvanceQuery"+ "?sno=" + sno + "&sname=" + sname 
				+ "&grade=" + grade + "&duty=" + duty);
		request.setAttribute("pageInfo", page);
		return "teacher/teacherQueryAll";
	}
	
	/*
	 * �߼���ѯǰ
	 */
	@RequestMapping("/preteacherAdvanceQuery")
	public String preteacherAdvanceQuery(){
		return "teacher/teacherAdvanceQuery";
	}
	
	
	/*
	 * ���ѧ��
	 */
	@RequestMapping("/teacherAddMenber")
	public String teacherAddMenber(Student student,HttpServletRequest request) {
		student.setStatus("1");
		studentService.regist(student);
		request.setAttribute("msg", "���ѧ���ɹ�");
		return "teacher/success";
	}
	/*
	 * ���ѧ��ǰ
	 */
	@RequestMapping("/preTeacherAddMenber")
	public String preTeacherAddMenber() {
		return "teacher/teacherAddMenbers";
	}
	
	/*
	 * ɾ��ѧ��
	 */
	@RequestMapping("/teacherDelete")
	public String Delete(@RequestParam("sno")String sno,@RequestParam("pn")Integer pn,HttpServletRequest request) {
		studentService.logoutBySno(sno);
		PageInfo<Student> page = getPage(pn);
		request.setAttribute("pageInfo", page);		
		return "teacher/teacherQueryAll";
	}
	
	/*
	 * �޸�ѧ����Ϣ
	 */
	@RequestMapping(value="/teacherEdit", method=RequestMethod.PUT)
	public String Edit(Student student, @RequestParam("pn")Integer pn, Model model) {
		String sno = student.getSno();
		Student stu = studentService.getBySno(sno);
		String sname = student.getSname();
		String grade = student.getGrade();
		String duty = student.getDuty();
		String sname2 = stu.getSname();
		String grade2 = stu.getGrade();
		String duty2 = stu.getDuty();
		if(!sname.equals(sname2)||!grade.equals(grade2)||!duty.equals(duty2)) {
			stu.setSname(sname);
			stu.setGrade(grade);
			stu.setDuty(duty);
			studentService.updateBySGD(stu);
		}
		PageInfo<Student> page = getPage(pn);
		model.addAttribute("pageInfo", page);	
		return "teacher/teacherQueryAll";
	}
	
	/*
	 * �޸�ѧ����Ϣǰ
	 */
	@RequestMapping(value="/teacherEdit", method=RequestMethod.GET)
	public String preEdit(@RequestParam("sno")String sno, @RequestParam("pn")Integer pn, Model model) {
		Student student = studentService.getBySno(sno);
		model.addAttribute("stu", student);
		model.addAttribute("pn", pn);
		return "teacher/edit";
	}
	
	/*
	 * ��ѯ����ѧ����Ϣ
	 */
	@RequestMapping("/teacherQueryAll")
	public String teacherQueryAll(@RequestParam("pn")Integer pn,HttpServletRequest request) {
		PageInfo<Student> page = getPage(pn);
		request.setAttribute("pageInfo", page);
		request.setAttribute("url", "teacherQueryAll?sno=");
		return "teacher/teacherQueryAll";
	}
	
	/*
	 * �˳���¼
	 */
	@RequestMapping("/teacherQuit")
	public String quit(HttpSession session) {
		session.invalidate();
		return "teacher/teacherLogin";
	}
	
	//��¼У��
	@RequestMapping("/teacherLogin")
	public String login(Teacher teacher, HttpServletRequest request) {
		//�����˻�������
		String tno = teacher.getTno();
		String password = teacher.getPassword();
		//���ݿ�����˻�
		Teacher tea = teacherService.getTeaByTno(tno);
		if(tea == null) {
			request.setAttribute("msg", "���˺Ż�δע�ᣬ����ע�ᣡ");
			request.setAttribute("teacher", teacher);
			return "teacher/teacherLogin";
		} else {
			if(!tea.getPassword().equals(password)) {
				request.setAttribute("msg", "�˺Ż��������벻��ȷ");
				request.setAttribute("teacher", teacher);
				return "teacher/teacherLogin";
			} else {
				request.getSession().setAttribute("teacher", tea);
				return "teacher/teacherFrame";
			}
		}
		
	}
}
