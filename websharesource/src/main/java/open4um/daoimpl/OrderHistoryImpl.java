package  open4um.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import  open4um.config.ConnectionFactory;
import  open4um.dao.OrderHistoryDAO;
import open4um.vo.OrderHistory;


@Repository
public class OrderHistoryImpl implements OrderHistoryDAO{
	 
	public List<OrderHistory> selectOrderHistoryName() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<OrderHistory> list3 = session.selectList("mappers.orderhistoryMapper.selectOrderHistoryId");
		session.commit();
		session.close();
		return list3;
	}

	@Override
	public OrderHistory selectHistory(HashMap<String, Integer> map) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		OrderHistory list = session.selectOne("mappers.orderhistoryMapper.selectHistory", map);
		session.commit();
		session.close();
		return list;
	}

	@Override
	public void insert(OrderHistory order) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.insert("mappers.orderhistoryMapper.insert", order);
		session.commit();
		session.close();
	}

}
