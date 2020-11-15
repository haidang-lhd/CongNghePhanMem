package  open4um.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import open4um.vo.Product;

public class UploadProductDto extends  Product{
	private MultipartFile multipartFile;
	private List<MultipartFile> images;

	public UploadProductDto() {
		super();
	}

	public UploadProductDto(MultipartFile multipartFile, List<MultipartFile> images) {
		super();
		this.multipartFile = multipartFile;
		this.images = images;
	}

	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}

	public List<MultipartFile> getImages() {
		return images;
	}

	public void setImages(List<MultipartFile> images) {
		this.images = images;
	}

	
	
}
