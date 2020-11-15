package open4um.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import  open4um.dao.TagDao;
import  open4um.vo.Category;
import  open4um.vo.Tag;
import  open4um.vo.TagProduct;

@Service
public class TagService implements TagDao{
	@Autowired 
	private TagDao dao;

	@Override
	public void insert(Tag tag) {
		dao.insert(tag);
	}

	@Override
	public Tag selectTag(String tagname) {
		return dao.selectTag(tagname);
		
	}

	@Override
	public void insertTagProduct(TagProduct tagpro) {
		dao.insertTagProduct(tagpro);
		
	}

	@Override
	public List<TagProduct> selectTagBySource(int sourceid) {
		List<TagProduct> list = dao.selectTagBySource(sourceid);
		return list;
	}
	

}
