package order.service;

import java.util.List;

import main.bean.IndexTestDTO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import order.bean.OrderDTO;
import order.dao.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDao;
	@Autowired
	private MemberDAO memberDao;
	
	@Override
	@Transactional
	public List<OrderDTO> myOrderListGet(MemberDTO member) {
		return orderDao.myOrderListGet(member);
	}

	@Override
	@Transactional
	public void orderInsert(OrderDTO order, MemberDTO user) {
		memberDao.memberUpdate(user);
		//relation Ã³¸®
		user.addOrder(order);
		orderDao.orderInsert(order);
	}

	@Override
	@Transactional
	public Float[] generationGet(int currentYear) {
		int orderTot = orderDao.orderTotGet();
		if(orderTot!=0){
			Float[] generation = new Float[6];
			for(int i=0; i<generation.length;i++){
				int count = orderDao.generationCountGet(currentYear-19-i*10,currentYear-9-i*10);
				generation[i] = (count/(float)orderTot*100);
			}
			return generation;
		}else
			return null;
	}

	@Override
	@Transactional
	public List<Long> orderListGetByYear(int year) {
		return orderDao.orderListGetByYear(year);
	}

	@Override
	@Transactional
	public void testSave(IndexTestDTO dto) {
		orderDao.testSave(dto);
	}

}
