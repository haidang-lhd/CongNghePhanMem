package tp.kits3.open4um.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.open4um.daoimpl.ProductToanImpl;
import tp.kits3.open4um.daoimpl.TagroleImpl;
import tp.kits3.open4um.dto.ProductRoleDto;
import tp.kits3.open4um.dto.TagRoleDto;
import tp.kits3.open4um.vo.Product;
@Service
public class TagRoleService {
	@Autowired
	private TagroleImpl impl;
	public List<TagRoleDto> tagtheoproid(int proid) {
		List<TagRoleDto> list1 = impl.tagtheoproid(proid);
		return list1;
	}
	
	public void updatelike(int proid) {
		  impl.updatelike(proid);
		
	}

	public void updatelike2(int proid) {
		 impl.updatelike2(proid);
		
	}

	public void updatedislike( int proid) {
		// TODO Auto-generated method stub
		impl.updatedislike(proid);
	}

	public void updatedislike2(int proid) {
		// TODO Auto-generated method stub
		impl.updatedislike2(proid);
	}
	
}
