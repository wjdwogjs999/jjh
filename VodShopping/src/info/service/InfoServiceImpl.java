package info.service;

import info.bean.InfoDTO;
import info.dao.infoDAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class InfoServiceImpl implements InfoService {
	@Autowired
	private infoDAO infoDao;
	
	@Override
	@Transactional
	public List<InfoDTO> newInfoListGet() {
		return infoDao.getNewInfo();
	}

	@Override
	@Transactional
	public void infoInsert(InfoDTO infoDTO) throws HibernateException{
		infoDao.infoWrite(infoDTO);
	}

	@Override
	@Transactional
	public InfoDTO infoGet(InfoDTO info) {
		return infoDao.getInfo(info);
	}

	@Override
	@Transactional
	public void infoUpdate(InfoDTO info) throws HibernateException{
		infoDao.infoUpdate(info);
	}

	@Override
	@Transactional
	public void infoDelete(InfoDTO info) throws HibernateException{
		infoDao.infoDelete(info);
	}

	@Override
	@Transactional
	public List<InfoDTO> infoListGet(InfoDTO info) {
		return infoDao.getInfoList(info);
	}

	@Override
	@Transactional
	public int totGet() {
		return infoDao.getTot();
	}

	@Override
	@Transactional
	public void hitUpdate(InfoDTO info) throws HibernateException{
		infoDao.updateHit(info);
	}

}
