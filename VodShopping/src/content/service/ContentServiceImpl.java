package content.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import content.bean.ContentDTO;
import content.dao.ContentDAO;

@Service
public class ContentServiceImpl implements ContentService {
	@Autowired
	private ContentDAO contentDao;
	@Override
	@Transactional
	public void contentInsert(ContentDTO contentDto) {
		contentDao.contentInsert(contentDto);
	}

	@Override
	@Transactional
	public ContentDTO contentGet(int contentCode) {
		return contentDao.getContent(contentCode);
	}

	@Override
	@Transactional
	public void contentDelete(ContentDTO content) {
		contentDao.deleteContent(content);		
	}

	@Override
	@Transactional
	public void contentUpdate(ContentDTO content) {
		contentDao.update(content);
	}

	@Override
	@Transactional
	public List<ContentDTO> contentListGet(ContentDTO content) {
		return contentDao.contentListGet(content);
	}

	@Override
	@Transactional
	public int contentCountGet(ContentDTO content) {
		return contentDao.getContentCountGet(content);
	}

	@Override
	@Transactional
	public List<ContentDTO> bestContentGet() {
		return contentDao.bestContentGet();
	}

	@Override
	@Transactional
	public List<ContentDTO> contentListAllGet(ContentDTO content) {
		return contentDao.contentListAllGet(content);
	}

	@Override
	@Transactional
	public List<ContentDTO> contentSearchListGet(ContentDTO content) {
		return contentDao.getContentList(content);
	}

}
