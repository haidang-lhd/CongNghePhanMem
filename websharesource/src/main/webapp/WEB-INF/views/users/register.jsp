<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="main_form_register">

	<div class="form_register">
		<div class="register_brand">
			<h3>OPEN4UM</h3>
		</div>

		<form action="/open4um/api/register" id="registerForm" method="post">
			<div class="register">
				<h3>SIGN UP</h3>
			</div>
			<div class="input_form">
				<input type="text" placeholder="Enter username" id="username"
					name="username" />
			</div>
			<div class="input_form register">
				<input type="password" placeholder="Enter password"
					id="password_register" name="password" />
					<%--<i
					class="fa fa-eye-slash hiddeneye" aria-hidden="true"></i> <i
					class="fa fa-eye showeye" aria-hidden="true"></i> --%>
			</div>
			<div class="input_form">
				<input type="text" placeholder="Enter email" id="emaill" name="email" />
			</div>

			<div class="input_form">
				<input type="number" placeholder="Enter phone" id="phone"
					name="phone" />
			</div>
			<div class="newmenber signin">
				A member? <a href="/open4um/login">Sign in now</a>
			</div>
			<div class="btn-register">
				<button type="submit">Sign up</button>
			</div>
		</form>
	</div>
</div>