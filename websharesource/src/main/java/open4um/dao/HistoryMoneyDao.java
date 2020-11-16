package open4um.dao;

import java.util.List;

import open4um.vo.HistoryMoney;

public interface HistoryMoneyDao {
	public List<HistoryMoney> selectAll(int id);
	public List<HistoryMoney> selectSearch(int id, String searchInput);
	public void insert(HistoryMoney his);
}
