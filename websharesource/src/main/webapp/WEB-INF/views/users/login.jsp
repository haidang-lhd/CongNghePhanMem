<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<div class="main_form">
	<div class="form_login">
		<div class="title_form">
			<h3>OPEN4UM</h3>
		</div>

		<div class="login_social-network">
			<h3>SIGN IN</h3>

			<%--<fb:login-button scope="public_profile,email"
				onlogin="checkLoginState();">
			</fb:login-button> --%>
			<%--<div id="errorFB"></div>

			--%>
			<a
				href="https://www.facebook.com/dialog/oauth?client_id=1041055959643557&redirect_uri=https://localhost:8443/open4um/api/loginFB"
				class="fblogin"><i class="fa fa-facebook-official"
				aria-hidden="true">
				</i>Facebook</a> 
				<a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=https://localhost:8443/open4um/api/loginGmail&response_type=code
    &client_id=1055902144348-1m5kde8jfcivc66mku9rhtktgc5j1835.apps.googleusercontent.com&approval_prompt=force" class="gglogin"><i
				class="fa fa-google" aria-hidden="true"></i>Google</a> 
		</div>
		<div class="error"></div>
		<form id="loginForm" name='loginForm' action="<c:url value='/login' />" method='POST'>
			<div class="input_form">
				<input type="text" placeholder="Enter username" id="username1"
					name="username">
			</div>
			<div class="input_form">
				<input type="password" placeholder="Enter password" id="password1"
					name="password"> 
					<%--<i class="fa fa-eye-slash hiddeneye"
					aria-hidden="true"></i> <i class="fa fa-eye showeye"
					aria-hidden="true"></i> --%>
			</div>

			<!-- <div class="handl_pw">

				<div class="forget_pw">
					<a href="#">Forgot Password?</a>
				</div>

			</div> -->
			<div class="newmenber signup">
				Not a member? <a href="/open4um/register">Sign up now</a>
			</div>
			<div class="btn-login"><input type="submit" style="
    outline: none;
    background: transparent;
    border: none;
    color: #fff;
    text-transform: unset;
    font-weight: 500;
"value="Sign in" ></div>
		</form>
	</div>
</div>

 

