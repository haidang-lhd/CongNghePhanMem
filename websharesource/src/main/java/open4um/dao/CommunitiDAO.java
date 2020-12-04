package  open4um.dao;


import java.util.List;

import  open4um.dto.PostDto;
import  open4um.dto.PostUserDto;
import  open4um.dto.PostsDto;

 

import  open4um.dto.UploadProductDto;
import  open4um.vo.Product;

public interface CommunitiDAO {

	public void insertPosts(Product product);
	public List<PostUserDto> selectAll(int ctgid);
}
