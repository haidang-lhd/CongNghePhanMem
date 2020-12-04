<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container bg-white mt-4 p-2">
    <div class="row">
        <div class="col-md-12 pl-4 pt-2 pb-2 text-center"><h5>Xóa chuyên mục</h5></div>
    </div>
    <div class="row">
        <div class="col text-center">
            <div class="p-4">
                <i class="fas fa-exclamation-circle"></i> Cảnh báo: Bạn đang xóa chuyên mục <b class="text-danger">${cate}</b>. Tất cả bài viết thuộc chuyên mục này sẽ mất sau khi xóa!
            </div>
    			<div class="row">
    				<div class="col-xl-6 text-right">
    					<form action="/open4um/admin/category/delete/${ctgid}" method="post">
		            		<button class="btn btn-danger">Xác nhận</button>
		            	</form>
    				</div>
    				<div class="col-xl-6 text-left">
    					<form action="/open4um/admin/category" method="get">
		            		<button class="btn btn-secondary">Hủy</button>
		            	</form>
    				</div>
   				</div>        
        </div>
    </div>

</div>