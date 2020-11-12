package tp.kits3.open4um.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.open4um.daoimpl.ProductToanImpl;
import tp.kits3.open4um.dto.ProductRoleDto;
import tp.kits3.open4um.vo.Product;

@Service
public class ProductToanAdminService {
	@Autowired
	private ProductToanImpl impl;

	public List<ProductRoleDto> selectdanhsachbaiviet() {
		List<ProductRoleDto> list1 = impl.selectdanhsachBaiViet();
		return list1;
	}

	public List<ProductRoleDto> selectduyet() {
		List<ProductRoleDto> list2 = impl.selectduyet();
		return list2;
	}

	public List<ProductRoleDto> selectchuaduyet() {
		List<ProductRoleDto> list3 = impl.selectchuaduyet();
		return list3;
	}

	public List<ProductRoleDto> selectaccountchuaduyet() {
		List<ProductRoleDto> list4 = impl.selectaccountchuaduyet();
		return list4;
	}

	public List<ProductRoleDto> selectaccountduyet() {
		List<ProductRoleDto> list5 = impl.selectaccountduyet();
		return list5;
	}

	public List<ProductRoleDto> selectaccountdanhsachbaiviet() {
		List<ProductRoleDto> list5 = impl.selectaccountdanhsachbaiviet();
		return list5;
	}

	public void insertbaiviet(ProductRoleDto productRoleDto) {
		List<ProductRoleDto> list6= impl.insertbaiviet();
		
	}
	public ProductRoleDto selecttungbaiviet(int id) {
		ProductRoleDto pro= impl.selecttungbaiviet(id);
		return pro;
	}
	public List<ProductRoleDto> selecttheotieude(String ctgname) {
		// TODO Auto-generated method stub
		List<ProductRoleDto> pro= impl.selecttheotieude(ctgname);
		return pro;
	}

	public ProductRoleDto postDetails(int idPost) {
		return impl.postDetails(idPost);
	}
	public void updatePostDetails(ProductRoleDto productRoleDto) {
		impl.updatePostDetails(productRoleDto);
	}
	public void insertPro(Product product) {
		impl.insertPro(product);
	}
	public void deletePost(int idPost) {
		impl.deletePro(idPost);
	}
}
