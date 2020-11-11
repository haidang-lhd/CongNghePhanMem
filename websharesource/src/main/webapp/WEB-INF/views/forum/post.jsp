<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test = "${pageContext.request.userPrincipal.name != null}">
	<input type="hidden" value="${pageContext.request.userPrincipal.name}" id="userid" />
</c:if>
<div class="container bg-white">
        <div class="row">
            <div class="col">
                <div class="post-menu-category" id="id_post_category"><a href="<c:url value='/'/>" class="item-post-menu-category">Trang chủ</a></div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="post-title">
                    <h2 id="id_post_title"></h2>
                </div>
            </div>
        </div>
        
        <div class="row wrap-post-info">
            <div class="col-sm-1 text-center">
                <img src="<c:url value='/'/>" class="post-img-avatar" id="id_post_avatar">
            </div>
            <div class="col-sm-11">
                <div class="post-info">
                    <div>
                        <a href="#" id="id_user_post"></a> <i class="fas fa-check-circle"></i>
                    </div>
                    <div id="id_post_date"></div>
                    
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <div class="post-content" id="id_post_content"></div>
            </div>
        </div>
		
		<div id="id_post_details"></div>
        
         <div class="row">
            <div class="col text-center pb-2">
            	<div  id="show-comment" onclick="loadComment()">Hiện bình luận</div>
       		</div>
    	</div>
        
        <div id="post-content">
        	
        </div>
    </div>
	<script src="<c:url value="/resources/js/post.js" />"></script>