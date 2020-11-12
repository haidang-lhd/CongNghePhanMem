package tp.kits3.open4um.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.open4um.dao.SearchDao;
import tp.kits3.open4um.dto.Search;

@Service
public class SearchService {
	@Autowired
	private SearchDao dao;
	public List<Search> selectSearch(String key) {
		return dao.selectSearch(key);
	}
	
}
