package cn.edu.scau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.edu.scau.bean.Mc;
import cn.edu.scau.dao.McMapper;

@Service
public class McService {
	
	@Autowired
	private McMapper mcMapper;

	public List<Mc> getAllMcs() {
		// TODO Auto-generated method stub
		return mcMapper.getAllMcs();
	}

	public void deleteByMno(Integer mno) {
		// TODO Auto-generated method stub
		mcMapper.deleteByMno(mno);
	}

	public void saveMc(Mc mc) {
		// TODO Auto-generated method stub
		mcMapper.saveMc(mc);
	}

	public List<Mc> getMcsByMno(Integer mno) {
		// TODO Auto-generated method stub
		return mcMapper.getMcsByMno(mno);
	}

	
}
