package content.dao;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Service;

import content.bean.ContentDTO;

@Service
public class ContentDAOImpl extends HibernateDaoSupport implements ContentDAO {	
	@Override
	public void contentInsert(ContentDTO contentDto) throws HibernateException{
		getHibernateTemplate().save(contentDto);
	}

	@Override
	public ContentDTO getContent(int contentCode) {
		return getHibernateTemplate().get(ContentDTO.class, contentCode);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ContentDTO> contentListAllGet(ContentDTO content) {
		List<ContentDTO> list = null;
		if(content.getSearchType()!=null){
			if(content.getsSortDir().equals("asc")){
				list = (List<ContentDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(ContentDTO.class)
						.add(Restrictions.or(Restrictions.like("contentName", "%"+content.getSword()+"%"),
											Restrictions.like("director", "%"+content.getSword()+"%")))
						.addOrder(Order.asc(content.getiSortCol())),content.getStartIndex(),content.getEndIndex());
			}else{
				list = (List<ContentDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(ContentDTO.class)
						.add(Restrictions.or(Restrictions.like("contentName", "%"+content.getSword()+"%"),
											Restrictions.like("director", "%"+content.getSword()+"%")))
						.addOrder(Order.desc(content.getiSortCol())),content.getStartIndex(),content.getEndIndex());
			}
		}else{
			if(content.getsSortDir().equals("asc")){
				list = (List<ContentDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(ContentDTO.class).addOrder(Order.asc(content.getiSortCol())),content.getStartIndex(),content.getEndIndex());
			}else{
				list = (List<ContentDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(ContentDTO.class).addOrder(Order.desc(content.getiSortCol())),content.getStartIndex(),content.getEndIndex());
			}
		}
		return list;
	}

	@Override
	public void update(ContentDTO content) throws HibernateException{
		getHibernateTemplate().update(content);		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ContentDTO> bestContentGet() {
		return (List<ContentDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(ContentDTO.class).addOrder(Order.desc("buyCount")), 0, 4);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ContentDTO> getContentList(ContentDTO content) {
		List<ContentDTO> list=null;
		if(content.getSearchType().equals("subject")){
			if(content.getEndIndex()!=0)
				list=(List<ContentDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(ContentDTO.class).add(Restrictions.like("contentName", "%"+content.getSword()+"%")), 0, 10);
			else
				list = (List<ContentDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(ContentDTO.class).add(Restrictions.like("contentName", "%"+content.getSword()+"%")));
		}else if(content.getSearchType().equals("all")){
			Criterion contentName = Restrictions.like("contentName", "%"+content.getSword()+"%");
			Criterion storyLine = Restrictions.like("storyLine", "%"+content.getSword()+"%");
			Criterion actors = Restrictions.like("actors", "%"+content.getSword()+"%");
			list = (List<ContentDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(ContentDTO.class).add(Restrictions.or(contentName, storyLine, actors)));
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ContentDTO> contentListGet(ContentDTO content) {
		List<ContentDTO> list=null;
		if((content.getCategory()==null)){
			list=(List<ContentDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(ContentDTO.class), content.getStartIndex(), content.getEndIndex());
		}else{
			if(content.getCategory().split("-").length==1){
				list = (List<ContentDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(ContentDTO.class).add(Restrictions.like("category", content.getCategory()+"-%")), content.getStartIndex(), content.getEndIndex());
			}else{
				list = (List<ContentDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(ContentDTO.class).add(Restrictions.eq("category", content.getCategory())), content.getStartIndex(), content.getEndIndex());
			}
		}
		return list;
	}

	@Override
	public int getContentCountGet(ContentDTO content) {
		Criteria criteria;
		if((content.getCategory()==null)){
			if(content.getSearchType()!=null){
				criteria = getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(ContentDTO.class)
						.add(Restrictions.or(Restrictions.like("contentName", "%"+content.getSword()+"%"),
								Restrictions.like("director",  "%"+content.getSword()+"%")));
			}else{
				criteria = getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(ContentDTO.class);
			}
		}else{
			if(content.getCategory().split("-").length==1){
				criteria = getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(ContentDTO.class).add(Restrictions.like("category", content.getCategory()+"-%"));
			}else{
				criteria = getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(ContentDTO.class).add(Restrictions.eq("category", content.getCategory()));
			}
		}
		criteria.setProjection(Projections.rowCount());
		int contentCount =((Long)criteria.uniqueResult()).intValue();
		return contentCount;
	}

	

	@Override
	public void deleteContent(ContentDTO content) {
		getHibernateTemplate().delete(content);		
	}

}
