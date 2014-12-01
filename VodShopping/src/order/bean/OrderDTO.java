package order.bean;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import member.bean.MemberDTO;


@Entity
@Table(name="ordertable")
public class OrderDTO {
	@Id//기본키
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="orderCode")
	private int orderCode;
	@Column(name="orderItems", nullable=false)
	private String orderItems;
	@Column(name="orderItemsName")
	private String orderItemsName;
	//외래키
	@ManyToOne(fetch=FetchType.LAZY)
	private MemberDTO member;
	
	@Column(name="totalMoney")
	private int totalMoney;
	@Column(name="payment")
	private String payment;
	@Column(name="orderDate")
	private Date orderDate;
	
	public int getOrderCode() {
		return orderCode;
	}
	
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	public String getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(String orderItems) {
		this.orderItems = orderItems;
	}

	public MemberDTO getMember() {
		return member;
	}

	public void setMember(MemberDTO member) {
		this.member = member;
	}

	public int getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderItemsName() {
		return orderItemsName;
	}

	public void setOrderItemsName(String orderItemsName) {
		this.orderItemsName = orderItemsName;
	}	
	
}