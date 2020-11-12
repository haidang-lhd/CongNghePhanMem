package tp.kits3.open4um.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.open4um.dao.SourceDao;
import tp.kits3.open4um.daoimpl.SourceImpl;
import tp.kits3.open4um.dto.SourceDto;
import tp.kits3.open4um.vo.Source;

/*
 * author nguyenthai
 */
@Service
public class SourceService implements SourceDao{


	@Autowired
	private SourceImpl sourceImpl;

	public List<SourceDto> ListSources() {
		return sourceImpl.ListSources();
	}

	public List<SourceDto> ListSourceNew() {
		return sourceImpl.ListSourceNew();
	}

	// chi
	public void add(Source source) {
		sourceImpl.add(source);
	}

	public List<SourceDto> selectBySourceGame() {
		return sourceImpl.selectBySourceGame();
	}

	public List<SourceDto> selectBySourceWeb() {
		return sourceImpl.selectBySourceWeb();
	}

	public List<SourceDto> selectByCateId(int ctgid) {
		return sourceImpl.selectByCateId(ctgid);
	}

	public int selectTotalProduct() {
		int sumSource = sourceImpl.totalSource();
		int totalPages = (int)Math.ceil(sumSource / 6);
		return totalPages;
	}

	public List<Source> ListMoreSource(int limit,int offset ){
		return sourceImpl.ListMoreSource(limit, offset);
	}
	public List<Source> ListSearchSource(String key){
		return sourceImpl.ListSearchSource(key);
	}



	public SourceDto showOne(int sourceid) {
			return sourceImpl.showOne(sourceid);
		}

	public List<SourceDto> selectLimit(HashMap<String, Integer> hm) {
		return sourceImpl.selectLimit(hm);
	}

	public List<SourceDto> showSourceTheSame(String ctgname) {
		return sourceImpl.showSourceTheSame(ctgname);
	}


	@Override
	public int totalSource() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Source selectOne(int id) {
		return sourceImpl.selectOne(id);
	}

	@Override
	public String selectNameCategory(int id) {
		return sourceImpl.selectNameCategory(id);
	}

	public Source selectA(String sourcename) {
		
		return sourceImpl.selectA(sourcename);
	}

	public List<SourceDto> selectLimitSource(int pageNo) {
		
		return sourceImpl.selectLimitSource(pageNo);
	}

	public List<SourceDto> selectLimitSourceWeb(int pageNo) {
		return sourceImpl.selectLimitSourceWeb(pageNo);
	}

	public List<SourceDto> selectSourceByTag(int tagid) {
		return sourceImpl.selectSourceByTag(tagid);
	}

	public List<SourceDto> selectLimitTag(HashMap<String, Integer> hs) {
		return sourceImpl.selectSourceByTag(hs);
	}



}
