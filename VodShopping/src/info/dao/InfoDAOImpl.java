package info.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Service;

import info.bean.InfoDTO;

@Service
public class InfoDAOImpl extends HibernateDaoSupport implements infoDAO {
	
	@Override
	public void infoWrite(InfoDTO infoDTO) throws HibernateException{
		getHibernateTemplate().save(infoDTO);
	}

	@Override
	public int getTot() {
		Criteria criteria=getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(InfoDTO.class);
	    // COUNT() 쿼리로 해주는 메소드
		criteria.setProjection(Projections.rowCount());
		// 결과값을 INT형 변환한다.
	    return ((Long)criteria.uniqueResult()).intValue();	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InfoDTO> getInfoList(InfoDTO info) {
		return (List<InfoDTO>) getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(InfoDTO.class).addOrder(Order.desc("infoCode")),info.getStartIndex(),info.getEndIndex());	
	}

	@Override
	public InfoDTO getInfo(InfoDTO info) {
		return getHibernateTemplate().get(InfoDTO.class, info.getInfoCode());		
	}

	@Override
	public void updateHit(InfoDTO info) throws HibernateException{
         getHibernateTemplate().update(info);    
	}

	@Override
	public void infoUpdate(InfoDTO info) throws HibernateException{
		InfoDTO oldInfo = getHibernateTemplate().get(InfoDTO.class,info.getInfoCode());
		oldInfo.setInfoSubject(info.getInfoSubject());
		oldInfo.setInfoContent(info.getInfoContent());
	}

	@Override
	public void infoDelete(InfoDTO info) throws HibernateException {
		getHibernateTemplate().delete(info);	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InfoDTO> getNewInfo() {
		return (List<InfoDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(InfoDTO.class).addOrder(Order.desc("logtime")).addOrder(Order.desc("infoCode")), 0, 5);
	}

}
