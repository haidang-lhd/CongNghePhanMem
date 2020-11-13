package open4um.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import tp.kits3.open4um.config.ConnectionFactory;
import tp.kits3.open4um.dao.ProductToanAdminDao;
import tp.kits3.open4um.dto.ProductRoleDto;
import tp.kits3.open4um.vo.Product;
@Repository
public class ProductToanImpl implements ProductToanAdminDao{
	//	author:toan
	public List<ProductRoleDto> selectdanhsachBaiViet() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<ProductRoleDto> list = session.selectList("mappers.productroleMapper.selectdanhsachBaiViet");
		session.commit();
		session.close();
		return list;
		// TODO Auto-generated method stub
//het author:Toan
}
	public List<ProductRoleDto> selectduyet() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<ProductRoleDto> list = session.selectList("mappers.productroleMapper.selectduyet");
		session.commit();
		session.close();
		return list;
	}
	public List<ProductRoleDto> selectchuaduyet() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<ProductRoleDto> list = session.selectList("mappers.productroleMapper.selectchuaduyet");
		session.commit();
		session.close();
		return list;
	}
	public List<ProductRoleDto> selectaccountduyet() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<ProductRoleDto> list = session.selectList("mappers.productroleMapper.selectaccountduyet");
		list.size();
		session.commit();
		session.close();
		return list;
	}
	public List<ProductRoleDto> selectaccountchuaduyet() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<ProductRoleDto> list = session.selectList("mappers.productroleMapper.selectaccountchuaduyet");
		list.size();
		session.commit();
		session.close();
		return list;
	}
	public List<ProductRoleDto> selectaccountdanhsachbaiviet() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<ProductRoleDto> list = session.selectList("mappers.productroleMapper.selectaccountdanhsachbaiviet");
		list.size();
		session.commit();
		session.close();
		return list;
		
	}
	@Override
	public List<ProductRoleDto> insertbaiviet() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<ProductRoleDto> list = session.selectList("mappers.productroleMapper.insert");
		list.size();
		session.commit();
		session.close();
		return list;
	}
	@Override

	public ProductRoleDto postDetails(int idPost) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		ProductRoleDto productRoleDto = session.selectOne("mappers.productroleMapper.selectDetailsPost", idPost);
		session.commit();
		session.close();
		return productRoleDto;
	}
	@Override
	public void updatePostDetails(ProductRoleDto productRoleDto) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.update("mappers.productroleMapper.updatePostDetails", productRoleDto);
		session.commit();
		session.close();
		
	}
	@Override
	public void insertPro(Product product) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.insert("mappers.productMapper.insertPro", product);
		session.commit();
		session.close();
	}
	@Override
	public void deletePro(int idPost) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.delete("mappers.productMapper.delete", idPost);
		session.commit();
		session.close();
	}
	public ProductRoleDto selecttungbaiviet(int idPro) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		ProductRoleDto list = session.selectOne("mappers.productroleMapper.selecttungbaiviet", idPro);
		session.commit();
		session.close();
		return list;
	}
	
	@Override
	public List<ProductRoleDto> selecttheotieude(String ctgname) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<ProductRoleDto> list = session.selectList("mappers.productroleMapper.selecttheotieude",ctgname);
		session.commit();
		session.close();
		return list;
	}
}
