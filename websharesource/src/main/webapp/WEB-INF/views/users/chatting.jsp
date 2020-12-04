<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	String contextPath = request.getContextPath();
    %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/chat.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;1,300;1,400&display=swap"
        rel="stylesheet">
        <!-- fontawesome 4 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Chatting</title>
</head>
<body>
    <div class="container-chat">
    	<div class="chat-left">
        <div class="img-avatar">
            <div class="main-img">
                <!-- insert avatar -->
                <img id="avatar" src="<c:url value="${userName.getAvatar()}"/>"
						alt="avatar" class="avatar">
            </div>
    
        </div>
        <div class="act-avatar">
            <ul id="list-menu-chat">
                <li><a class="t-link" href="<%=contextPath%>/profile">Your Profile</a></li>
                <li><a class="t-link" href="<%=contextPath%>/upload">Your Upload</a></li>
                <li><a class="t-link" href="<c:url value='/historymoney'/>">History of Input</a></li>
                <li><a class="t-link active" href="<c:url value='/chatting'/>">Chat Manager</a></li>
            </ul>
        </div>
    </div>
    	<div class="chat-right">
        <div class="label-chat">
            <div class="content-chat">
                <h1><a href="">Message</a></h1>
               
            </div>
            <div class="search-chat">
                <input type="search" placeholder="Search username" id="search-chat">
                <button><i class="fa fa-search" aria-hidden="true"></i></button> 
            </div>
        </div>
        <div class="table-chat">
                <div id="listMessage"></div> <!-- ajax -->
            
        </div>
        <div class="creat-message">
        	<i class="fa fa-plus-circle" aria-hidden="true" onclick="creatTable()"></i>
        </div>
        <div class="table-creat">
        	<div class="tab-creat" id="tab-creat">
        		<div class="label-creat">
        			<p>USER NAME</p>
        		</div>
        		<div class="goal">
        			<c:forEach items="${listAll}" var="friend">
        			<a href="boxchat/${friend.userid}"><p>${friend.username}</p></a>
        			</c:forEach>
        		</div>
        	</div>
        </div>
    </div>
    </div>
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script type="text/javascript" src="resources/js/chat.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>