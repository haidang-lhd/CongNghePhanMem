package open4um.dao;

import java.util.List;

import open4um.dto.Upload;
 
public interface UploadDao {
	public List<Upload> selectUpload(int id);
	public List<Upload> selectSearch(int id, String freeText);
	public void delete(int id);
}
