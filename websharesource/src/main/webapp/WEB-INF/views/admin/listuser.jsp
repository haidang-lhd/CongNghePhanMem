 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	//String contextPath =pageContext.getRequest().getServletContext();
String contextPath = request.getContextPath();
%>
<script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<style>
table#mytable2 {
    text-align: center;
    margin-left: 75px;
}
</style>

<div id="body" class="layout-admin" style="
    margin: 0 auto;
    display: block;
    width: 1509px;
">

	<div class="nav-container">
		<div class="user">
			<div class="image-user">
				<img src="images/2744528.jpg" alt="">
			</div>
			<div class="title-user">
				<h1>Admin</h1>
				<p>Nguyễn Tô Thế Toàn</p>
				<div class="center">
					<div class="left">
						<p>
							<a href="profile.html"> Profile</a>
						</p>
					</div>
					<div class="right">
						<p>
							<a href="">Đăng Xuất</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="accordion" id="accordionExample">
			<div class="card">
				<div class="card-header" id="headingOne">
					<h2 class="mb-0">
						<button class="btn btn-link btn-block text-left text-center"
							type="button" data-toggle="collapse" data-target="#collapseOne"
							aria-expanded="true" aria-controls="collapseOne">QUẢN LÝ
							THÀNH VIÊN</button>
					</h2>
				</div>

				<div id="collapseOne" class="collapse show"
					aria-labelledby="headingOne" data-parent="#accordionExample">
					<div class="card-body">
						<ul>
							<li class="active"><a href="ListUser.html">DANH SÁCH
									THÀNH VIÊN</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingTwo">
					<h2 class="mb-0">
						<button
							class="btn btn-link btn-block text-left collapsed text-center"
							type="button" data-toggle="collapse" data-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">QUẢN
							LÝ BÀI VIẾT</button>
					</h2>
				</div>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionExample">
					<div class="card-body">
						<ul>
							<li class="active"><a href="addBaiViet.html">THÊM BÀI
									VIẾT</a></li>
						</ul>
					</div>
					<div class="card-body">
						<ul>
							<li class="active"><a href="ListBaiViet.html">DANH SÁCH
									BÀI VIẾT</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingThree">
					<h2 class="mb-0">
						<button
							class="btn btn-link btn-block text-left collapsed text-center"
							type="button" data-toggle="collapse" data-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">
							QUẢN LÝ CHUYÊN MỤC</button>
					</h2>
				</div>
				<div id="collapseThree" class="collapse"
					aria-labelledby="headingThree" data-parent="#accordionExample">
					<div class="card-body">
						<ul>
							<li class="active"><a href="ListChuyenMuc.html">DANH
									SÁCH CHUYÊN MỤC</a></li>
						</ul>
					</div>

				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingFour">
					<h2 class="mb-0">
						<button
							class="btn btn-link btn-block text-left collapsed text-center"
							type="button" data-toggle="collapse" data-target="#collapseFour"
							aria-expanded="false" aria-controls="collapseFour">QUẢN
							LÝ THẺ</button>
					</h2>
				</div>
				<div id="collapseFour" class="collapse"
					aria-labelledby="headingFour" data-parent="#accordionExample">
					<div class="card-body">
						<ul>
							<li class="active"><a href="ListThe.html">DANH SÁCH THẺ</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<form class="navbar-form navbar-right">
            <div class="form-group">
            <input style="width:300px;" type="text" class="form-control" name="username1" placeholder="Search" id="username1" ></input>
            </div>
            <button type="button" class="btn btn-default" id="searchButton">
              
            <a onclick="myFunction()">Search</a></button>
	</form>
	<div id="form-user" class="form-group">
		<form>
				<table id="mytable2" class="table table-bordered table-striped">
								<thead>
									<tr>
											<th>User Name</th>
											<th>Phone</th>
											<th>Email</th>
											<th>Role</th>
											<!-- <th>Money</th> -->
											<th>Status</th>
											<th>Action</th>
									</tr>
								</thead>
								<c:forEach var="listUser" items="${listUser}">
									<tbody>
										<tr>
											<td><input style="padding: 14px;" name="username"
												value="${listUser.username}"></td>
											<td><input style="padding: 14px;" name="phone"
												value="${listUser.phone}"></td>
											<td><input style="padding: 14px;" name="email"
												value="${listUser.email}"></td>
											<td><input style="padding: 14px;" name="roleaccount_name"
												value="${listUser.roleaccount_name}"></td>
											<%-- <td><input style="padding: 14px;" name="money"
												value="${listUser.money}"></td> --%>
											<td><input style="padding: 14px;" name="status"
												value="${listUser.status}"></td>
											<td>
												<button type="button" class="btn btn-default btn-lg" id="myBtn">
													
													<a onclick="getId(${listUser.userid})" class="btn-edit">Edit</a>
												</button>
											</td>
										</tr>
									</tbody>
								</c:forEach>

								<!-- On cells (`td` or `th`) -->
							</table>
			
		</form>
	</div>
		<div class="modal fade" id="myModal" role="dialog"
>
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="edit-h4">
							<span class="glyphicon glyphicon-lock"></span>EDIT FORM
						</h4>
					</div>

					<div class="modal-body">
						<form action="/open4um/edit/" id="listform" method="post">
							<div class="form-group modaledit">
								<label for="psw"><span
									class="glyphicon glyphicon-eye-open"></span> ID</label> <input
									type="text" class="form-control" id="userid" name="userid" readonly="readonly">
							</div>
							<div class="form-group modaledit">
								<label for="psw"><span
									class="glyphicon glyphicon-eye-open"></span>User name</label> <input
									type="text" class="form-control" id="username"
									placeholder="Enter username" name="username">
							</div>
							<div class="form-group modaledit">
								<label for="psw"><span
									class="glyphicon glyphicon-eye-open"></span>Phone</label> <input
									type="text" class="form-control" id="phone"
									placeholder="Enter phone" name="phone">
							</div>
							<div class="form-group modaledit">
								<label for="psw"><span
									class="glyphicon glyphicon-eye-open"></span>Email</label> <input
									type="text" style="margin-left: 2px;" class="form-control" id="email"
									placeholder="Enter email" name="email">
							</div>
							<div class="form-group modaledit">
								<label for="psw"><span
									class="glyphicon glyphicon-eye-open"></span>Role</label> <input
									type="text" class="form-control" id="role"
									placeholder="Enter password" name="role">
							</div>
							<div class="form-group modaledit">
							<label for="psw"><span
									class="glyphicon glyphicon-eye-open"></span>Status</label>
									<select id="status" name="status">
										<option value="active">Active</option>
										<option value="inactive">Inactive</option>
									</select>
							</div>

							<button type="submit" class="btn btn-success btn-block">
								Save
							</button>
						</form>
					</div>


					<div class="modal-footer">
						<button type="submit" class="btn btn-danger btn-default pull-left"
							data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> Cancel
						</button>
						
					</div>


				</div>

			</div>
		</div>
</div>


<script src="<c:url value="/resources/js/web.js" />"></script>
