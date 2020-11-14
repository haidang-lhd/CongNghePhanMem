package  open4um.dao;

import java.util.HashMap;
import java.util.List;

import tp.kits3.open4um.dto.SourceDto;
import tp.kits3.open4um.vo.Source;

 
public interface SourceDao {
	public List<SourceDto> ListSources();
	//Chi
	public void add(Source source);
	public List<SourceDto> selectBySourceWeb();
	public List<SourceDto> selectLimit(HashMap<String, Integer> hs);
	public List<SourceDto> selectBySourceGame();
	public List<SourceDto> showSourceTheSame(String ctgname);

	//author nguyenthai
	public List<SourceDto> ListSourceNew();
	public int totalSource();
	public List<Source> ListMoreSource(int limit,int offset);
	public List<Source> ListSearchSource(String key);

	public Source selectOne(int id);
	
	public String selectNameCategory(int id);
	
	public SourceDto showOne(int sourceid);





}
