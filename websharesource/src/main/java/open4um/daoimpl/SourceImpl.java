package open4um.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import tp.kits3.open4um.config.ConnectionFactory;
import tp.kits3.open4um.dao.SourceDao;
import tp.kits3.open4um.dto.SourceDto;
import tp.kits3.open4um.vo.Source;

 
@Repository
public class SourceImpl implements SourceDao {

	public List<SourceDto> ListSources() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<SourceDto> listSource = session.selectList("mappers.sourceMapper.selectAll");
		session.commit();
		session.close();
		return listSource;
	}
	public void add(Source source) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.insert("mappers.sourceMapper.insert", source);
		session.commit();
		session.close();
	}
	 
	@Override
	public List<SourceDto> selectBySourceWeb() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<SourceDto> list = session.selectList("mappers.sourceMapper.selectBySourceWeb");
		session.commit();
		session.close();
		return list; 
	}
	@Override
	public List<SourceDto> selectLimit(HashMap<String, Integer> hs) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<SourceDto> list = session.selectList("mappers.sourceMapper.selectLimit", hs); 
		session.commit();
		session.close();
		return list;
	}
	@Override
	public List<SourceDto> selectBySourceGame() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<SourceDto> list = session.selectList("mappers.sourceMapper.selectBySourceGame"); 
		session.commit();
		session.close();
		return list;
	}
	@Override

	public List<SourceDto> ListSourceNew() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<SourceDto> listSource = session.selectList("mappers.sourceMapper.selectSourceNew");
		session.commit();
		session.close();
		return listSource;
	}
	@Override
	public int totalSource() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		Source  source = session.selectOne("mappers.sourceMapper.selectTotalProduct");
		session.commit();
		session.close();
		return source.getTotalproduct();
	}

	@Override
	public List<Source> ListMoreSource(int limit, int offset) {
		// TODO Auto-generated method stub
		SqlSession session = ConnectionFactory.getInstance().openSession();
		Map<String, Integer> readMore = new HashMap<String, Integer>();
		readMore.put("limit", limit);
		readMore.put("offset", offset);
		List<Source> listSource = session.selectList("mappers.sourceMapper.selectSourceNewMore",readMore);
		session.commit();
		session.close();
		return listSource;
		 
	}
	@Override
	public List<Source> ListSearchSource(String key) {
		SqlSession session = ConnectionFactory.getInstance().openSession();		 
		List<Source> listSource = session.selectList("mappers.sourceMapper.selectSearchSource",key);
		session.commit();
		session.close();
		return listSource;
	}
	

	public SourceDto showOne(int sourceid) {

		SqlSession session = ConnectionFactory.getInstance().openSession();
		SourceDto dto = session.selectOne("mappers.sourceMapper.selectOne", sourceid);
		session.commit();
		session.close();
		return dto; 
	}
	
	public List<SourceDto> selectByCateId(int ctgid) {
		SqlSession session = ConnectionFactory.getInstance().openSession();

		List<SourceDto> list = session.selectList("mappers.sourceMapper.selectByCateId", ctgid); 
		session.commit();
		session.close();
		return list;
	}
	
	
	@Override
	public List<SourceDto> showSourceTheSame(String ctgname) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<SourceDto> list = session.selectList("mappers.sourceMapper.selectSourceTheSame",ctgname);
		session.commit();
		session.close();
		return  list;
	}

	@Override
	public Source selectOne(int id) {
		SqlSession session = ConnectionFactory.getInstance().openSession();		 
		Source list = session.selectOne("mappers.sourceMapper.selectOne", id);
		session.commit();
		session.close();
		return list;
	}
	@Override
	public String selectNameCategory(int id) {
		SqlSession session = ConnectionFactory.getInstance().openSession();		 
		String list = session.selectOne("mappers.sourceMapper.selectNameCategory", id);
		session.commit();
		session.close();
		return list;
	}
	public Source selectA(String sourcename) {
		SqlSession session = ConnectionFactory.getInstance().openSession();		 
		Source listSource = session.selectOne("mappers.sourceMapper.selectA",sourcename);
		session.commit();
		session.close();
		return listSource;
	}
	public List<SourceDto> selectLimitSource(int pageNo) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<SourceDto> list = session.selectList("mappers.sourceMapper.selectLimitSource", pageNo); 
		session.commit();
		session.close();
		return list;

	}
	public List<SourceDto> selectLimitSourceWeb(int pageNo) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<SourceDto> list = session.selectList("mappers.sourceMapper.selectLimitSourceWeb", pageNo); 
		session.commit();
		session.close();
		return list;
	}
	public List<SourceDto> selectSourceByTag(int tagid) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<SourceDto> list = session.selectList("mappers.sourceMapper.selectSourceByTag", tagid); 
		session.commit();
		session.close();
		return list;
	}
	public List<SourceDto> selectSourceByTag(HashMap<String, Integer> hs) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<SourceDto> list = session.selectList("mappers.sourceMapper.selectLimitTag", hs); 
		session.commit();
		session.close();
		return list;
	}
	


}
