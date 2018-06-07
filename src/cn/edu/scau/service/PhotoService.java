package cn.edu.scau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.scau.bean.Photo;
import cn.edu.scau.dao.PhotoMapper;

@Service
public class PhotoService {
	
	@Autowired
	private PhotoMapper photoMapper;
	
	public void saveImage(Photo photo) {
		photoMapper.saveImage(photo);
	}

	public List<Photo> getImages() {
		// TODO Auto-generated method stub
		return photoMapper.getImages();
	}

	public Photo getImageByPno(String pno) {
		// TODO Auto-generated method stub
		return photoMapper.getImageByPno(pno);
	}
}
