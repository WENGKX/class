package cn.edu.scau.bean;

public class Photo {
	//pno	 pdate  pdescribe  image
	private Integer pno;
	private String pdate;
	private String pdescribe;
	private String image;
	
	public Photo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Photo(Integer pno, String pdate, String pdescribe, String image) {
		super();
		this.pno = pno;
		this.pdate = pdate;
		this.pdescribe = pdescribe;
		this.image = image;
	}
	public Integer getPno() {
		return pno;
	}
	public void setPno(Integer pno) {
		this.pno = pno;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getPdescribe() {
		return pdescribe;
	}
	public void setPdescribe(String pdescribe) {
		this.pdescribe = pdescribe;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "Photo [pno=" + pno + ", pdate=" + pdate + ", pdescribe=" + pdescribe + ", image=" + image + "]";
	}
	
	
	
	
}
