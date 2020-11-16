package open4um.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import open4um.config.ConnectionFactory;
import open4um.dao.HistoryMoneyDao;
import open4um.vo.HistoryMoney;

@Repository
public class HistoryMoneyImpl implements HistoryMoneyDao {
	public List<HistoryMoney> selectAll(int id){
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<HistoryMoney> list = session.selectList("mappers.historymoneyMapper.selectAll", id);
		session.commit();
		session.close();
		return list;
	}

	public List<HistoryMoney> selectSearch(int id, String searchInput) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("userid", id);
		param.put("searchInput", searchInput);
		 SqlSession session = ConnectionFactory.getInstance().openSession();
		List<HistoryMoney> list = session.selectList("mappers.historymoneyMapper.selectSearch", param);
		session.commit();
		session.close();
		return list;
	}

	public void delete(int id) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.delete("mappers.historymoneyMapper.delete", id);
		session.commit();
		session.close();
	}
	@Override
	public void insert(HistoryMoney his){
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.insert("mappers.historymoneyMapper.insert", his);
		session.commit();
		session.close();
	}
}