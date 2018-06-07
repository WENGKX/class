package cn.edu.scau.dao;

import java.util.List;


import cn.edu.scau.bean.Mc;

public interface McMapper {

	public List<Mc> getAllMcs();

	public void deleteByMno(Integer mno);

	public void saveMc(Mc mc);

	public List<Mc> getMcsByMno(Integer mno);

	

}
