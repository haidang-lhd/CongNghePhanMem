<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="addPost">
	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<h1 class="text-center">
					<span class="badge badge-secondary mt-4">@Thêm Bài Viết</span>
				</h1>
				<form action="/open4um/admin/quanlybaiviet/add/" method="POST"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="title" class="badge badge-secondary mt-4 ">Tiêu
							Đề Bài Viết</label>
							<input type="text" class="form-control" id="title" name="title">
					</div>
					<div class="form-group">
						<input type="hidden" class="form-control" value="${user.userid }" id="userid"
							name="userid">
					</div>
					<div class="form-group">
						<label for="category" class="badge badge-secondary mt-4 ">Chuyên
							Mục</label> <select class="custom-select " name="ctgid" id="category">
							<option value="1">Thảo Luận Chung</option>
							<option value="2">Kiến Thức cần biết</option>
							<option value="3">Tin Tức CNTT</option>
							<option value="4">Nghề Nghiệp</option>
							<option value="6">Nhập Môn Lập Trình</option>
							<option value="7">Kĩ Thuật Lập trình</option>
						</select>
					</div>
					<label for="image" class="badge badge-secondary">Hình ảnh</label>
					<div class="custom-file">
						<input type="file" class="custom-file-input"
							id="validatedCustomFile" name="imagePro" required> <label
							class="custom-file-label" for="image">Choose file...</label>
					</div>
					<div class="form-group">
						<label for="datepost" class="badge badge-secondary mt-4 ">Time</label>
						<input type="text" class="form-control" id="datepost"
							name="time">
					</div>
					<div class="form-group">
						<label for="contentPost" class="badge badge-secondary mt-4 ">Nội
							Dung Bài Viết</label>
						<textarea class="form-control" name="content" id="contentPost"></textarea>
					</div>
					<button type="submit" class="btn btn-dark w-100">
						<b>@Gửi</b>
					</button>
				</form>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
</div>
		<section>
		<!-- 	tin nhan -->
		
			
		</section>
	</div>
