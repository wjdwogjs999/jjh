package order.service;

import java.util.List;

import main.bean.IndexTestDTO;
import member.bean.MemberDTO;
import order.bean.OrderDTO;

public interface OrderService {

	List<OrderDTO> myOrderListGet(MemberDTO member);

	void orderInsert(OrderDTO order, MemberDTO user);

	Float[] generationGet(int currentYear);

	List<Long> orderListGetByYear(int year);

	void testSave(IndexTestDTO dto);


}
