package cn.edu.scau.bean;

public class Teacher {
	private String tno;
	private String tname;
	private String password;
	
	public Teacher() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Teacher(String tno, String tname, String password) {
		super();
		this.tno = tno;
		this.tname = tname;
		this.password = password;
	}
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Teacher [tno=" + tno + ", tname=" + tname + ", password=" + password + "]";
	}
	
	
	
	
}
