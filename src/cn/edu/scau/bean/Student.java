package cn.edu.scau.bean;

public class Student {
	private String sno;
	private String sname;
	private String grade;
	private String password;
	private String duty;
	private String status;
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(String sno, String sname, String grade, String password, String duty, String status) {
		super();
		this.sno = sno;
		this.sname = sname;
		this.grade = grade;
		this.password = password;
		this.duty = duty;
		this.status = status;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Student [sno=" + sno + ", sname=" + sname + ", grade=" + grade + ", password=" + password + ", duty="
				+ duty + ", status=" + status + "]";
	}
	
	
}
