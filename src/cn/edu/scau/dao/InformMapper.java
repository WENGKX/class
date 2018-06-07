package cn.edu.scau.dao;

import java.util.List;

import cn.edu.scau.bean.Inform;

public interface InformMapper {

	public void saveInform(Inform inform);

	public List<Inform> getAllInfo();
	
}
