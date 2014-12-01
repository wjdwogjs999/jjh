package content.dao;

import java.util.List;

import org.hibernate.HibernateException;

import content.bean.ContentDTO;

public interface ContentDAO {
	//save
	void contentInsert(ContentDTO contentDto) throws HibernateException;
	//get
	ContentDTO getContent(int contentCode);
	//update
	void update(ContentDTO content) throws HibernateException;
	//delete
	void deleteContent(ContentDTO content) throws HibernateException;
	//list
	List<ContentDTO> contentListAllGet();
	List<ContentDTO> bestContentGet();
	List<ContentDTO> getContentList(ContentDTO content);
	List<ContentDTO> contentListGet(ContentDTO content);

	int getContentCountGet(ContentDTO content);
}
