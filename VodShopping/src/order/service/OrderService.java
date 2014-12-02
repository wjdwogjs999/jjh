package order.service;

import java.util.List;

import content.bean.ContentDTO;
import main.bean.IndexTestDTO;
import member.bean.MemberDTO;
import order.bean.OrderDTO;
import order.bean.OrderItemDTO;

public interface OrderService {

	List<OrderDTO> myOrderListGet(MemberDTO member);

	void orderInsert(OrderDTO order, MemberDTO user, String[] orderItem);

	Float[] generationGet(int currentYear);

	List<Long> orderListGetByYear(int year);

	List<OrderItemDTO> myOrderItemListGet(MemberDTO member);

	void orderItemUpdate(OrderItemDTO orderItem);


}
