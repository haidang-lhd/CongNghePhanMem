<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>
<title>Web management page | Dashboard</title>
<meta name="author" content="Nguyen to the toan">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">

<script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
</head>
<body>
	 
	<div id="body">
 
		<!-- 	tin nhan -->
	 
			<div class="content-wrapper" style="min-height: 774px;">
				<!-- Content Header (Page header) -->
				<div>
					<div>
						<h3>Posts</h3>
						<a class="btn btn-dark mt-4 mb-4"
							href="/open4um/admin/quanlybaiviet/add/" role="button">@Thêm
							Bài Viết</a>
					</div>
				</div>
				<div role="tabpanel">
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<a class="nav-item nav-link active" id="nav-home-tab"
							data-toggle="tab" href="#nav-home" role="tab"
							aria-controls="nav-home" aria-selected="true">Tất Cả<span>(${accountallbaiviet})</span></a>
						<a class="nav-item nav-link" id="nav-profile-tab"
							data-toggle="tab" href="#nav-profile" role="tab"
							aria-controls="nav-profile" aria-selected="false">Đã duyệt<span>(${accountduyet})</span></a>
						<a class="nav-item nav-link" id="nav-contact-tab"
							data-toggle="tab" href="#nav-contact" role="tab"
							aria-controls="nav-contact" aria-selected="false">Chưa Duyệt<span>(${accountchuaduyet})</span></a>
					</div>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="nav-home"
							role="tabpanel" aria-labelledby="nav-home-tab">
							<div class="form-group">
								<select name="state" id="maxRows" class="form-control mt-4 mb-4"
									style="width: 150px;">
									<option value="5000">Show All</option>
									<option value="5">5</option>
									<option value="10">10</option>
									<option value="15">15</option>
									<option value="20">20</option>
									<option value="50">50</option>
									<option value="75">75</option>
									<option value="100">100</option>

								</select>


							</div>
							<table style="
    width: 100%;
" id="mytable" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th class="active tieu-de"><span>Tiêu Đề</span></th>
										<th class="tac-gia">Tác Giả</th>

										<th class="chuyen-muc">Chuyên mục</th>
										<th class="ngay-dang">Ngày đăng</th>
										<th class="xu-ly">Xử lý</th>
										<th class="trang-thai">Trạng Thái</th>
									</tr>
								</thead>
								<c:forEach var="list" items="${listproduct}">
									<tbody>
										<tr>
											<td class="active tieu-de"><span>${list.title}</span></td>

											<td class="ten">${list.getUsername()}</td>
											<td class="chuyen-muc">${list.getCtgname()}</td>
											<td class="ngay-dang">${list.getDatepost()}</td>
											<td class="xu-ly"><a
												href="/open4um/admin/quanlybaiviet/${list.proid }"><i
													class="fa fa-pencil-square-o" aria-hidden="true"></i> </a>
													<a class="delPost"
												href="/open4um/admin/quanlybaiviet/del/${list.proid }"><i
													class="fa fa-trash-o" aria-hidden="true"></i></a></td>
											 
											<td class="duyet" id="state">${list.getStatename()}</td>
										</tr>
									</tbody>
								</c:forEach>

								<!-- On cells (`td` or `th`) -->
							</table>
							<div class="navigation pagination-container"
								id="pagination-wrapper">
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">

									</ul>
								</nav>
							</div>
						</div>
						<div class="tab-pane fade" id="nav-profile" role="tabpanel"
							aria-labelledby="nav-profile-tab">

							<div class="form-group ">
								<select name="state" id="maxRows1"
									class="form-control mt-4 mb-4 mt-4 mb-4" style="width: 150px;">
									<option value="5000">Show All</option>
									<option value="5">5</option>
									<option value="10">10</option>
									<option value="15">15</option>
									<option value="20">20</option>
									<option value="50">50</option>
									<option value="75">75</option>
									<option value="100">100</option>
								</select>


							</div>
							<table  style="
    width: 100%;
" id="mytable1"
								class="table table1  table-bordered table-striped">
								<thead>
									<tr>
										<th class="active tieu-de"><span>Tiêu Đề</span></th>
										<th class="tac-gia">Tác Giả</th>

										<th class="chuyen-muc">Chuyên mục</th>
										<th class="ngay-dang">Ngày đăng</th>
										<th class="xu-ly">Xử lý</th>
										<th class="trang-thai">Trạng Thái</th>
									</tr>
								</thead>
								<c:forEach var="list" items="${duyet}">
									<tbody>
										<tr>
											<td class="active tieu-de"><span>${list.title}</span></td>

											<td class="ten">${list.getUsername()}</td>
											<td class="chuyen-muc">${list.getCtgname()}</td>
											<td class="ngay-dang">${list.getDatepost()}</td>
											<td class="xu-ly"><a
												href="/open4um/admin/quanlybaiviet/${list.proid }">
												<i
													class="fa fa-pencil-square-o" aria-hidden="true"></i> </a> <a class="delPost"
												href="/open4um/admin/quanlybaiviet/del/${list.proid }"><i
													class="fa fa-trash-o" aria-hidden="true"></i> </a></td>

											<td class="duyet" id="state">${list.getStatename()}</td>
										</tr>
									</tbody>
								          		</>
									          </c:forEach>
								<!-- On cells (`td` or `th`) -->
							</table>
							<div class="navigation navigation1 pagination-container"
								id="pagination-wrapper">
								<nav aria-label="Page navigation navigation1 example">
									<ul class="pagination1 pagination justify-content-center">

									</ul>
								</nav>
							</div>
						</div>
						<div class="tab-pane fade" id="nav-contact" role="tabpanel"
							aria-labelledby="nav-contact-tab">

							<div class="form-group">
								<select name="state" id="maxRows2"
									class="form-control mt-4 mb-4" style="width: 150px;">
									<option value="5000">Show All</option>
									<option value="5">5</option>
									<option value="10">10</option>
									<option value="15">15</option>
									<option value="20">20</option>
									<option value="50">50</option>
									<option value="75">75</option>
									<option value="100">100</option>

								</select>
							</div>
							<table style="
    width: 100%;
" id="mytable2"
								class="table table2 table-bordered table-striped">
								<thead>
									<tr>
										<th class="active tieu-de"><span>Tiêu Đề</span></th>
										<th class="tac-gia">Tác Giả</th>
										<th class="chuyen-muc">Chuyên mục</th>
										<th class="ngay-dang">Ngày đăng</th>
										<th class="xu-ly">Xử lý</th>
										<th class="trang-thai">Trạng Thái</th>
									</tr>
								</thead>
								<c:forEach var="list" items="${chuaduyet}">
									<tbody>
										<tr>
											<td class="active tieu-de"><span>${list.title}</span></td>

											<td class="ten">${list.getUsername()}</td>
											<td class="chuyen-muc">${list.getCtgname()}</td>
											<td class="ngay-dang">${list.getDatepost()}</td>
											<td class="xu-ly"><a
												href="/open4um/admin/quanlybaiviet/${list.proid }"><i
													class="fa fa-pencil-square-o" aria-hidden="true"></i> </a> 
													<a
												href="/open4um/admin/quanlybaiviet/del/${list.proid }" class="delPost"><i
													class="fa fa-trash-o" aria-hidden="true"></i></a></td>

											<td class="duyet" id="state">${list.getStatename()}</td>
										</tr>
									</tbody>
								</c:forEach>

								<!-- On cells (`td` or `th`) -->
							</table>
							<div class="navigation navigation2 pagination-container"
								id="pagination-wrapper">
								<nav aria-label="Page navigation navigation2 example">
									<ul class="pagination2 pagination justify-content-center">

									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- /.content-wrapper -->
			</div>
 
	 </div>

</body>
</html>