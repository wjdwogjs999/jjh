package main.bean;

import java.util.List;

import order.bean.OrderDTO;

public class OrderListGetByYear {
	public static Long[] orderListGetByYear(List<Long> list){
		Long[] monthlySales= new Long[12];
		for(int i=0;i<12;i++){
			monthlySales[i]=(long) 0;
		}
		for(int i=0;i<list.size();i++){
			monthlySales[i]=(list.get(i));
		}
		return monthlySales;
	}
}
