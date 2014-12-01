package cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cart.bean.CartDTO;
import category.bean.Category;
import category.service.CategoryService;
import content.bean.ContentDTO;
import content.service.ContentService;

@RequestMapping("/cart")
public class CartController {
	@Autowired
	private CategoryService categoryService;
	private int count;
	@Autowired
	private ContentService contentService;
	
	private List<Category> getMenu(){
		List<Category> list = categoryService.mainCategoryListGet();
		return list;
	}
	
	@RequestMapping("/shoppingBasket")
	public ModelAndView shoppingBasket(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList", getMenu());
		mav.addObject("display", "/cart/shoppingBasket.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/cartInsert")
	public ModelAndView cartInsert(HttpSession session, int contentCode){
		boolean isOverlap=false;
		ContentDTO content=contentService.contentGet(contentCode);
		System.out.println(count);
		CartDTO cartDTO=new CartDTO();
		cartDTO.setCartCode(count);
		cartDTO.setContentImage(content.getContentImage());
		cartDTO.setPrice(content.getPrice());
		cartDTO.setContentCode(contentCode);
		cartDTO.setContentName(content.getContentName());
		if(session.getAttribute("cartList")==null){
			ArrayList<CartDTO> list = new ArrayList<CartDTO>();
			list.add(cartDTO);
			session.setAttribute("cartList", list);
		}else{
			ArrayList<CartDTO> list=(ArrayList)session.getAttribute("cartList");
			for(int i=0; i<list.size();i++){
				if(list.get(i).getContentCode()==contentCode){
					isOverlap=true;
				}
			}
			if(!isOverlap){
				list.add(cartDTO);
			}	
		}		
		count++;
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/cart/cartInsertOK");
		return mav;
	}
	
	@RequestMapping("/deleteCartItem")
	public ModelAndView deleteCartItem(@RequestParam int seq,HttpSession session){
		ArrayList<CartDTO> list= (ArrayList)session.getAttribute("cartList");
		list.remove(seq);
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList", getMenu());
		mav.addObject("display", "/cart/shoppingBasket.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/cartAllDelete")
	public ModelAndView cartAllDelete(HttpSession session){
		session.removeAttribute("cartList");
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList", getMenu());
		mav.addObject("display", "/cart/shoppingBasket.jsp");
		mav.setViewName("/main/index");
		return mav;
	}

}
