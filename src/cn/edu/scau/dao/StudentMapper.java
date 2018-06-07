package cn.edu.scau.dao;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import cn.edu.scau.bean.Student;

public interface StudentMapper {
	
	public Student getStuBySno(String sno);

	public Student getStuByDuty(String duty);

	public void regist(Student student);

	public List<Student> getStusWhereStatus(String status);

	public void confirmBySno(String sno);

	public void logoutBySno(String sno);

	public List<Student> getStusWhereStatusAndSno(@Param("status")String status, @Param("sno") String sno);

	public void updateBySGD(Student stu);

	public void changePassword(@Param("sno") String sno, @Param("newPwd") String newPwd);

	public List<Student> advanceQuery(Student student);
	
}
