<!-- @author Ha Thi Bich Chi --> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//String contextPath =pageContext.getRequest().getServletContext();
String contextPath = request.getContextPath();
%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.title-menu-home {
    font-size: 20px;
    margin-top: 15px;
    margin-bottom: 15px;
}
.title-menu-home-center {
    font-size: 20px;
    margin-top: 15px;
    text-align: center;
    margin-bottom: 15px;
    border-bottom: 1px solid var(--mau2);
}

.title-menu-home h3,
.title-menu-home-center h3 {
    font-size: 20px;
    border-bottom: 3px solid var(--mau5);
    display: inline-block;
    padding: 5px 5px;
    margin-bottom: 25px;
}
.post_item {
    width: 100%;
    margin-bottom: 25px;
}

.post_source {
    width: 100%;
    position: relative;
    overflow: hidden;
    border-top-right-radius: 10px;
}

.post_source img {
    width: 100%;
    transition: all 0.5s;
}

.post_source img:hover {
    opacity: 0.5;
    transform: scale(1.2);
}

.content_source {
    display: flex;
    text-align: center;
    justify-content: center;
    align-items: center;
    height: 82px;
    overflow: hidden;
    padding: 5px 10px;
    border-left: 1px solid var(--mau2);
    border-right: 1px solid var(--mau2);
}

.cate-post-source {
    padding: 2px 10px;
    font-weight: bold;
    text-align: center;
    position: absolute;
    top: 10px;
    left: 10px;
    color: var(--mau3);
    background: #fff;
    border-radius: 20px;
}

.content_source a {
    color: var(--mau5);
    transition: color .5s;
    text-align: left;
    font-weight: 500;
}

.content_source a:hover {
    color: var(--mau3);
    text-decoration: none;
}

.info_source {
    text-align: center;
    background: var(--mau5);
    color: #fff;
    padding: 5px 10px;
    display: flex;
    margin-bottom: 10px;
    border-bottom-left-radius: 10px;
}

.source_left {
    width: 50%;
    text-align: left;
}

.source_right {
    width: 50%;
    text-align: right;
}

</style>
<div class="container">
 <div class="row info-home">

		<c:choose>
			<c:when test="${user.status == 'active'}">
				<div class="col-xl-3 text-center">
					<img
						src="<c:url value="/resources/images/${user.avatar }" />"
						class="avatar-home" />
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
						<a href="/open4um/category1">UPLOAD SOURCE</a> 
					
				</div>
			</div>
            </div>
            <div class="col-xl-5 text-center">
                <div class="item-panel-source">
                    <div>
                         <a href="<%=contextPath%>/sourceweb"><img src="<c:url value="/resources/images/source-game.png"/>" alt="Upload source" class="img-upload-source" /><br/> SOURCE WEB</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-5 text-center">
                <div class="item-panel-source">
                    <div>
                     <a  href="<%=contextPath%>/sourcegame"><img src="<c:url value="/resources/images/source-web.png"/>" alt="Upload source" class="img-upload-source" /><br/> SOURCE GAME</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- TOP SOURCE -->
        <div class="row">
            <div class="col-xl-12" id="id_source">
                <!-- END TOP SOURCE -->

                <!-- NEW SOURCE -->
                <div class="title-menu-home-center">
                    <h3><i class="fas fa-laptop-code"></i> TOP SOURCE 
                    </h3>
                </div>
            <div class="row">
				<c:forEach var="item" items="${listSourceTag}">
					<div class="col-md-4 post_item">
						<div class="post_source">
							<img src="<c:url value="/resources/images/${item.avatar}"/>" />
							<!-- <div class="cate-post-source">
								<i class="far fa-file-archive"></i> Game
							</div> -->
						</div>
						<div class="content_source">
							<a href="/open4um/source/${item.sourceid }/${item.ctgname}"> <c:out
									value="${item.sourcename }" />
							</a>
						</div>
						<div class="info_source">
							<div class="source_left">
								<i class="fas fa-eye"></i>
								<c:out value="${item.views }" />
							</div>
							<div class="source_right">
								<i class="fas fa-cloud-download-alt"></i>
								<c:out value="${item.dowloads }" />
							</div>
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
                                <li class="page-item" ><a class="page-link" href="${pageContext.request.contextPath}/tag/${chothong}/<c:out value = '${item}'/>"><c:out value = "${item}"/></a></li>
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
               
		 </div>
    </div>
    
