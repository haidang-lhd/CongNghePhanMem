package open4um.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import tp.kits3.open4um.config.ConnectionFactory;
import tp.kits3.open4um.dao.TagDao;
import tp.kits3.open4um.dto.Upload;
import tp.kits3.open4um.vo.Tag;
import tp.kits3.open4um.vo.TagProduct;

@Repository
public class TagImpl implements TagDao {

	@Override
	public void insert(Tag tag) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.insert("mappers.tagMapper.insert", tag);
		session.commit();
		session.close();
	}

	@Override
	public Tag selectTag(String tagname) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		Tag tag =  session.selectOne("mappers.tagMapper.selectTag", tagname);
		session.commit();
		session.close();
		return tag;
		
	}

	@Override
	public void insertTagProduct(TagProduct tagpro) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.insert("mappers.tagproductMapper.insert", tagpro);
		session.commit();
		session.close();
		
	}

	@Override
	public List<TagProduct> selectTagBySource(int sourceid) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<TagProduct> tag =  session.selectList("mappers.tagproductMapper.selectTagBySource", sourceid);
		session.commit();
		session.close();
		return tag;
	}


}
