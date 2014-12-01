package member.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="zipcode")
public class ZipcodeDTO {
	@Column(name="zipcode")
	private String zipcode;
	@Column(name="sido")
	private String sido;
	@Column(name="gugun")
	private String gugun;
	@Column(name="dong")
	private String dong;
	@Column(name="ri")
	private String ri;
	@Column(name="bunji")
	private String bunji;
	@Id
	@Column(name="seq")
	private int seq;
	public ZipcodeDTO(){}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipdoe) {
		this.zipcode = zipdoe;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getRi() {
		return ri;
	}
	public void setRi(String ri) {
		this.ri = ri;
	}
	public String getBunji() {
		return bunji;
	}
	public void setBunji(String bunji) {
		this.bunji = bunji;
	}
	
	
}
