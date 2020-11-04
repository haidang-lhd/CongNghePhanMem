<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test = "${pageContext.request.userPrincipal.name != null}">
	<input type="hidden" value="${pageContext.request.userPrincipal.name}" id="userid" />
</c:if>
    <div class="container bg-white mt-4 p-2">
        <div class="row">
            <div class="col-md-10 pl-4 pt-2 pb-2"><h5><i class="fas fa-bars"></i> Chuyên mục</h5></div>
            <div class="col-md-2 pt-2"><button class="btn btn-primary"><a href="<c:url value="/admin/category/add"/>" style="color: #fff"><i class="fas fa-folder-plus"></i> Thêm</a></button></div>
        </div>
        <div class="row">
          <div class="col" id="id_category_content"></div>
        </div>

    </div>
<script src="<c:url value="/resources/js/category.js" />"></script>