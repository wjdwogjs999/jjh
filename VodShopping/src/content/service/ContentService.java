package content.service;

import java.util.List;

import content.bean.ContentDTO;

public interface ContentService {

	void contentInsert(ContentDTO contentDto);

	ContentDTO contentGet(int contentCode);

	void contentDelete(ContentDTO content);

	void contentUpdate(ContentDTO content);

	List<ContentDTO> contentListGet(ContentDTO content);

	int contentCountGet(ContentDTO content);

	List<ContentDTO> bestContentGet();

	List<ContentDTO> contentListAllGet(ContentDTO content);

	List<ContentDTO> contentSearchListGet(ContentDTO content);

}
