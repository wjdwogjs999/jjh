package cart.bean;

import java.io.Serializable;

public class CartDTO implements Serializable{
	private int cartCode;
	private String contentImage;
	private String contentName;
	private int ContentCode;
	private int price;
	public int getCartCode() {
		return cartCode;
	}
	public void setCartCode(int cartCode) {
		this.cartCode = cartCode;
	}
	public String getContentImage() {
		return contentImage;
	}
	public void setContentImage(String contentImage) {
		this.contentImage = contentImage;
	}
	public String getContentName() {
		return contentName;
	}
	public void setContentName(String contentName) {
		this.contentName = contentName;
	}
	public int getContentCode() {
		return ContentCode;
	}
	public void setContentCode(int contentCode) {
		ContentCode = contentCode;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
		
}
