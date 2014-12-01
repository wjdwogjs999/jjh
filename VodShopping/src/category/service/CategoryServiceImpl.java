package category.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import category.bean.Category;
import category.dao.CategoryDAO;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDAO categoryDao;
	
	@Override
	@Transactional
	public List<Category> mainCategoryListGet() {
		return categoryDao.getCategory1List();
	}

	@Override
	@Transactional
	public void categoryInsert(Category category) throws HibernateException{
		categoryDao.categoryAdd(category);		
	}

	@Override
	@Transactional
	public void categoryUpdate(int category_seq, String category_name) throws HibernateException{
		categoryDao.categoryUpdate(category_seq, category_name);
	}

	@Override
	@Transactional
	public void categoryDelete(int category_seq) throws HibernateException{
		categoryDao.categoryDelete(category_seq);		
	}

	@Override
	@Transactional
	public void sonDelete(int category_seq) throws HibernateException{
		categoryDao.sonDelete(category_seq);		
	}

	@Override
	@Transactional
	public Category CategoryGet(int category_seq) {
		return categoryDao.getCategory(category_seq);
	}

	@Override
	@Transactional
	public void categoryStateUpdate(int pseq, int i) throws HibernateException{
		categoryDao.categoryUpdate(pseq, i);		
	}

	@Override
	@Transactional
	public List<Category> subCategoryListGet(int pseq) {
		return categoryDao.getCategorySubList(pseq);
	}

}
