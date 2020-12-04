package  open4um.dao;

import java.util.List;

import  open4um.dto.LikePCDto;
import  open4um.vo.Product;

public interface LikeDAO {
	public void updatelike(LikePCDto likepc);
	public Product selectLikeP(int idpro);
}
