package tp.kits3.open4um.dao;

import java.util.List;

import tp.kits3.open4um.dto.Upload;
/**
 * 
 * @author Thong
 *
 */
public interface UploadDao {
	public List<Upload> selectUpload(int id);
	public List<Upload> selectSearch(int id, String freeText);
	public void delete(int id);
}
