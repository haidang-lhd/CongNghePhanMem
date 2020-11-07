<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;1,300;1,400&display=swap"
	rel="stylesheet">
<!-- fontawesome 4 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Profile</title>
</head>
<body>
	<div class="container-profile">
		<div class="profile-left">
			<div class="img-avatar">
				<div class="main-img" id="main-avatar">
					<!-- insert avatar -->
					<img id="avatar" src="<c:url value="${userName.getAvatar()}"/>"
						alt="avatar" class="avatar">
					<div class="edit-avatar" onclick="hideEditAvatar()">
						<button id="edit-avatar">edit avatar</button>
					</div>
				</div>
				<button onclick="toggleHide()" id="edit-profile">Edit</button>
			</div>
			<div class="act-avatar">
				<ul id="list-menu-profile">
					<li><a class="t-link active" href="<c:url value='/profile'/>">Your
							Profile</a></li>
					<li><a class="t-link" href="<c:url value='/upload'/>">Your
							Upload</a></li>
					<li><a class="t-link" href="<c:url value='/historymoney'/>">History
							of Input</a></li>
					<li><a class="t-link" href="<c:url value='/chatting'/>">Chat
							Manager</a></li>
				</ul>
			</div>
		</div>
		<div class="profile-right">
			<div class="cover-boxright">
				<h2>YOUR ACCOUNT</h2>
				<div class="account">
					<p>ACCOUNT</p>
					<div class="over-account">
						<div class="label-account">Email</div>
						<div class="fill-account">
							<p>${userName.getEmail()}</p>
						</div>
					</div>
					<div class="over-account">
						<div class="label-account">User Name*</div>
						<div class="fill-account">
							<p>${userName.getUsername()}</p>
							<!-- insert database -->
						</div>
					</div>
					<div class="over-account">
						<div class="label-account">Phone</div>
						<div class="fill-account">
							<p>${userName. getPhone()}</p>
							<!-- insert database -->
						</div>
					</div>
					<div class="over-account">
						<div class="label-account">Money</div>
						<div class="fill-account">
							<p>${userName.getMoney()}</p>
							<!-- insert database -->
						</div>
					</div>
					<form:form id="formUploadFile" method="POST" action="editAvatar"
						enctype="multipart/form-data" modelAttribute="myAvatar">
						<label class="vvt" for="input-avatar"> 
						<span>Choose Your Avatar</span> 
						<input type="file" name="multipartFile" id="input-avatar" />
						</label>
						<br />
						<br />
						<input type="submit" value="Change Your Avatar" id="action-avatar"/>
					</form:form>
					<div id="hide-show" class="edit-profile">
						<form:form method="POST" action="editprofile"
							modelAttribute="editProfile">
							<form:input type="hidden" value="${userName.getUserid()}"
								path="userid" />
							<form:input type="hidden" value="${userName.getPassword()}"
								path="password" />
							<form:input type="hidden" value="${userName.getAvatar()}"
								path="avatar" />
							<form:input type="hidden" value="${userName.getMoney()}"
								path="money" />
							<form:input type="hidden" value="${userName.getUsername()}"
								path="username" />
							<form:input id="email-profile" type="email"
								value="${userName.getEmail()}" path="email" required="required" />
							<br />
							<form:input id="phone" path="phone"
								value="${userName.getPhone()}" required="required" />
							<br />
							<input id="submit" type="submit" value="Submit" />
						</form:form>
					</div>
					<div id="box-edit-avatar" class="box-edit-avatar"></div>
				</div>
				<div class="social">
					<p>SOCIAL NETWORK</p>
					<div class="over-account">
						<div class="label-account">
							<i class="fa fa-facebook" aria-hidden="true"></i>
							<p>Facebook</p>
						</div>
						<div class="fill-account">
							<p>${user.username}</p>
							<!-- insert database -->
						</div>
					</div>
					<div class="over-account">
						<div class="label-account">
							<i class="fa fa-google-plus" aria-hidden="true"></i>
							<p>Google</p>
						</div>
						<div class="fill-account">
							<p>${user.username}</p>
							<!-- insert database -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="resources/js/profile.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>