package cn.edu.scau.dao;

import java.util.List;

import cn.edu.scau.bean.Photo;

public interface PhotoMapper {

	public void saveImage(Photo photo);

	public List<Photo> getImages();

	public Photo getImageByPno(String pno);

}
