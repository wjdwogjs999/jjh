package member.bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;






import order.bean.OrderDTO;
import order.bean.OrderItemDTO;

import org.hibernate.annotations.Cascade;


@Entity
@Table(name="users")
public class MemberDTO{
	@Id
	@Column(name="id",nullable=false)
	private String id;
	
	@Column(name="pwd",nullable=false)
	private	String pwd;
	
	@Column(name="name",nullable=false)
	private String name;
	
	@Column(name="gender",nullable=false)
	private int gender;
	
	@Column(name="b_year",nullable=false)
	private int b_year;
	
	@Column(name="b_month",nullable=false)
	private int b_month;
	
	@Column(name="b_day",nullable=false)
	private int b_day;
	
	@Column(name="email",nullable=false)
	private String email;
	
	@Column(name="zipcode1")
	private String zipcode1;
	
	@Column(name="zipcode2")
	private String zipcode2;
	
	@Column(name="addr1")
	private String addr1;
	
	@Column(name="addr2")
	private String addr2;
	
	@Column(name="phone1")
	private String phone1;
	
	@Column(name="phone2")
	private String phone2;
	
	@Column(name="phone3")
	private String phone3;
	
	//∆‰¿Ã¬°
	@Transient
	private int startIndex;
	@Transient
	private int endIndex;
	
	@OneToMany(fetch=FetchType.LAZY)
	@Cascade({org.hibernate.annotations.CascadeType.ALL})
	@JoinTable(name="users_ordertable",joinColumns=@JoinColumn(name="id"),
				inverseJoinColumns=@JoinColumn(name="orderCode")
	)
	private List<OrderDTO> order=new ArrayList<OrderDTO>();
	
	@OneToMany(fetch=FetchType.LAZY)
	@Cascade({org.hibernate.annotations.CascadeType.ALL})
	@JoinTable(name="users_orderItem",joinColumns=@JoinColumn(name="id")
	)
	private List<OrderItemDTO> orderItem=new ArrayList<OrderItemDTO>();
	
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getB_year() {
		return b_year;
	}
	public void setB_year(int b_year) {
		this.b_year = b_year;
	}
	public int getB_month() {
		return b_month;
	}
	public void setB_month(int b_month) {
		this.b_month = b_month;
	}
	public int getB_day() {
		return b_day;
	}
	public void setB_day(int b_day) {
		this.b_day = b_day;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode1() {
		return zipcode1;
	}
	public void setZipcode1(String zipcode1) {
		this.zipcode1 = zipcode1;
	}
	public String getZipcode2() {
		return zipcode2;
	}
	public void setZipcode2(String zipcode2) {
		this.zipcode2 = zipcode2;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public List<OrderDTO> getOrder() {
		return order;
	}
	public void setOrder(List<OrderDTO> order) {
		this.order = order;
	}	
	public OrderDTO addOrder(OrderDTO order){
		this.order.add(order);
		order.setMember(this);
		return order;
	}
	public OrderDTO removeOrder(OrderDTO order){
		this.order.remove(order);
		order.setMember(null);
		return order;
	}
	public List<OrderItemDTO> getOrderItem() {
		return orderItem;
	}
	public void setOrderItem(List<OrderItemDTO> orderItem) {
		this.orderItem = orderItem;
	}
	
	
}