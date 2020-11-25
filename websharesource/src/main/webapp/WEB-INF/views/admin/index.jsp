`<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>

<head>
<title>Web management page | Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Nguyen to the toan">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/resources/css/admin.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/responsive.css"/>">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/fa80a5a76b.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="body">
		<section>
			<!-- 	tin nhan -->
			<h1>Xin Chào Admin</h1>
			<div class="infor-row">
				<div class="infor-box user">
					<div class="icon-user">
						<i class="fas fa-users"></i>
					</div>
					<div class="infor-user">
						<h4>Số Lượng Thành Viên</h4>
						<p class="number">${name}</p>
					</div>
				</div>
				<div class="infor-box">
					<div class="icon-download">
						<i class="fas fa-cloud-download-alt"></i>
					</div>
					<div class="infor-user">
						<h4>Lượt Tải Xuống</h4>
						<p class="number">${orderhistoryname}</p>
					</div>
				</div>
				<div class="infor-box">
					<div class="icon-source">
						<i class="fas fa-laptop-code" aria-hidden="true"></i>
					</div>
					<div class="infor-user">
						<h4>Source Codes</h4>
						<p class="number">${sourcename}</p>
					</div>
				</div>
				<div class="infor-box">
					<div class="icon-message">
						<i class="fas fa-sms"></i>
					</div>
					<div class="infor-message">
						<h4>Lượng tin nhắn</h4>
						<p class="number">${messagename}</p>
					</div>
				</div>	
			</div>
		</div>
				</div>
			</div>
	</div>
