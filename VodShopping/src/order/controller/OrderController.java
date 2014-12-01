package order.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import member.bean.MemberDTO;
import order.bean.OrderDTO;
import order.service.OrderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import category.bean.Category;
import category.service.CategoryService;
import content.bean.ContentDTO;
import content.service.ContentService;

@RequestMapping("/order")
public class OrderController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ContentService contentService;
	@Autowired
	private OrderService orderService;
	
	private List<Category> getMenu(){
		List<Category> list = categoryService.mainCategoryListGet();
		return list;
	}
	
	@RequestMapping("/orderForm")
	public ModelAndView orderForm(@RequestParam int contentCode){
		ContentDTO content = contentService.contentGet(contentCode);
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList", getMenu());
		mav.addObject("display", "/order/orderForm.jsp");
		mav.addObject("content", content);
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/orderSheet")
	public ModelAndView orderSheet(HttpSession session, int totalMoney){
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList", getMenu());
		mav.addObject("totalMoney", totalMoney);
		mav.addObject("display", "/order/orderSheet.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/order")
	public ModelAndView order(@RequestParam String orderItems, @RequestParam int totalMoney, HttpSession session, int itemCount){
		OrderDTO order = new OrderDTO();
		String orderItemsName="";
		if(itemCount==2){
			String[] items = orderItems.split("-");
			int contentCode=Integer.parseInt(items[0]);
			orderItemsName=contentService.contentGet(contentCode).getContentName()+"�� "+(items.length-1)+"��";
		}else if(itemCount==1){
			int contentCode=Integer.parseInt(orderItems);
			orderItemsName = contentService.contentGet(contentCode).getContentName();
		}
		order.setOrderItems(orderItems);
		order.setOrderItemsName(orderItemsName);
		order.setTotalMoney(totalMoney);	
		ModelAndView mav = new ModelAndView();
		mav.addObject("order", order);
		mav.setViewName("/pay_sample/pay");
		return mav;
	}
	
	@RequestMapping("/orderSuccess")
	public ModelAndView orderSuccess(HttpSession session, String Pay_Type, int good_mny, String orderItems, String good_name){
		//�ֹ��Ǿ����� ��ٱ��� ����
		session.removeAttribute("cartList");
		MemberDTO user = (MemberDTO)session.getAttribute("user");
		OrderDTO order = new OrderDTO();
		//ordertable�� �ֱ�
		order.setOrderItems(orderItems);
		order.setOrderItemsName(good_name);
		order.setTotalMoney(good_mny);
		order.setPayment(Pay_Type);
		order.setOrderDate(new Date());
		orderService.orderInsert(order,user);
		//content�� buyCount 1����!!
		String[] arr = order.getOrderItems().split("-");
		if(arr.length!=1){
			for(int j=0;j<arr.length;j++){
				ContentDTO content=contentService.contentGet(Integer.parseInt(arr[j]));
				content.setBuyCount(content.getBuyCount()+1);
				contentService.contentUpdate(content);
			}
		}else if(arr.length==1){
			ContentDTO content=contentService.contentGet(Integer.parseInt(arr[0]));
			content.setBuyCount(content.getBuyCount()+1);
			contentService.contentUpdate(content);
		}
		
		session.removeAttribute("cart");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/order/allClose");
		return mav;
	}
	
	@RequestMapping("/orderOk")
	public ModelAndView orderOk(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList", getMenu());
		mav.addObject("display", "/order/orderOk.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/myOrderList")
	public ModelAndView myOrderList(HttpSession session){
		MemberDTO member = (MemberDTO)session.getAttribute("user");
		List<OrderDTO> orderList = orderService.myOrderListGet(member);
		ModelAndView mav = new ModelAndView();
		mav.addObject("orderList", orderList);
		mav.addObject("categoryList", getMenu());
		mav.addObject("display", "/order/myOrderList.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
}
