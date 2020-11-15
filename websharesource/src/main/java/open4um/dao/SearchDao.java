package open4um.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import  open4um.config.ConnectionFactory;
import  open4um.dto.Search;

@Repository
public class SearchDao {

	public List<Search> selectSearch(String key) {
		
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Search> list = session.selectList("mappers.searchMapper.selectSearch",key);
		session.commit();
		session.close();
		return list;
	}

}
