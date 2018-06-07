package cn.edu.scau.bean;

public class Inform {
	//ino idate imessage
	private Integer ino;
	private String idate;
	private String imessage;
	public Inform() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Inform(Integer ino, String idate, String imessage) {
		super();
		this.ino = ino;
		this.idate = idate;
		this.imessage = imessage;
	}
	
	public Integer getIno() {
		return ino;
	}
	public void setIno(Integer ino) {
		this.ino = ino;
	}
	public String getIdate() {
		return idate;
	}
	public void setIdate(String idate) {
		this.idate = idate;
	}
	public String getImessage() {
		return imessage;
	}
	public void setImessage(String imessage) {
		this.imessage = imessage;
	}
	@Override
	public String toString() {
		return "Inform [ino=" + ino + ", idate=" + idate + ", imessage=" + imessage + "]";
	}
	
	
}
