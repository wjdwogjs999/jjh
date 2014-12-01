package category.dao;

import java.util.List;

import org.hibernate.HibernateException;

import category.bean.Category;

public interface CategoryDAO {
	//save
	void categoryAdd(Category category) throws HibernateException;
	//get
	Category getCategory(int seq);
	//update
	void categoryUpdate(int category_seq, String category_name) throws HibernateException;
	void categoryUpdate(int pseq, int son) throws HibernateException;
	//delete
	void categoryDelete(int seq) throws HibernateException;
	//list
	List<Category> getCategory1List();
	List<Category> getCategorySubList(int pseq);
	
	void sonDelete(int pseq) throws HibernateException;
}
