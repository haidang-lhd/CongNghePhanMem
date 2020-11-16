package open4um.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import open4um.dao.HistoryMoneyDao;
import open4um.daoimpl.HistoryMoneyImpl;
import open4um.vo.HistoryMoney;

@Service
public class HistoryMoneyService implements HistoryMoneyDao {
	@Autowired
	private HistoryMoneyImpl dao;
	public List<HistoryMoney> selectAll(int id){
		return dao.selectAll(id);
	}
	public List<HistoryMoney> selectSearch(int id, String searchInput) {
		return dao.selectSearch(id, searchInput);
	}
	public void delete(int id) {
		dao.delete(id);
	}
	@Override
	public void insert(HistoryMoney his) {
		dao.insert(his);
	}
}

