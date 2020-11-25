<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<style>
.error {
	color: var(- -mau5);
	font-weight: 700;
	position: absolute;
	right: 2%;
	text-align: left;
	top: 61%;
}

#errorFB {
	color: var(- -mau5);
	font-weight: 700;
}
</style>
<header id="header">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="header_logo">
					<div class="header_logo-name">
						<a href="/open4um/">OPEN4UM</a>
					</div>
				</div>
			</div>
			<div class="col-md-6 ntt_search">
				<form action="javascript:void(0)" class="frmSearch">
					<input type="text" placeholder="Nhập Từ Khóa"  name="search_header" id="search_header">
					<i class="fa fa-search" aria-hidden="true" onclick="searchSource()"></i>
				</form>
			</div>
			<div class="col-md-3">
				<div class="shopping_cart_box">
					<div class="row">
						<div class="col-md-6 ">
							<div class="shopping_cart_box_btn-left">
								<a href="<c:url value='/nap'/>"> <i class="fa fa-money" aria-hidden="true"></i>
									Nạp Xu
								</a>
							</div>
						</div>
						<div class="col-md-6">
							<div class="shopping_cart_box_btn-right">
								<a href="/open4um/category1"><i class='fas fa-download' style='font-size:14px'></i>Tải
									Lên</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</header>
<menu>
	<div class="container-fluid">
		<div>
			<div class="row menu">
				<div class="col-md-9" id="menu">
					<ul class="menu_left">
						<li><a href="/open4um/"> <i class="fa fa-home"
								aria-hidden="true"></i> Trang chủ
						</a></li>
						<li><a href="#"> <i class="fa fa-list-ol"
								aria-hidden="true"></i>Danh mục
						</a>
							<ul class="menu_left-sub" id="id_menu_category"></ul>
						</li>
						<li><a href="/open4um/forum/"><i class="fa fa-th-large"
								aria-hidden="true"></i>Diễn đàn</a></li>
					</ul>
				</div>
				<c:choose>
					<c:when test="${pageContext.request.userPrincipal.name != null}">
				<div class="col-md-3">
					<div class="menu_right">
						<div class="menu_right_msg">
							<a href="<c:url value='/chatting'/>"><i class="fa fa-envelope" aria-hidden="true"></i></a>

						</div>
						<div class="menu_right_login">
							<b> 
								<c:out value="${pageContext.request.userPrincipal.name}" />
							</b>
						</div>
						<div class="menu_right_setting">
							<i class="fa fa-cog" aria-hidden="true"></i>
							<ul class="menu_setting">
								<li><a href="<c:url value='/profile'/>">Your Profile</a></li>
								<li><a href="<c:url value="/logout" />">Log out</a></li>
							</ul>
						</div>
					</div>
				</div>
					</c:when>
					<c:otherwise>
						<div class="menu_right_login">
							<b><a href="/open4um/login">ĐĂNG NHẬP</a></b>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</menu>

<script src="<c:url value='/resources/js/custom.js'/>"></script>


