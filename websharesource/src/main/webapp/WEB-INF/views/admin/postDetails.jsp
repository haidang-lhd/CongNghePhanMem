<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<div class="form-group">
				<h3 class="mt-4 text-uppercase text-center border-bottom">Sửa
					Bài Viết</h3>
			</div>
			<form  id="frmEditPost" action="/open4um/admin/quanlybaiviet/"  method="POST" enctype="multipart/form-data">
				<div class="form-group">
					<label for="title" class="badge badge-secondary">Tiêu Đề</label> <input
						type="text" class="form-control" name="title" id="title"
						value="${productRoleDto.title }">
				</div>
				<label for="content" class="badge badge-secondary"> Nội Dung
				</label>
				<textarea class="form-control" id="contentPost"  name="content">${productRoleDto.content }</textarea>
				<input type="hidden" class="form-control" id="title" name="proid"
					value="${productRoleDto.proid }">
				<div class="form-group">
					<label for="avatar" class="badge badge-secondary">images</label> 
					<input type="file" class="form-control" name="imageEdit" value="${productRoleDto.image }" id="imageEdit">
					<img alt="avatar" style="width: 100px; border-radius: 10px;"
						src="<c:url value="/resources/images/${productRoleDto.image }" />">
				</div>
				<div class="form-group">
					<button type="submit" style="width: 100%;"
						class="btn btn-secondary mt-4">Update</button>
				</div>

			</form>
			<div class="form-group">
				<a href="/open4um/admin/quanlybaiviet/list/" class="btn btn-dark mt-4"
					role="button">Danh Sách Bài Viết</a>
			</div>
		</div>
		<div class="col-2"></div>
	</div>

</div>