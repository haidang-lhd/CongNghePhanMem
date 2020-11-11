<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- @Author: 응이아 -->


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<section>
	<div class="container">

		<div class="row section-content">
			<div class="col-md-2 menu-left">
				<ul>
					<li><a href="/open4um/forum/thaoluanchung/news/"><i class="fa fa-globe"></i> </a> <a href="/open4um/forum/thaoluanchung/news/">Tin
							Tức CNTT </a></li>

					<li><a href="/open4um/forum/thaoluanchung/jobs/"><i class="fa fa-laptop"></i> </a> <a href="/open4um/forum/thaoluanchung/jobs/">Nghề
							Nghiệp</a></li>

					<li><a href="/open4um/forum/kienthuc/nmlt/"><i class="fa fa-book"></i> </a> <a href="/open4um/forum/kienthuc/nmlt/">Nhập
							Môn Lập Trình</a></li>

					<li><a href="/open4um/forum/kienthuc/ktlt/"><i class="fab fa-free-code-camp"></i> </a> <a
						href="/open4um/forum/kienthuc/ktlt/">Kĩ Thuật Lập trình</a></li>
				</ul>
			</div>

			<div class="col-md-7 content-middle">
				<div class="content-middle-icon">
					<div class="menu-home">
						<div>
							<a href="/open4um/forum/"><i class="fa fa-home" aria-hidden="true"></i></a>
						</div>
						<div>
							<a href="#" onclick="menuquick()" ><i class="fa fa-caret-square-o-down"
								aria-hidden="true"></i></a>
						</div>
					</div>
				</div>
				<div class="homepage">
					<h2>OPEN4UM.vn</h2>
				</div>
				<div class="list-content">
					<ul class="list-category" id="searchresult">
<!-- Counter -->
<%--  	<%
		Integer hit = (Integer) application.getAttribute("hitCounter");
		if (hit == null || hit == 0)
			hit = 1;
		else
			hit += 1;
		application.setAttribute("hitCounter", hit);
		out.print("hitCounter" + hit);
	%>  --%>
						<c:forEach var="list" items="${listCategory}">
							<li>
								<div class="category-title">
									<a href="${list.url}">${list.ctgname}</a>
								</div>
								<div class="post">
									<c:forEach var="listpro" items="${listProduct}">
										<!-- if (ctgid.categoryname  = ctgid.product ) -->
										<c:if test="${list.ctgid == listpro.ctgid}">
											<div class="row row-post">
												<div class="col-md-2 icon-post">
													<i class="fa fa-comments" style="font-size: 40px;"></i>
												</div>

												<div class="col-md-10 title-post">
													<div class="name-post">
														<a href="/open4um/forum/${listpro.proid}/${list.ctgname}">${listpro.title}</a>
													</div>
													<div class="count-post">
														<span>Lượt xem: ${listpro.views} </span>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>

			<div class="col-md-3 menu-right">
				<div class="register">
					<a href="/open4um/login">
						<button>Đăng ký</button>
					</a>
				</div>

				<div class="exciting">
					<h5>HẤP DẪN TRONG TUẦN</h5>
					<div class="list-exciting-post">
						<ul> 
						<c:forEach var="list" items="${listCategory}">
							<c:forEach var="listexc" items="${listExciting}">
								<c:if test="${list.ctgid == listexc.ctgid}">
									<li>
										<div>
											<div>
												<a href="/open4um/forum/${listexc.proid}/${list.ctgname}"> <img
													src="<c:url value="/resources/images/${listexc.image}" />" alt="">
												</a>
											</div>
											<div>
												<a href="/open4um/forum/${listexc.proid}/${list.ctgname}"> <span>${listexc.title} </span>
												</a>
											</div>
										</div>
									</li>
								</c:if>
							</c:forEach>
						</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
	<script src="<c:url value="/resources/js/forum.js" />"></script>
	
