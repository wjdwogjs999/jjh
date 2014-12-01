package content.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="content")
public class ContentDTO {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="contentCode", nullable=false)
	private int contentCode;
	
	@Column(name="contentName", nullable=false)
	private String contentName;
	
	@Column(name="contentEnglishName", nullable=false)
	private String contentEnglishName;
	
	@Column(name="price", nullable=false)
	private int price;
	
	@Column(name="director", nullable=false)
	private String director;
	
	@Column(name="actors", nullable=false)
	private String actors;
	
	@Column(name="releasedDate", nullable=false)
	private Date releasedDate;
	
	@Column(name="storyLine", nullable=false)
	private String storyLine;
	
	@Column(name="category", nullable=false)
	private String category;
	
	@Column(name="contentImage", nullable=false)
	private String contentImage;
	
	@Column(name="vod", nullable=false)
	private String vod;
	
	@Column(name="buyCount")
	private int buyCount;
	//DB에는 없는 애들
	@Transient
	private int startIndex;
	@Transient
	private int endIndex;
	@Transient
	private String sword;
	@Transient
	private String searchType;
	
	
	public String getSword() {
		return sword;
	}

	public void setSword(String sword) {
		this.sword = sword;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
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

	public ContentDTO(){}

	public int getContentCode() {
		return contentCode;
	}
	public void setContentCode(int contentCode) {
		this.contentCode = contentCode;
	}
	public String getContentName() {
		return contentName;
	}
	public void setContentName(String contentName) {
		this.contentName = contentName;
	}
	public String getContentEnglishName() {
		return contentEnglishName;
	}
	public void setContentEnglishName(String contentEnglishName) {
		this.contentEnglishName = contentEnglishName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActors() {
		return actors;
	}
	public void setActors(String actors) {
		this.actors = actors;
	}
	
	public Date getReleasedDate() {
		return releasedDate;
	}

	public void setReleasedDate(Date releasedDate) {
		this.releasedDate = releasedDate;
	}

	public String getStoryLine() {
		return storyLine;
	}
	public void setStoryLine(String storyLine) {
		this.storyLine = storyLine;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContentImage() {
		return contentImage;
	}
	public void setContentImage(String contentImage) {
		this.contentImage = contentImage;
	}
	public String getVod() {
		return vod;
	}
	public void setVod(String vod) {
		this.vod = vod;
	}

	public int getBuyCount() {
		return buyCount;
	}

	public void setBuyCount(int buyCount) {
		this.buyCount = buyCount;
	}
	
}
