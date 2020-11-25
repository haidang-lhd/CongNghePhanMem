<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!doctype html>
<html lang="en">
<head>
<title>HOME</title>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- font roboto -->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;1,300;1,400&display=swap"
	rel="stylesheet">
<!-- fontawesome 4 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/068da35eb9.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- css custom -->
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
<!-- profile -->

    <link rel="stylesheet" href="<c:url value="/resources/css/profileThong.css"/>">

    <link rel="stylesheet" href="<c:url value="/resources/css/profile.css"/>">

    <!-- upload -->

    <link rel="stylesheet" href="<c:url value="/resources/css/upload.css" />">



    <!-- saved -->

    <link rel="stylesheet" href="<c:url value="/resources/css/saved.css" />">

    <!-- history-input -->

     <link rel="stylesheet" href="<c:url value="/resources/css/history-input.css" />">

     <!-- chatting -->

     <link rel="stylesheet" href="<c:url value="/resources/css/chat.css" />">
     <link rel="stylesheet" href="<c:url value="/resources/css/post.css" />">
	 <link rel="stylesheet" href="<c:url value="/resources/css/chatting.css" />">
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 


</head>

<body>

	<%@include file="/WEB-INF/views/layouts/FileGenaral/header.jsp"%>

	<decorator:body />

	<script src="<c:url value="/resources/js/main.js" />"></script>
	<script src="<c:url value="/resources/js/custom.js" />"></script>
</body>

</html>
