package  open4um.dao;

import java.util.HashMap;
import java.util.List;

import  open4um.vo.OrderHistory;

public interface OrderHistoryDAO {
	public List<OrderHistory> selectOrderHistoryName();
	
	public OrderHistory selectHistory(HashMap<String, Integer> map);
	public void insert(OrderHistory order);
}
