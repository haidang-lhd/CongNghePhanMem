<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <% 
    	String contextPath = request.getContextPath();
    %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
 
	<!-- <div id="header">Header</div> -->
	<div id="body">
		<div class="container">
		  <div class="row">
		 
				    <div class="col-8">
					    <nav aria-label="breadcrumb">
						  <ol class="breadcrumb">
						    <li class="breadcrumb-item"><a href="#">Forum</a></li>
						    <li class="breadcrumb-item active" aria-current="page">${ctgname}</li>
						  </ol>
						</nav>
						<div class="title">
							<h1>${lProduct.title}</h1>
						</div>
						<div class="information-user">
							<div class="row">
								<div class="avatar-user col-2">
									<img src="<c:url value="${lProduct.avatar}" />" alt="">
								</div>
								<div class="information-user_name col-7">
									<h6>${lProduct.username}</h6>
									<div class="row">
										
										
									</div>
									
								</div>
							</div>
							
							
							<div class="hinh-anh-bai-viet">
								<img src="<c:url value="/resources/images/${lProduct.image}" />" alt="">
							</div>	

						</div>	
						<p class="content">${lProduct.content}</p>
						
						<div class="information-other ">
							<div class="row">
								<div class="col-6">
									<div class="information-like">
										<div class="like">
											<p>
											<a href="javascript:void(0);" id="liker" data-count="${lProduct.like}" data-fpc="481" data-id="${lProduct.proid}">Thích</a>
											<i class="fa fa-thumbs-up" id="cyli481" aria-hidden="true">&nbsp;${lProduct.like}</i></p>
										</div>
										
									</div>
								</div>
								
								<div class="col-6">
									<div class="unlike">
											<p>
											<a href="javascript:void(0);" id="unliker" data-count="${lProduct.dislikes}" data-fpc="482" data-id="${lProduct.proid}">Không Thích</a>
											<i class="far fa-thumbs-down" id="cyli482"  aria-hidden="true">&nbsp;${lProduct.dislikes}</i></p>
									</div>
								</div>
							</div>
							
						</div>
						
						<div class="information-chu-de-tuong-tu">
							<div class="title">
								<h2>Chủ Đề Tương Tự</h2>
							</div>
							<div class="bai-viet-chu-de-tuong-tu row">
							<c:forEach var="item" items="${lProducttieude }">
								<div class="col-3 row">
									<a href=""><div class="title-image col-12" >
										<img src="<c:url value="/resources/images/${item.image}" />" style="width: 100%" alt="">
									</div>
									<div class="lop">
										<div class="username col-12">
											<p class="user">${item.username}</p>
											<p>${item.title}</p>
										</div>
									</div>
								</a>
								</div>
							</c:forEach>	
								
						
								
							</div>
							

						</div>
						<div class="information-tag row">
							<div class="title-tag col-1">
								<h6>Tags:</h6>
							</div>
							<div class="tags col-11">
							<c:forEach var="item" items="${tagtheoproid }">
								<span><a href="">${item.tagname}</a></span>
							</c:forEach>
							</div>
						</div>	
						
				</div>
				<div class="col-4">
				    <div class="col-12">
				<!-- CATEGORY -->
						<div class="title-menu-home">
							<h3>
								<i class="fas fa-list-ul"></i> CHUYÊN MỤC
							</h3>
						</div>
						<div class="row">
						 <c:forEach var="item" items="${lCategory }">
								<div class="col-12 home-cate">
									<div class="home-cate-title">
										<a href="#"><i class="fas fa-ellipsis-v"></i> <c:out
									value="${item.ctgname }"></c:out> &nbsp;&nbsp; <span>[&nbsp;<c:out
										value="${item.sumproduct }"></c:out> &nbsp;]
										</span></a>
									</div>
								</div>
							</c:forEach>		
						</div>
						<!-- END CATEGORY -->

						<!-- TOP POST -->
						<div class="title-menu-home">
							<h3>
								<i class="far fa-clipboard"></i> TOP BÀI VIẾT
							</h3>
						</div>
						<div class="row">
						<c:forEach var="item" items="${lPostUser }">						
								<div class="col-12 home-post">
									<div class="home-post-title">
										<a href="/open4um/post/${item.proid }"><i class="far fa-file"></i> <c:out value="${item.title }"></c:out> </a>
									</div>
									<div class="home-post-author">
										<a href="#"><i class="fas fa-user"></i> <c:out
									value="${item.username }" /></a> - <c:out value="${item.time }"></c:out>
										trước
									</div>
									<div class="home-post-info">
										<div>
											<i class="far fa-thumbs-up"></i><c:out value="${item.like }" />

										</div>
										<div>
											<i class="far fa-eye"></i><c:out value="${item.views }" />
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- END TOP POST -->

						<!-- NEW POST -->
						<div class="title-menu-home">
							<h3>
								<i class="far fa-clipboard"></i> BÀI VIẾT MỚI
							</h3>
						</div>
						<div class="row">	
						<c:forEach var="item" items="${lNewPostUser }">					
								<div class="col-12 home-post">
									<div class="home-post-title">
										<a href="/open4um/post/${item.proid }"><i class="far fa-file"></i> Apple Watch SE chính thức: Sử dụng chip S5, giá 279 đô
										</a>
									</div>
									<div class="home-post-author">
										<a href="#"><i class="fas fa-user"></i>  <c:out
									value="${item.username }" /></a> - <c:out value="${item.time }"></c:out>
										trước
									</div>
									<div class="home-post-info">
										<div>
											<i class="far fa-thumbs-up"></i><c:out value="${item.like }" />

										</div>
										<div>
											<i class="far fa-eye"></i><c:out value="${item.views }" />
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- END NEW POST -->
					</div>
				    </div>

		    </div>
		    
		  </div>
		</div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script>
 $( document ).ready(function(){

	
		 $("body").on("click", "#liker", function() {
		     var t = $(this).data("id"),
		         a = $(this).attr("data-count"),
		         f = $(this).data("fpc");
		     a++;
		     
		     $("#cyli" + f).text(a);
		     $(this).attr('id', 'liker2');
		     $(this).attr('data-count', a);
		     $(this).text("Thích").css('color', 'blue');
		    
		     var contextPath = "<%=request.getContextPath()%>";
		     console.log(contextPath)
		     $.ajax({
		         type: "GET",
		         url: contextPath + "/like1?idpost=" + t,
		         success: function(t) {
		        	 
		         }
		     });
		 });


		 $("body").on("click", "#liker2", function() {
		     var t = $(this).data("id"),
		         a = $(this).attr("data-count"),
		         f = $(this).data("fpc");
		     a -= 1;
		     $("#cyli" + f).text(a);
		     $(this).attr("id", "liker");
		     $(this).attr('data-count', a);
		     $(this).text('Thích').css('color', '#354F52');
		     var contextPath = "<%=request.getContextPath()%>";
		     $.ajax({
		     type: "GET",
		     url: contextPath + "/like2?idpost=" + t,
		     success: function(t) {
		    	
		     }
		     })
		});
		 
	 
		 $("body").on("click", "#unliker", function() {
		     var id = $(this).data("id"),
		         data = $(this).attr("data-count"),
		         f1 = $(this).data("fpc");
		     data++;
		     
		     $("#cyli" + f1).text(data);
		     $(this).attr('id', 'unliker2');
		     $(this).attr('data-count', data);
		     $(this).text("Không Thích").css('color', 'blue');
		    
		     var contextPath = "<%=request.getContextPath()%>";
		     console.log(contextPath)
		     $.ajax({
		         type: "GET",
		         url: contextPath + "/dislike1?idpost=" + id,
		         success: function(id) {
		        	
		         }
		     });
		 });


		 $("body").on("click", "#unliker2", function() {
		     var id = $(this).data("id"),
		     	data = $(this).attr("data-count"),
		         f1 = $(this).data("fpc");
		     data -= 1;
		     $("#cyli" + f1).text(data);
		     $(this).attr("id", "unliker");
		     $(this).attr('data-count', data);
		     $(this).text('Không Thích').css('color', '#354F52');
		     var contextPath = "<%=request.getContextPath()%>";
		     $.ajax({
		     type: "GET",
		     url: contextPath + "/dislike2?idpost=" + id,
		     success: function(id) {
		    	 
		     }
		     })
		});
		 
	
	 
		 
		 
 
	 
 })
 
 </script>