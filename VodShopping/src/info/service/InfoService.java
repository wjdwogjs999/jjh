package info.service;

import info.bean.InfoDTO;

import java.util.List;

public interface InfoService {

	List<InfoDTO> newInfoListGet();

	void infoInsert(InfoDTO infoDTO);

	InfoDTO infoGet(InfoDTO info);

	void infoUpdate(InfoDTO info);

	void infoDelete(InfoDTO info);

	List<InfoDTO> infoListGet(InfoDTO info);

	int totGet();

	void hitUpdate(InfoDTO info);
}
