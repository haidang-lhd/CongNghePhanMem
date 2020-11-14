<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <% 
    	String contextPath = request.getContextPath();
    %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!doctype html>
<html lang="en">
  <head>
    <title>Your Upload</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <link rel="stylesheet" href="resources/css/upload.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
       <!-- fontawesome 4 -->
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body>
    <div class="container-upload">
        <div class="upload-left">
            <div class="img-avatar">
                <div class="main-img">
                    <!-- insert avatar -->
                    <img id="avatar" src="<c:url value="${userName.getAvatar()}"/>"
						alt="avatar" class="avatar">
                </div>
            </div>
            <div class="act-avatar">
                <ul>
                  <li><a class="t-link" href="<c:url value='/profile'/>">Your Profile</a></li>
                  <li><a class="t-link active" href="<%=contextPath%>/upload">Your Upload</a></li>
                  <li><a class="t-link" href="<c:url value='/historymoney'/>">History of Input</a></li>
                  <li><a class="t-link" href="<c:url value='/chatting'/>">Chat Manager</a></li>
                </ul>
            </div>
        </div>
    <div class="upload-right">
      <div class="label-upload">
        <h1><a href="#">YOUR UPLOAD</a></h1>
        <div class="search-upload">
        	<form action="search-upload">
            <input type="search" placeholder="Search" name="freeText" id="search-upload">
            <button><i class="fa fa-search" aria-hidden="true"></i></button>
            </form>
        </div>
      </div>
      <div class="box-upload">
        <table 	border="1" width="95%" action="upload">
          <tr>
            <th>Category</th>
            <th>Source Name</th>
            <th>Price</th>
            <th>Date</th>
            <th>State</th>
            <th></th>
          </tr>
           <c:forEach items="${uplist}" var="list">
            <tr>
              <td>${list.ctgname}</td>
              <td> ${list.sourcename}</td>
              <td>${list.price}</td>
              <td> ${list.date}</td>
              <td>${list.statename}</td>        
              <td><a href="<c:url value='/upload/${list.sourceid}'/>"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
            </tr>
          </c:forEach>
          </table>
      </div>
    </div>
</div>
    <!-- Optional JavaScript -->
      <script type="text/javascript" src="resources/js/profile.js"></script>
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>