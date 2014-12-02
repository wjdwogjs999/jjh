package order.dao;


import java.util.List;

import main.bean.IndexTestDTO;
import member.bean.MemberDTO;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Service;

import content.bean.ContentDTO;
import order.bean.OrderDTO;
import order.bean.OrderItemDTO;

@Service
public class OrderDAOImpl extends HibernateDaoSupport implements OrderDAO {
	@Override
	public void orderInsert(OrderDTO order) throws HibernateException{
		getHibernateTemplate().save(order);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<OrderDTO> myOrderListGet(MemberDTO member) {
		return (List<OrderDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(OrderDTO.class).add(Restrictions.eq("member", member)));
	}

	@Override
	public Integer generationCountGet(int i, int j) {
		System.out.println("i = "+i+", j = "+j);
		Criteria orderCriteria = getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(OrderDTO.class);
		Criteria memberCriteria = orderCriteria.createCriteria("member");
		memberCriteria.add(Restrictions.and(Restrictions.ge("b_year",i),Restrictions.lt("b_year", j))).setProjection(Projections.rowCount());
		return ((Long)memberCriteria.uniqueResult()).intValue();
	}

	@Override
	public int orderTotGet() {
		Criteria orderCriteria = getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(OrderDTO.class).setProjection(Projections.rowCount());
		return ((Long)orderCriteria.uniqueResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Long> orderListGetByYear(int year) {
		Query q = getHibernateTemplate().getSessionFactory().openSession().createQuery(
				"SELECT sum(totalMoney) as sum "
				+ "FROM OrderDTO "
				+ "WHERE YEAR(orderDate)=? "
				+ "GROUP BY Month(orderDate)");
		q.setInteger(0, year);
		return q.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderItemDTO> myOrderItemListGet(MemberDTO member) {
		return (List<OrderItemDTO>)getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(OrderItemDTO.class).add(Restrictions.eq("member", member)));
	}

	@Override
	public void orderItemInsert(OrderItemDTO item) {
		getHibernateTemplate().saveOrUpdate(item);
	}
	
	@Override
	public void orderItemUpdate(OrderItemDTO item) {
		getHibernateTemplate().update(item);
	}


}
