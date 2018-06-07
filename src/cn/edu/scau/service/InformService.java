package cn.edu.scau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.scau.bean.Inform;
import cn.edu.scau.dao.InformMapper;

@Service
public class InformService {
	
	@Autowired
	private InformMapper informMapper;
	
	
	public void saveInform(Inform inform) {
		// TODO Auto-generated method stub
		informMapper.saveInform(inform);
	}


	public List<Inform> getAllInfo() {
		// TODO Auto-generated method stub
		return informMapper.getAllInfo();
	}

}
