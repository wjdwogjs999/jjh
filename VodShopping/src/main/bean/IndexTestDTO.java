package main.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="test")
public class IndexTestDTO {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="test_id")
	private int test_id;
	@Column(name="test_subject")
	private String test_subject;
	@Column(name="test_content")
	private String test_content;
	public int getTest_id() {
		return test_id;
	}
	public void setTest_id(int test_id) {
		this.test_id = test_id;
	}
	public String getTest_subject() {
		return test_subject;
	}
	public void setTest_subject(String test_subject) {
		this.test_subject = test_subject;
	}
	public String getTest_content() {
		return test_content;
	}
	public void setTest_content(String test_content) {
		this.test_content = test_content;
	}
	
	
}
