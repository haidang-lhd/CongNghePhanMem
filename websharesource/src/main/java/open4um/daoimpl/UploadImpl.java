package open4um.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.fileupload.UploadContext;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import tp.kits3.open4um.config.ConnectionFactory;
import tp.kits3.open4um.dao.UploadDao;
import tp.kits3.open4um.dto.Upload;
 
@Repository
public class UploadImpl implements UploadDao {
	//view-Thong
	public List<Upload> selectUpload(int id){
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Upload> list = session.selectList("mappers.uploadMapper.selectUpload", id);
		session.commit();
		session.close();
		return list;
	}
	//search-Thong
	public List<Upload> selectSearch(int id, String freeText) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("userid", id);
		param.put("sourcename",freeText);
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Upload> list = session.selectList("mappers.uploadMapper.selectSearch", param);
		session.commit();
		session.close();
		return list;
	}
	@Override
	public void delete(int id) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.delete("mappers.uploadMapper.delete", id);
		session.commit();
		session.close();
	}
}
