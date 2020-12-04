package  open4um.daoimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import  open4um.config.ConnectionFactory;
import  open4um.dao.ReportDAO;
import  open4um.vo.Report;

@Repository
public class ReportImpl implements ReportDAO{

	@Override
	public void insert(Report rp) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.insert("mappers.reportMapper.insert", rp);
		session.commit();
		session.close();
	}

}
