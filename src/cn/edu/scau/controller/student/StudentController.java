package cn.edu.scau.controller.student;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.scau.bean.Comment;
import cn.edu.scau.bean.Inform;
import cn.edu.scau.bean.Mc;
import cn.edu.scau.bean.Message;
import cn.edu.scau.bean.Photo;
import cn.edu.scau.bean.Student;
import cn.edu.scau.service.CommentService;
import cn.edu.scau.service.InformService;
import cn.edu.scau.service.McService;
import cn.edu.scau.service.MessageAndCommentTxService;
import cn.edu.scau.service.MessageService;
import cn.edu.scau.service.PhotoService;
import cn.edu.scau.service.StudentService;


@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private InformService informService;
	
	@Autowired
	private PhotoService photoService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private McService mcService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private Mc mc;
	
	@Autowired
	private MessageAndCommentTxService messageAndCommentTxService;
	
	/*
	 * ���Խ���
	 */
	@RequestMapping("/communicate")
	public String communicate(Comment comment, @RequestParam("mno")Integer mno, HttpSession session) {
		Student student = (Student) session.getAttribute("student");
		comment.setStudent(student);
		String cno = UUID.randomUUID().toString().replaceAll("-","");
		comment.setCno(cno);
		Message message = messageService.getMessageByMno(mno);
		mc.setComment(comment);
		mc.setMessage(message);
		messageAndCommentTxService.replyMessage(comment, mc);
		return "redirect:/classLookThroughMsg";
	}
	
	
	/*
	 * �鿴�༶����
	 *///classLookThroughMsg
	@RequestMapping("/classLookThroughMsg")
	public String classLookThroughMsg(Model model) {
		List<Message> messages = messageService.getAllMessage();
		List<Comment> comments = commentService.getAllcomment();
		List<Mc> mcs = mcService.getAllMcs();
		model.addAttribute("messages", messages);
		model.addAttribute("comments", comments);
		model.addAttribute("mcs", mcs);
		return "student/classLookThroughMsg";
	}
	
	
	/*
	 * ɾ���ҵ�����
	 */
	@RequestMapping("/delMesBySelf")
	public String delMesBySelf(@RequestParam("mno")Integer mno) {
		//System.out.println(mno);
		List<Mc> mcs= mcService.getMcsByMno(mno);
		messageAndCommentTxService.delMesBySelf(mno, mcs);
		return "redirect:/classMyMsg";
	}
	
	
	/*
	 * �鿴�ҵ�����
	 */
	@RequestMapping("/classMyMsg")
	public String classMyMsg(Model model, HttpSession session) {
		Student student = (Student) session.getAttribute("student");
		String sno = student.getSno();
		List<Message> messages = messageService.getMessageBySno(sno);
		List<Mc> mcs = mcService.getAllMcs();
		List<Comment> comments = commentService.getAllcommentByMessageSno(sno);
		model.addAttribute("messages", messages);
		model.addAttribute("comments", comments);
		model.addAttribute("mcs", mcs);
		return "student/classMyMsg";
	}
	
	
	/*
	 * д����
	 */
	@RequestMapping("/writerMessage")
	public String writerMessage(Message message, HttpSession session) {
		Student student = (Student) session.getAttribute("student");
		message.setStudent(student);
		messageService.saveMessage(message);
		return "redirect:/student/classMain";
	}
	
	/*
	 * д����ǰ
	 */
	@RequestMapping("/preWriter")
	public String preWriter() {
		return "student/classWriteMsg";
	}
	
	/*
	 * ������Ƭ
	 */
	@RequestMapping("/download")
	public ResponseEntity<byte[]> download(@RequestParam("pno")String pno, HttpSession session) throws IOException {

		Photo photo = photoService.getImageByPno(pno);
		String path = photo.getImage();
		String fileName = path.substring(path.lastIndexOf("/")+1);
		byte[] body = null;
		ServletContext servletContext = session.getServletContext();
		InputStream in = servletContext.getResourceAsStream(path);
		body = new byte[in.available()];
		in.read(body);
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "attachment;filename=" + fileName);
		
		HttpStatus statusCode = HttpStatus.OK;
		
		ResponseEntity<byte[]> response = new ResponseEntity<byte[]>(body, headers, statusCode);
		
		return response;
		
	}
	
	
	/*
	 * �鿴��Ƭ
	 */
	@RequestMapping("/lookImage")
	public String lookImage(@RequestParam("pn")Integer pn, Model model) {
		PageHelper.startPage(pn, 3);
		List<Photo> photos = photoService.getImages();
		// ʹ��pageInfo��װ��ѯ��Ľ����ֻ��Ҫ��pageInfo����ҳ������ˡ�
		// ��װ����ϸ�ķ�ҳ��Ϣ,���������ǲ�ѯ���������ݣ�����������ʾ��ҳ��	
		PageInfo<Photo> page = new PageInfo<>(photos, 5);
		model.addAttribute("pageInfo", page);
		
		return "student/classPicture";
	}
	
	/*
	 * �鿴���Ź���
	 */
	@RequestMapping("/classNews")
	public String classNews(@RequestParam("pn")Integer pn, Model model) {
		Student student = studentService.getByDuty("�೤");
		PageHelper.startPage(pn, 3);
		List<Inform> informs = informService.getAllInfo();
		// ʹ��pageInfo��װ��ѯ��Ľ����ֻ��Ҫ��pageInfo����ҳ������ˡ�
		// ��װ����ϸ�ķ�ҳ��Ϣ,���������ǲ�ѯ���������ݣ�����������ʾ��ҳ��	
		PageInfo<Inform> page = new PageInfo<>(informs, 5);
		model.addAttribute("pageInfo", page);
		model.addAttribute("informs", informs);
		model.addAttribute("student", student);
		return "student/classNews";
	}
	
	/*
	 * �޸�����
	 */
	@RequestMapping(value="/changePassword", method=RequestMethod.PUT)
	public String changePassword(@RequestParam("newPwd") String newPwd,HttpSession session) {
		Student student = (Student) session.getAttribute("student");
		String sno = student.getSno();
		
		studentService.changePassword(sno,newPwd);
		student.setPassword(newPwd);
		session.setAttribute("student", student);
		return "student/classFrame";
	}
	
	/*
	 * У���޸ĵ�����
	 */
	@RequestMapping(value="/validPassword")
	public void validPassword(@RequestParam("password") String password,HttpSession session,HttpServletResponse response) throws IOException {
		Student student = (Student) session.getAttribute("student");
		String pwd = student.getPassword();
		response.setContentType("text/html; charset=UTF-8");
		if(!pwd.equals(password)) {
			response.getWriter().println("���������������������");
		} else{
			response.getWriter().println("����������ȷ");
		}
	}
	
	/*
	 * �޸�����ǰ
	 */
	@RequestMapping(value="/changePassword", method=RequestMethod.GET)
	public String preChangePassword() {
		return "student/changePassword";
	}
	
	
	/*
	 * �޸ĸ�����Ϣ
	 */
	@RequestMapping(value="/personalMsg", method=RequestMethod.PUT)
	public String update(Student student,HttpSession session) {
		Student stu = (Student) session.getAttribute("student");
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
			session.setAttribute("student", stu);
		}
		return "student/classFrame";
	}
	
	/*
	 * �޸ĸ�����Ϣǰ
	 */
	@RequestMapping(value="/personalMsg", method=RequestMethod.GET)
	public String prepersonalMsg(HttpServletRequest request) {
		Student stu = (Student) request.getSession().getAttribute("student");
		request.setAttribute("stu", stu);
		return "student/classPersonalMsg";
	}
		
	//�鿴������Ա��Ϣ
	@RequestMapping("/otherMsg")
	public String otherMsg(@RequestParam(value = "pn", defaultValue="1") Integer pn,@RequestParam("sno") String sno,Model model) {
		// �ⲻ��һ����ҳ��ѯ��
		// ����PageHelper��ҳ���
		// �ڲ�ѯ֮ǰֻ��Ҫ���ã�����ҳ�룬�Լ�ÿҳ�Ĵ�С
		PageHelper.startPage(pn, 6);
		//���Է�ҳ��1��Ҫ��Ϊ��0��
		List<Student> stus = studentService.getStusWhereStatusAndSno("1",sno);
		// ʹ��pageInfo��װ��ѯ��Ľ����ֻ��Ҫ��pageInfo����ҳ������ˡ�
		// ��װ����ϸ�ķ�ҳ��Ϣ,���������ǲ�ѯ���������ݣ�����������ʾ��ҳ��	
		PageInfo<Student> page = new PageInfo<>(stus, 5);
		model.addAttribute("pageInfo", page);

		return "student/classOtherMsg";
	}	
	
}
