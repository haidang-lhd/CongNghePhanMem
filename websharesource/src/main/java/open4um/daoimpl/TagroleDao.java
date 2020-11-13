package open4um.dao;

import java.util.List;

import tp.kits3.open4um.dto.TagRoleDto;
import tp.kits3.open4um.vo.Source;

public interface TagroleDao {
	public List<TagRoleDto> tagtheoproid(int proid);
	public List<TagRoleDto> likebaiviet();
	public void updatelike(int proid);
	public void updatelike2(int proid);
	public void updatedislike(int proid);
	public void updatedislike2(int proid);
}
