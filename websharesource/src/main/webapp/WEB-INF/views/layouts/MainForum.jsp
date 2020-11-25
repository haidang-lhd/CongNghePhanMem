<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;1,300;1,400&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value="/resources/css/style_forum.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/style_disscuss.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/style-chi-tiet-bai-viet.css" />">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link rel="stylesheet"
	href="<c:url value="/resources/sao/jquery.rateyo.min.css" />">



</head>
<body>
	<div class="forum">
		<div class="quick-menu" id="menu-nhanh" style="display: none;">
			<h2>Menu nhanh</h2>
			<div class="area-list">
				<div class="area-common">
					<h3>Khu vực chung</h3>
					<div class="menu-area">
						<ul>
							<li><a href="/open4um/forum/">Diễn Đàn</a></li>
							<li><a href="/open4um/login">Đăng nhập / Đăng kí</a></li>
							<li><a href="#">Giúp đỡ</a></li>
						</ul>
					</div>
				</div>
				<div class="login-header list-forums">
					<h3>Cộng đồng</h3>
					<div class="menu-list">
						<ul>
							 <c:forEach var = "item" items="${listc}">
							 	<c:forEach var = "items" items="${listc }">
									<c:if test="${items.ctgid == item.ctgid}">	
										<li> <a href="/open4um/forum/${item.ctgid}/"><span>${item.ctgname}</span></a></li>
									</c:if>
								 </c:forEach>
 						  </c:forEach> 
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="forum-page">
			<header>
				<div class="container">
					<div class="row">
						<div class="col-md-2 logo-header">
							<a href="/open4um/home"><h2>OPEN4UM</h2></a>
						</div>
						<div class="col-md-4 menu-header">
							<ul>
								<li><a href="/open4um/forum/">Diễn đàn</a></li>
								<li><a href="/open4um/sourceweb">Source</a></li>
							</ul>
						</div>
						<div class="col-md-3">
							<div class="search-header">
								<form action="/open4um/forum/search/" method="POST" id="search">
									<input type="search" id="searchi" name="keyword"
										placeholder="Search and press enter" value="" />
								</form>

								<div class="icon-search">
									<i class="fa fa-search" id="clicksearch"></i>
								</div>
							</div>
						</div>
						<div class="col-md-3 login-header">
							<div>
								<c:choose>
									<c:when test="${pageContext.request.userPrincipal.name != null}">
										
										<a href="/open4um/chatting"><c:out value="${pageContext.request.userPrincipal.name}" /> </a>
									</c:when>
									<c:otherwise>
										<a href="/open4um/login">DANG NHAP</a>
									</c:otherwise>
								</c:choose>
							</div>
							<div>
								<a href="/open4um/chatting"><i class="fa fa-envelope"></i> </a>
							</div>
							<div style="display: none;">
								<a href="#"><i class="fa fa-bell"></i></a>
							</div>

						</div>
					</div>
				</div>
			</header>
 
			<nav>
				<div class="container">
					<div class="menu-nav">
						<ul>
							 <c:forEach var = "item" items="${listc}">
							 	<c:forEach var = "items" items="${listc }">
									<c:if test="${items.ctgid == item.ctgid}">	
											<li><a href="/open4um/forum/${item.ctgid}/"><i
													class="fa fa-star"></i></a> <a
												href="/open4um/forum/${item.ctgid}/"><span>${item.ctgname}</span></a></li>
									</c:if>
								 </c:forEach>
 						  </c:forEach> 
						</ul>
					</div>
				</div>
			</nav>

			<decorator:body />




			<footer>
				<div class="container">
					<div class="menu-footer">
						<ul>
							<li><a href="#">TRANG CHỦ </a></li>
							<li><a href="#">GIÚP ĐỠ</a></li>
							<li><a href="#">ĐIỀU KHOẢN VÀ QUY ĐỊNH</a></li>
							<li><a href="#">CHÍNH SÁCH QUYỀN RIÊNG TƯ</a></li>
							<li><a href="#"><i class="fa fa-arrow-up"></i></a></li>

						</ul>
					</div>

					<div class="middle-footer">
						<div class="row row-middle-footer">
							<div class="col-md-4">
								<span>OPEN4UM.VN</span>
								<ul>
									<li><a href="/open4um/home">Trang chủ</a></li>
									<li><a href="/open4um/forum/">Diễn đàn</a></li>
									<li><a href="/open4um/sourceweb">Source</a></li>
									<li><a href="#">Liên hệ Quảng cáo</a></li>
								</ul>
							</div>

							<div class="col-md-4">
								<span>Diễn đàn</span>
								<ul>
									<li><a href="/open4um/forum/thaoluanchung/news/">Tin Tức CNTT</a></li>
									<li><a href="/open4um/forum/thaoluanchung/jobs/">Nghề Nghiệp</a></li>
									<li><a href="/open4um/forum/kienthuc/nmlt/">Nhập Môn Lập Trình</a></li>
									<li><a href="/open4um/forum/kienthuc/ktlt/">Kĩ Thuật Lập trình </a></li>
								</ul>
							</div>

							<div class="col-md-4">
								<span>SOURCE</span>
								<ul>
									<li><a href="/open4um/sourceweb">Source Web</a></li>
									<li><a href="/open4um/sourcegame">Source Game</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<div class="bottom-footer">
					<div class="row">
						<div class="col-md-8 address">
							<div>
								<p>Chịu trách nhiệm về nội dung: • © 2020 Công
									ty cổ phần Mạng xã hội Open4um</p>
								<p>• MST: ------ Địa chỉ: ------• SĐT: ------- • Giấy phép
									thiết lập MXH --------, ký ngày: -------.</p>
							</div>
						</div>

						<div class="col-md-4 icon-footer">
							<ul>
								<li>
									<div>
										<a href="#"><img
											src="<c:url value="/resources/images/fblogo.png"/>" alt=""></a>
									</div>
								</li>
								<li>
									<div>
										<a href="#"><img
											src="<c:url value="/resources/images/gmail.png"/>" alt=""></a>
									</div>
								</li>
								<li>
									<div>
										<a href="#"><img
											src="<c:url value="/resources/images/youtube.png"/> " alt=""></a>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<%-- <script src="<c:url value="/resources/js/forum.js" />"></script> --%>
</body>

</html>