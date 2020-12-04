<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <div class="container bg-white mt-4 p-2">
        <div class="row">
            <div class="col-md-12 pl-4 pt-2 pb-2"><h5><i class="fas fa-bars"></i> Tạo chuyên mục</h5></div>
        </div>
        <div class="row">
            <div class="col">
                <form action="<c:url value="/admin/category/add"/>" method="post">
                    <div class="form-group">
                    	<div class="pb-2">
                    		<label for="formGroupExampleInput">Tên chuyên mục</label>
                        	<input type="text" class="form-control" id="ctgname" name="ctgname" placeholder="Nhập tên chuyên mục" value="${cate}">
                    	</div>
                        <label for="formGroupExampleInput">Chuyên mục cha</label>
                        <select class="form-control" name="parentid">
                        	<c:forEach var="item" items="${list}">
                        		<c:choose>
								    <c:when test="${item.ctgid == ctgid}">
								        <option value="${item.ctgid}" selected="selected">${item.ctgname}</option>
								    </c:when>    
								    <c:otherwise>
								        <option value="${item.ctgid}">${item.ctgname}</option>
								    </c:otherwise>
								</c:choose>
							</c:forEach>
                        </select>
                        <div class="text-center pt-3">
                            <button type="submit" class="btn btn-primary">Thêm chuyên mục</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
    <script src="<c:url value="/resources/js/category.js" />"></script>