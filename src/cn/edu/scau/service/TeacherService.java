package cn.edu.scau.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.scau.bean.Teacher;
import cn.edu.scau.dao.TeacherMapper;

@Service
public class TeacherService {
	@Autowired
	private TeacherMapper teacherMapper;

	public Teacher getTeaByTno(String tno) {
		// TODO Auto-generated method stub
		return teacherMapper.getTeaByTno(tno);
	}
	
	
}
