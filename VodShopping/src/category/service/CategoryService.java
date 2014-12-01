package category.service;

import java.util.List;

import category.bean.Category;

public interface CategoryService {

	List<Category> mainCategoryListGet();

	void categoryInsert(Category category);

	void categoryUpdate(int category_seq, String category_name);

	void categoryDelete(int category_seq);

	void sonDelete(int category_seq);

	Category CategoryGet(int category_seq);

	void categoryStateUpdate(int pseq, int i);

	List<Category> subCategoryListGet(int pseq);

}
