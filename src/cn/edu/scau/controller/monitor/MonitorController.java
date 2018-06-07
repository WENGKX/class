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
	 * 回复留言
	 */
	@RequestMapping("/replyMessage")
	public String replyMessage(Comment comment, @RequestParam("mno") Integer mno) {
		
		Student student = studentService.getByDuty("班长");
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
	 * 删除留言
	 */
	//@RequestParam("mc")Mc mc, 
	@RequestMapping("/delMesByBz")
	public String delMesByBz(@RequestParam("mno")Integer mno) {
		List<Comment> comments =  commentService.getCommentsByMno(mno);
		messageAndCommentTxService.delMessage(mno, comments);
		return "Monitor/monitormain";
	}
	/*
	 * 管理留言前
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
	 * 上传照片
	 */
	@RequestMapping("/upload")	
	public String fileUpload(Photo photo,
			 @RequestParam("file") MultipartFile file, HttpServletRequest request) throws IOException {	
		//获得文件类型（可以判断如果不是图片，禁止上传）
		String contentType=file.getContentType();
		//获得文件后缀名称
		String imageName=contentType.substring(contentType.indexOf("/")+1);
		if(file.isEmpty()) {
			request.setAttribute("msg", "上传失败:文件为空");
			return "Monitor/upLoadPictures";
		} else if (imageName.equals("jpeg")||imageName.equals("gif")||imageName.equals("png")||imageName.equals("jpg")){
			long fileSize = file.getSize();    
		    if (fileSize <= 0) {  
		    	request.setAttribute("msg", "上传失败:文件为空");
		    	return "Monitor/upLoadPictures";
		    } else if (fileSize > (500 * 1024)) {  
		    	request.setAttribute("msg", "上传失败:文件大小不能超过500K");
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
            System.out.println("上传的图片宽：" + imgWidth);  
            System.out.println("上传的图片高：" + imgHeight); 
            System.out.println(mydiv);
            if(mydiv > 1.4) {
            	request.setAttribute("msg", "上传的图片宽高大于7/5，请重新上传");
		    	return "Monitor/upLoadPictures"; 
            }	
			photoService.saveImage(photo);	
			return "redirect:/Monitor/monitormain";	
		} else {
			request.setAttribute("msg", "图片格式不符合要求，请重新上传");
			return "Monitor/upLoadPictures";
		}
	}
	
	
	/*
	 * 上传照片前
	 */
	@RequestMapping("/preUpload")
	public String preUpload() {
		return "Monitor/upLoadPictures";
	}
	
	/*
	 * 发布新闻公告
	 */
	@RequestMapping("/newAnnouce")
	public String newAnnouce(Inform inform){
		informService.saveInform(inform);
		return "Monitor/monitormain";
	}
	
	/*
	 * 新闻公告发布前
	 */
	@RequestMapping("/prenewAnnouce")
	public String prenewAnnouce() {
		return "Monitor/newAnnouce";
	}
	
	//注销
	@RequestMapping("/logout/{sno}")
	public String logout(@PathVariable("sno") String sno) {
		System.out.println(sno);
		studentService.logoutBySno(sno);
		return "forward:/preconfirm";
	}
	
	//确认登录
	@RequestMapping("/confirm/{sno}")
	public String confirm(@PathVariable("sno") String sno) {
		studentService.confirmBySno(sno);
		return "forward:/preconfirm";
	}
	
	//转确定注册页面
	@RequestMapping("/preconfirm")
	public String preconfirm(@RequestParam(value = "pn", defaultValue="1") Integer pn,Model model) {
		// 这不是一个分页查询；
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页的大小
		PageHelper.startPage(pn, 9);
		//测试分页“1”要改为”0“
		List<Student> stus = studentService.getStusWhereStatus("0");
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数	
		PageInfo<Student> page = new PageInfo<>(stus, 5);
		model.addAttribute("pageInfo", page);
		
//		request.setAttribute("students", stus);
		return "Monitor/RegisterConform";
	}
	
	//退出登录
	@RequestMapping("/monitorquit")
	public String quit(HttpSession session) {
		session.invalidate();
		return "redirect:/Monitor/monitorLogin";
	}
	
	
	//验证登录
	@RequestMapping("/monitorLogin")
	public String login(Student student,HttpServletRequest request) {
		//表单的账户和密码
		String sno = student.getSno();
		String password = student.getPassword();
		//数据库里的账户
		Student stu = (Student)studentService.getBySno(sno);
		if(stu == null) {
			request.setAttribute("msg", "该账号还未注册，请先注册！");
			request.setAttribute("student", student);
			return "forward:/Monitor/monitorLogin";
		} else {
			if(!stu.getPassword().equals(password)) {
				request.setAttribute("msg", "账号或密码输入不正确");
				request.setAttribute("student", student);
				return "forward:/Monitor/monitorLogin";
			} else if (stu.getStatus().equals("0")){
				request.setAttribute("msg", "你不是管理员：班长，请勿登录←_←");
				request.setAttribute("student", student);
				return "forward:/Monitor/monitorLogin";
			} else if (!stu.getDuty().equals("班长")){
				request.setAttribute("msg", "你不是管理员：班长，请勿登录←_←");
				request.setAttribute("student", student);
				return "forward:/Monitor/monitorLogin";
			} else {
				request.getSession().setAttribute("student", stu);
				return "Monitor/monitormain";
			}
		}
			
	}
}
