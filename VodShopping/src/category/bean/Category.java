package category.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="category")
public class Category {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="category_seq", nullable=false)
	private int category_seq;
	
	@Column(name="category_name", nullable=false)
	private String category_name;
	
	@Column(name="category_group")
	private int category_group;
	
	@Column(name="category_level")
	private int category_level;
	
	@Column(name="category_son")
	private int category_son;
	
	public int getCategory_seq() {
		return category_seq;
	}
	public void setCategory_seq(int categoy_seq) {
		this.category_seq = categoy_seq;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getCategory_group() {
		return category_group;
	}
	public void setCategory_group(int category_group) {
		this.category_group = category_group;
	}
	public int getCategory_son() {
		return category_son;
	}
	public void setCategory_son(int category_son) {
		this.category_son = category_son;
	}
	public int getCategory_level() {
		return category_level;
	}
	public void setCategory_level(int category_level) {
		this.category_level = category_level;
	}
	
	
}
