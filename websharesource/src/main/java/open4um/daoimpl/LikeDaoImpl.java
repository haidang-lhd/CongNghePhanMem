package  open4um.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import  open4um.config.ConnectionFactory;
import  open4um.dao.LikeDAO;
import  open4um.dto.LikePCDto;
import  open4um.vo.Product;

@Repository
public class LikeDaoImpl implements LikeDAO{

	public Product selectLikeP(int idpro) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		Product listPro = session.selectOne("mappers.productMapper.selectOne", idpro);
		session.close();
		return listPro;
	}
	

	public void updatelike(LikePCDto likepc) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.update("mappers.likepcMapper.updateLike", likepc);
		session.commit();
		session.close();
		
	}

}
