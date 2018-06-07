package cn.edu.scau.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.scau.bean.Student;
import cn.edu.scau.dao.StudentMapper;

@Service
public class StudentService {
	
	@Autowired
	private StudentMapper studentMapper;
	
	public Student getBySno(String sno) {
		return studentMapper.getStuBySno(sno);
	}

	public Student getByDuty(String duty) {
		// TODO Auto-generated method stub
		return studentMapper.getStuByDuty(duty);
	}

	public void regist(Student student) {
		// TODO Auto-generated method stub
		studentMapper.regist(student);
	}

	public List<Student> getStusWhereStatus(String status) {
		// TODO Auto-generated method stub
		return studentMapper.getStusWhereStatus(status);
	}

	public void confirmBySno(String sno) {
		// TODO Auto-generated method stub
		studentMapper.confirmBySno(sno);
	}

	public void logoutBySno(String sno) {
		// TODO Auto-generated method stub
		studentMapper.logoutBySno(sno);
	}

	public List<Student> getStusWhereStatusAndSno(String status, String sno) {
		// TODO Auto-generated method stub
		return studentMapper.getStusWhereStatusAndSno(status,sno);
	}

	public void updateBySGD(Student stu) {
		// TODO Auto-generated method stub
		studentMapper.updateBySGD(stu);
	}

	public void changePassword(String sno, String newPwd) {
		// TODO Auto-generated method stub
		studentMapper.changePassword(sno,newPwd);
	}

	public List<Student> advanceQuery(Student student) {
		// TODO Auto-generated method stub
		return studentMapper.advanceQuery(student);
	}
}
