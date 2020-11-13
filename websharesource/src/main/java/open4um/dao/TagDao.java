package open4um.dao;

import java.util.List;

import tp.kits3.open4um.vo.Tag;
import tp.kits3.open4um.vo.TagProduct;

public interface TagDao {
	public void insert(Tag tag);
	public Tag selectTag(String tagname);
	public void insertTagProduct(TagProduct tagpro);
	public List<TagProduct> selectTagBySource(int sourceid);

}
