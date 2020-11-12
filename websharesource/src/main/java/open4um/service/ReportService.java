package tp.kits3.open4um.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.open4um.dao.ReportDAO;
import tp.kits3.open4um.vo.Report;

@Service
public class ReportService implements ReportDAO {

	@Autowired
	ReportDAO dao;
	
	@Override
	public void insert(Report rp) {
		dao.insert(rp);
	}

}
