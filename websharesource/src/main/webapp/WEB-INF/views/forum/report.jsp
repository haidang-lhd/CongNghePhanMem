<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test = "${pageContext.request.userPrincipal.name != null}">
	<input type="hidden" value="${pageContext.request.userPrincipal.name}" id="userid" />
</c:if>
<div class="container bg-white">
	<div class="row">
		<div class="col-md-12 text-center pt-2">
			<h3 id="id_user_report">Báo cáo</h3>
		</div>
	</div>
	
	<div class="row" id="id_report_content">
		<div class="col p-0">
			<div class="post-comment" id="id_report_content_name"></div>
		</div>
	</div>
	
	<div class="row" id="id_report_content">
		<div class="col p-0">
			<div class="post-comment">
				<textarea rows="6" placeholder="Nhập lý do" class="input-comment" id="id_user_report_content"></textarea>
				<button class="btn-comment" onclick="addReport()">
					<i class="fas fa-paper-plane"></i>
				</button>
			</div>
		</div>
	</div>
</div>
<script src="<c:url value="/resources/js/report.js" />"></script>