package order.dao;

import java.util.List;

import main.bean.IndexTestDTO;
import member.bean.MemberDTO;

import org.hibernate.HibernateException;

import content.bean.ContentDTO;
import order.bean.OrderDTO;
import order.bean.OrderItemDTO;

public interface OrderDAO {

	void orderInsert(OrderDTO order) throws HibernateException;

	List<OrderDTO> myOrderListGet(MemberDTO member);

	Integer generationCountGet(int i, int j);

	int orderTotGet();

	List<Long> orderListGetByYear(int year);

	List<OrderItemDTO> myOrderItemListGet(MemberDTO member);

	void orderItemInsert(OrderItemDTO item);
	
	void orderItemUpdate(OrderItemDTO item);

}
