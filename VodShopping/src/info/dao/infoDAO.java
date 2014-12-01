package info.dao;

import java.util.List;

import org.hibernate.HibernateException;

import info.bean.InfoDTO;

public interface infoDAO {
	//save
	void infoWrite(InfoDTO infoDTO) throws HibernateException;
	//get
	InfoDTO getInfo(InfoDTO info);
	//update
	void infoUpdate(InfoDTO info) throws HibernateException;
	void updateHit(InfoDTO info) throws HibernateException;
	//delete
	void infoDelete(InfoDTO info) throws HibernateException;
	//list
	List<InfoDTO> getInfoList(InfoDTO info);
	List<InfoDTO> getNewInfo();
	
	int getTot();
}
