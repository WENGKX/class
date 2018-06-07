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
	 * 得到分页所有学生信息
	 */
	public PageInfo<Student> getPage(Integer pn) {
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 6);
		//测试分页“1”要改为”0“
		List<Student> stus = studentService.getStusWhereStatus("1");
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数	
		PageInfo<Student> page = new PageInfo<>(stus, 5);
		return page;
	}
	
	/*
	 * 高级查询
	 */
	@RequestMapping("/teacherAdvanceQuery")
	public String teacherAdvanceQuery(Student student, @RequestParam("pn")Integer pn,HttpServletRequest request) {
		String sno = student.getSno();
		String sname = student.getSname();
		String grade =  student.getGrade();
		String duty = student.getDuty();
		if(student.getDuty().equals("不选")){
			student.setDuty(null);
		}
		student.setStatus("1");
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 6);
		//测试分页“1”要改为”0“
		List<Student> stus = studentService.advanceQuery(student);
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数	
		PageInfo<Student> page = new PageInfo<>(stus, 5);
		request.setAttribute("url", "teacherAdvanceQuery"+ "?sno=" + sno + "&sname=" + sname 
				+ "&grade=" + grade + "&duty=" + duty);
		request.setAttribute("pageInfo", page);
		return "teacher/teacherQueryAll";
	}
	
	/*
	 * 高级查询前
	 */
	@RequestMapping("/preteacherAdvanceQuery")
	public String preteacherAdvanceQuery(){
		return "teacher/teacherAdvanceQuery";
	}
	
	
	/*
	 * 添加学生
	 */
	@RequestMapping("/teacherAddMenber")
	public String teacherAddMenber(Student student,HttpServletRequest request) {
		student.setStatus("1");
		studentService.regist(student);
		request.setAttribute("msg", "添加学生成功");
		return "teacher/success";
	}
	/*
	 * 添加学生前
	 */
	@RequestMapping("/preTeacherAddMenber")
	public String preTeacherAddMenber() {
		return "teacher/teacherAddMenbers";
	}
	
	/*
	 * 删除学生
	 */
	@RequestMapping("/teacherDelete")
	public String Delete(@RequestParam("sno")String sno,@RequestParam("pn")Integer pn,HttpServletRequest request) {
		studentService.logoutBySno(sno);
		PageInfo<Student> page = getPage(pn);
		request.setAttribute("pageInfo", page);		
		return "teacher/teacherQueryAll";
	}
	
	/*
	 * 修改学生信息
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
	 * 修改学生信息前
	 */
	@RequestMapping(value="/teacherEdit", method=RequestMethod.GET)
	public String preEdit(@RequestParam("sno")String sno, @RequestParam("pn")Integer pn, Model model) {
		Student student = studentService.getBySno(sno);
		model.addAttribute("stu", student);
		model.addAttribute("pn", pn);
		return "teacher/edit";
	}
	
	/*
	 * 查询所有学生信息
	 */
	@RequestMapping("/teacherQueryAll")
	public String teacherQueryAll(@RequestParam("pn")Integer pn,HttpServletRequest request) {
		PageInfo<Student> page = getPage(pn);
		request.setAttribute("pageInfo", page);
		request.setAttribute("url", "teacherQueryAll?sno=");
		return "teacher/teacherQueryAll";
	}
	
	/*
	 * 退出登录
	 */
	@RequestMapping("/teacherQuit")
	public String quit(HttpSession session) {
		session.invalidate();
		return "teacher/teacherLogin";
	}
	
	//登录校验
	@RequestMapping("/teacherLogin")
	public String login(Teacher teacher, HttpServletRequest request) {
		//表单的账户和密码
		String tno = teacher.getTno();
		String password = teacher.getPassword();
		//数据库里的账户
		Teacher tea = teacherService.getTeaByTno(tno);
		if(tea == null) {
			request.setAttribute("msg", "该账号还未注册，请先注册！");
			request.setAttribute("teacher", teacher);
			return "teacher/teacherLogin";
		} else {
			if(!tea.getPassword().equals(password)) {
				request.setAttribute("msg", "账号或密码输入不正确");
				request.setAttribute("teacher", teacher);
				return "teacher/teacherLogin";
			} else {
				request.getSession().setAttribute("teacher", tea);
				return "teacher/teacherFrame";
			}
		}
		
	}
}
