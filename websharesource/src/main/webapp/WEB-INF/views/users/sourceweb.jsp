<!-- @author Ha Thi Bich Chi --> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%
	//String contextPath =pageContext.getRequest().getServletContext();
String contextPath = request.getContextPath();

%>                                           


<c:if test = "${pageContext.request.userPrincipal.name != null}">
	<input type="hidden" value="${pageContext.request.userPrincipal.name}" id="userid" />
</c:if>

<div class="container">
	<div class="row info-home">

		<c:choose>
			<c:when test="${pageContext.request.userPrincipal.name != null}">
				<div class="col-xl-3 text-center">
					<img src="<c:url value='/resource/images/no-img.png' />" class="avatar-home" id="id_user_img" />
				</div>
				<div class="col-xl-3">
					<div>
						<div class="item-info-home" id="id_user_money"></div>  <div>VNĐ</div>
					</div>
				</div>
				<div class="col-xl-3">
					<div class="item-info-home" id="id_user_post"></div> <div>Bài viết</div>
				</div>
				<div class="col-xl-3">
					<div class="item-info-home" id="id_user_like"></div> <div>Thích</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="text-center" style="width: 100%; color: var(--mau4);">
					<h1>OPEN4UM</h1>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
        <!-- <div class="row panel-info-home">
            <div class="col-xl-4 text-center">
                <div class="panel-info-item">
                    <i class="far fa-clipboard"></i> Đăng bài viết
                </div>
            </div>
            <div class="col-xl-4 text-center">
                <div class="panel-info-item">
                    <i class="fas fa-edit"></i> Sửa hồ sơ
                </div>
            </div>
            <div class="col-xl-4 text-center">
                <div class="panel-info-item">
                    <i class="fas fa-cart-plus"></i> Nạp tiền
                </div>
            </div>
        </div> -->

        <div class="row wrap-panel-source">
            <div class="col-xl-2 text-center">
               <div class="item-panel-source">
				<div>
					<img src="<c:url value="/resources/images/upload-source.png"/>"
						alt="Upload source" class="img-upload-source" /><br />
						<a href="/open4um/category1" style="text-decoration: none!important">UPLOAD SOURCE</a> 
					
				</div>
			</div>
            </div>
            <div class="col-xl-5 text-center">
                <div class="item-panel-source">
                    <div>
                       <a style="text-decoration: none!important" href="<%=contextPath%>/sourceweb"><img src="<c:url value="/resources/images/source-game.png"/>" alt="Upload source" class="img-upload-source" /><br/> SOURCE WEB</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-5 text-center">
                <div class="item-panel-source">
                    <div>
                         <a style="text-decoration: none!important" href="<%=contextPath%>/sourcegame"><img src="<c:url value="/resources/images/source-web.png"/>" alt="Upload source" class="img-upload-source" /><br/> SOURCE GAME</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- TOP SOURCE -->
        <div class="row">
            <div class="col-xl-12">
                <!-- END TOP SOURCE -->

                <!-- NEW SOURCE -->
                <div class="title-menu-home-center">
                    <h3><i class="fas fa-laptop-code"></i> SOURCE MỚI NHẤT</h3>
                </div>
                <div class="row">
                <c:forEach var="listSource" items="${listSource}">
                    <div class="col-xl-3 col-md-6 post-source-item" >
                        <div class="img-post-source" >
                           <img src="<c:url value="/resources/images/${listSource.avatar}"/>" style="width: 100%" />
                            <div class="cate-post-source"><i class="far fa-file-archive"></i>${listSource.ctgname}</div>
                        </div>
                        <div class="content-post-source"><a href="/open4um/source/${listSource.sourceid}/${listSource.ctgname}">${listSource.sourcename}</a></div>
                        <div class="info-post-source">
                            <div class="info-post-source-left"><i class="fas fa-eye"></i> 435</div>
                            <div class="info-post-source-right"><i class="fas fa-cloud-download-alt"></i> 15</div>
                        </div>
                       
                        
                    </div>
                 </c:forEach>
			 </div>
                <div class="row">
                    <div class="col-12">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <c:forEach var = "item" begin = "1" end = "${count}">
                                <li class="page-item" ><a class="page-link" href="${pageContext.request.contextPath}/sourceweb/<c:out value = '${item}'/>"><c:out value = "${item}"/></a></li>
                               </c:forEach>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a> 
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>

            <!-- END NEW SOURCE -->

            
        </div>
    </div>
<script src="<c:url value="/resources/js/download.js" />"></script>