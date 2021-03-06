package open4um.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import  open4um.config.ConnectionFactory;
import  open4um.dao.SourceToanAdminDao;
import  open4um.vo.Source;

@Repository
public class SourceToanAdminImpl implements SourceToanAdminDao{
	public List<Source> selectSourceName() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Source> list1 = session.selectList("mappers.sourceMapper.selectAll");
		session.commit();
		session.close();
		return list1;
	}
}
