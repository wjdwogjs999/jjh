package category.dao;


import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.QueryException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import category.bean.Category;

@Service
public class CategoryDAOImpl implements CategoryDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void categoryAdd(Category category) throws HibernateException{
		sessionFactory.getCurrentSession().save(category);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getCategory1List() {
		Session session = sessionFactory.getCurrentSession();
		List<Category> list =session.createCriteria(Category.class).add(Restrictions.eq("category_level", 0)).addOrder(Order.asc("category_seq")).list();
		return list;
	}

	@Override
	public void categoryUpdate(int category_seq, String category_name) throws QueryException{
		Session session = sessionFactory.getCurrentSession();
		String sql="UPDATE Category category "
				+ "SET category.category_name = :category_name "
				+ "WHERE category.category_seq = :category_seq ";
		Query query = session.createQuery(sql);
		query.setParameter("category_name", category_name);
		query.setParameter("category_seq", category_seq);
		query.executeUpdate();
	}

	@Override
	public void categoryDelete(int seq) throws QueryException{
		Session session = sessionFactory.getCurrentSession();
		String sql="DELETE Category category "
				+ "WHERE category.category_seq = :category_seq ";
		Query query = session.createQuery(sql);
		query.setParameter("category_seq", seq);
		query.executeUpdate();
	}

	@Override
	public Category getCategory(int seq) {
		Session session = sessionFactory.getCurrentSession();
		Category category=(Category) session.get(Category.class, seq);
		return category;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getCategorySubList(int pseq) {
		Session session = sessionFactory.getCurrentSession();
		List<Category> list=session.createCriteria(Category.class).add(Restrictions.eq("category_group", pseq)).list();
		return list;
	}

	@Override
	public void categoryUpdate(int pseq, int son) throws QueryException{
		Session session = sessionFactory.getCurrentSession();
		String sql="UPDATE Category category "
				+ "SET category.category_son = :category_son "
				+ "WHERE category.category_seq = :category_seq ";
		Query query = session.createQuery(sql);
		query.setParameter("category_son", son);
		query.setParameter("category_seq", pseq);
		query.executeUpdate();
	}

	@Override
	public void sonDelete(int pseq) throws QueryException{
		Session session = sessionFactory.getCurrentSession();
		String sql="DELETE Category category "
				+ "WHERE category.category_group = :category_group";
		Query query = session.createQuery(sql);
		query.setParameter("category_group", pseq);
		query.executeUpdate();
	}

	
	
}
