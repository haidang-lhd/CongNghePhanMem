<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test = "${pageContext.request.userPrincipal.name != null}">
	<input type="hidden" value="${pageContext.request.userPrincipal.name}" id="userid" />
</c:if>
    <div class="container bg-white mt-4 p-2">
        <div class="row">
            <div class="col-md-12 text-center"><h3>Nạp tiền</h3></div>
        </div>
        <div class="row">
            <div class="col p-0">
                <div class="post-comment">
                    <div class="col-md-12">
                        <div class="mb-2 text-secondary"><i class="fas fa-wallet"></i> Tài khoản hiện tại của bạn: <span class="text-info" id="user_money"></span></div>
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">VNĐ</span>
                          </div>
                          <input type="number" class="form-control" placeholder="Nhập số tiền cần nạp" id="id_money_account">
                          <button class="btn btn-info ml-1" type="submit" onclick="addMoney()">Nạp</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script src="<c:url value="/resources/js/nap.js" />"></script>