package info.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="info")
public class InfoDTO {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="infoCode", nullable=false)
	private int infoCode;
	
	@Column(name="infoSubject", nullable=false)
	private String infoSubject;
	
	@Column(name="infoContent", nullable=false)
	private String infoContent;
	
	@Column(name="logtime")
	private Date logtime;
	
	@Column(name="hit")
	private int hit;
	@Transient
	private int startIndex;
	@Transient
	private int endIndex;
	
	public InfoDTO(){
		this.logtime=new Date();
	}
	
	public int getInfoCode() {
		return infoCode;
	}
	public void setInfoCode(int infoCode) {
		this.infoCode = infoCode;
	}
	public String getInfoSubject() {
		return infoSubject;
	}
	public void setInfoSubject(String infoSubject) {
		this.infoSubject = infoSubject;
	}
	public String getInfoContent() {
		return infoContent;
	}
	public void setInfoContent(String infoContent) {
		this.infoContent = infoContent;
	}
	
	public Date getLogtime() {
		return logtime;
	}
	public void setLogtime(Date logtime) {
		this.logtime = logtime;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	
	
}
