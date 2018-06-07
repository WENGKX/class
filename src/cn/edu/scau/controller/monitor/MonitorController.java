package cn.edu.scau.controller.monitor;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
public class MonitorController {
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private InformService informService;
	
	@Autowired
	private PhotoService photoService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private McService mcService;
	
	@Autowired
	private Mc mc;
	
	@Autowired
	private MessageAndCommentTxService messageAndCommentTxService;
	
	/*
	 * �ظ�����
	 */
	@RequestMapping("/replyMessage")
	public String replyMessage(Comment comment, @RequestParam("mno") Integer mno) {
		
		Student student = studentService.getByDuty("�೤");
		comment.setStudent(student);
		String cno = UUID.randomUUID().toString().replaceAll("-","");
		
		comment.setCno(cno);
		Message message = messageService.getMessageByMno(mno);
		mc.setComment(comment);
		mc.setMessage(message);
		messageAndCommentTxService.replyMessage(comment, mc);
		return "redirect:/preManageMsg";
	}
	
	/*
	 * ɾ������
	 */
	//@RequestParam("mc")Mc mc, 
	@RequestMapping("/delMesByBz")
	public String delMesByBz(@RequestParam("mno")Integer mno) {
		List<Comment> comments =  commentService.getCommentsByMno(mno);
		messageAndCommentTxService.delMessage(mno, comments);
		return "Monitor/monitormain";
	}
	/*
	 * ��������ǰ
	 */
	@RequestMapping("/preManageMsg")
	public String preManageMsg(Model model) {
		
		List<Message> messages = messageService.getAllMessage();
		List<Comment> comments = commentService.getAllcommentByBz();
		List<Mc> mcs = mcService.getAllMcs();
		model.addAttribute("messages", messages);
		model.addAttribute("comments", comments);
		model.addAttribute("mcs", mcs);
		return "Monitor/manageMsg";
	}
	
	
	/*
	 * �ϴ���Ƭ
	 */
	@RequestMapping("/upload")	
	public String fileUpload(Photo photo,
			 @RequestParam("file") MultipartFile file, HttpServletRequest request) throws IOException {	
		//����ļ����ͣ������ж��������ͼƬ����ֹ�ϴ���
		String contentType=file.getContentType();
		//����ļ���׺����
		String imageName=contentType.substring(contentType.indexOf("/")+1);
		if(file.isEmpty()) {
			request.setAttribute("msg", "�ϴ�ʧ��:�ļ�Ϊ��");
			return "Monitor/upLoadPictures";
		} else if (imageName.equals("jpeg")||imageName.equals("gif")||imageName.equals("png")||imageName.equals("jpg")){
			long fileSize = file.getSize();    
		    if (fileSize <= 0) {  
		    	request.setAttribute("msg", "�ϴ�ʧ��:�ļ�Ϊ��");
		    	return "Monitor/upLoadPictures";
		    } else if (fileSize > (500 * 1024)) {  
		    	request.setAttribute("msg", "�ϴ�ʧ��:�ļ���С���ܳ���500K");
		    	return "Monitor/upLoadPictures"; 
		    }

			String pathRoot = request.getServletContext().getRealPath("/static/images");
			String path="";
			String uuid = UUID.randomUUID().toString().replaceAll("-","");
			path=uuid+"."+imageName;
			String image = "\\static\\images\\" + path;
			photo.setImage(image);
			System.out.println(image);
			String savePath = pathRoot +"\\"+ path;
			file.transferTo(new File(savePath));
		    BufferedImage sourceImg = ImageIO.read(new FileInputStream(savePath));  
            float imgWidth = (float)sourceImg.getWidth();  
            float imgHeight = (float)sourceImg.getHeight(); 
            float mydiv = (float)imgWidth/imgHeight;
            System.out.println("�ϴ���ͼƬ��" + imgWidth);  
            System.out.println("�ϴ���ͼƬ�ߣ�" + imgHeight); 
            System.out.println(mydiv);
            if(mydiv > 1.4) {
            	request.setAttribute("msg", "�ϴ���ͼƬ��ߴ���7/5���������ϴ�");
		    	return "Monitor/upLoadPictures"; 
            }	
			photoService.saveImage(photo);	
			return "redirect:/Monitor/monitormain";	
		} else {
			request.setAttribute("msg", "ͼƬ��ʽ������Ҫ���������ϴ�");
			return "Monitor/upLoadPictures";
		}
	}
	
	
	/*
	 * �ϴ���Ƭǰ
	 */
	@RequestMapping("/preUpload")
	public String preUpload() {
		return "Monitor/upLoadPictures";
	}
	
	/*
	 * �������Ź���
	 */
	@RequestMapping("/newAnnouce")
	public String newAnnouce(Inform inform){
		informService.saveInform(inform);
		return "Monitor/monitormain";
	}
	
	/*
	 * ���Ź��淢��ǰ
	 */
	@RequestMapping("/prenewAnnouce")
	public String prenewAnnouce() {
		return "Monitor/newAnnouce";
	}
	
	//ע��
	@RequestMapping("/logout/{sno}")
	public String logout(@PathVariable("sno") String sno) {
		System.out.println(sno);
		studentService.logoutBySno(sno);
		return "forward:/preconfirm";
	}
	
	//ȷ�ϵ�¼
	@RequestMapping("/confirm/{sno}")
	public String confirm(@PathVariable("sno") String sno) {
		studentService.confirmBySno(sno);
		return "forward:/preconfirm";
	}
	
	//תȷ��ע��ҳ��
	@RequestMapping("/preconfirm")
	public String preconfirm(@RequestParam(value = "pn", defaultValue="1") Integer pn,Model model) {
		// �ⲻ��һ����ҳ��ѯ��
		// ����PageHelper��ҳ���
		// �ڲ�ѯ֮ǰֻ��Ҫ���ã�����ҳ�룬�Լ�ÿҳ�Ĵ�С
		PageHelper.startPage(pn, 9);
		//���Է�ҳ��1��Ҫ��Ϊ��0��
		List<Student> stus = studentService.getStusWhereStatus("0");
		// ʹ��pageInfo��װ��ѯ��Ľ����ֻ��Ҫ��pageInfo����ҳ������ˡ�
		// ��װ����ϸ�ķ�ҳ��Ϣ,���������ǲ�ѯ���������ݣ�����������ʾ��ҳ��	
		PageInfo<Student> page = new PageInfo<>(stus, 5);
		model.addAttribute("pageInfo", page);
		
//		request.setAttribute("students", stus);
		return "Monitor/RegisterConform";
	}
	
	//�˳���¼
	@RequestMapping("/monitorquit")
	public String quit(HttpSession session) {
		session.invalidate();
		return "redirect:/Monitor/monitorLogin";
	}
	
	
	//��֤��¼
	@RequestMapping("/monitorLogin")
	public String login(Student student,HttpServletRequest request) {
		//�����˻�������
		String sno = student.getSno();
		String password = student.getPassword();
		//���ݿ�����˻�
		Student stu = (Student)studentService.getBySno(sno);
		if(stu == null) {
			request.setAttribute("msg", "���˺Ż�δע�ᣬ����ע�ᣡ");
			request.setAttribute("student", student);
			return "forward:/Monitor/monitorLogin";
		} else {
			if(!stu.getPassword().equals(password)) {
				request.setAttribute("msg", "�˺Ż��������벻��ȷ");
				request.setAttribute("student", student);
				return "forward:/Monitor/monitorLogin";
			} else if (stu.getStatus().equals("0")){
				request.setAttribute("msg", "�㲻�ǹ���Ա���೤�������¼��_��");
				request.setAttribute("student", student);
				return "forward:/Monitor/monitorLogin";
			} else if (!stu.getDuty().equals("�೤")){
				request.setAttribute("msg", "�㲻�ǹ���Ա���೤�������¼��_��");
				request.setAttribute("student", student);
				return "forward:/Monitor/monitorLogin";
			} else {
				request.getSession().setAttribute("student", stu);
				return "Monitor/monitormain";
			}
		}
			
	}
}
