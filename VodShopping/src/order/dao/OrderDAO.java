package order.dao;

import java.util.List;

import main.bean.IndexTestDTO;
import member.bean.MemberDTO;

import org.hibernate.HibernateException;

import order.bean.OrderDTO;

public interface OrderDAO {

	void orderInsert(OrderDTO order) throws HibernateException;

	List<OrderDTO> myOrderListGet(MemberDTO member);

	Integer generationCountGet(int i, int j);

	int orderTotGet();

	List<Long> orderListGetByYear(int year);

	void testSave(IndexTestDTO dto);

}
