<!-- @author Ha Thi Bich Chi -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	//String contextPath =pageContext.getRequest().getServletContext();
String contextPath = request.getContextPath();
 
%>
 
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<style>
a{text-decoration: none!important;}
.dt-max-img {
	width: 100%;
}

.fa.fa-star {
	color: var(--mau2);
}
.fa.fa-star.checked{
	color: var(--mau4);
}
.button-orange {
	background: #ff8401;
	border: 1px solid #ff8401;
	color: #fff;
	border-radius: 5px;
	text-align: center;
	text-decoration: none !important;
}

.line {
	height: 1px;
	background: url(../resources/images/line.jpg);
}

.dt-price {
	font-size: 19px;
	padding-top: 10px;
	padding-bottom: 5px;
}

.dt-pri-btn {
	padding: 15px 0px;
}

.button-small {
	padding: 8px 11px;
}

.dt-download {
	line-height: 60px;
	margin: 15px 0px;
}

.button-down {
	font-size: 16px;
	white-space: nowrap;
	padding: 15px 27px;
	background: #84c52c;
	border: 1px solid #84c52c;
	border-radius: 5px;
}

.btn2 {
	color: #fff;
	font-weight: bold;
}

.dt-des {
	margin: 15px 0px;
	line-height: 23px;
}

.aorange {
	color: #ff8401;
}

.dt-col {
	width: 95px;
	float: left;
	clear: both;
	color: #cebda2;
}

.dt-box-title {
	font-size: 16px;
	border-radius: 4px 4px 0px 0px;
	padding: 10px 30px;
	display: inline-block;
	color: #fff;
	background: #ff8401;
}

.dt-box {
	border: 1px solid #ff8401;
	padding: 30px 15px;
	border-radius: 0px 4px 4px 4px;
}

.btn-txt {
	font-size: 18px;
	float: left;
}

.page-heading {
	height: 41px;
	border-bottom: 1px solid #e2d8c7;
	line-height: 40px;
	position: relative;
	font-size: 24px;
}

.page-heading span.page-heading-title {
	border-bottom: 3px solid #84c52c;
	position: absolute;
	bottom: -1px;
	padding: 5px 12px;
	font-weight: bold;
	text-transform: uppercase;
	font-size: 20px;
}

.view-product-list {
	margin-top: 20px;
	position: relative;
}

.dt-down2 {
	background-color: #f4f0e2;
	border-radius: 5px;
	overflow: hidden;
	padding: 20px 0px;
	border-left: 17px solid #8c6635;;
	border-right: 17px solid #8c6635;;
}

.button-down2 {
	font-size: 16px;
	white-space: nowrap;
	padding: 25px 58px 55px;
	background: #84c52c;
	border: 1px solid #84c52c;
	display: inherit;
	margin-top: 10px;
	border-radius: 5px;
}

.rating {
	float: left;
	width: 300px;
}

.rating span {
	float: right;
	position: relative;
}

.rating span input {
	position: absolute;
	top: 0px;
	left: 0px;
	opacity: 0;
}

.rating span label {
	display: inline-block;
	width: 30px;
	height: 30px;
	text-align: center;
	color: #ddd;
	background: #fff;
	font-size: 10px;
	margin-right: 2px;
	line-height: 30px;
}

.rating span:hover ~ span label, .rating span:hover label, .rating span.checked label,
	.rating span.checked ~ span label {
	background: #fff;
	color: #ff8401;
}

.col-sm-4 {
	width: 100%;
	position: relative;
	overflow: hidden;
	border-top-right-radius: 10px;
}

.img-border {
	position: relative;
	padding: 10px;
	border: 1px solid #e2d8c7;
	border-radius: 7px;
	margin: auto;
	width: 232px;
	height: 174px;
}

.dt-title {
	font-size: 28px;
	line-height: 25px;
	display: inline;
}

.bold {
	font-weight: bold;
}

.title_detail {
	color: #7e592a;
}

.dt-sta-vie {
	padding-top: 14px;
	padding-bottom: 4px;
}

.dt-sta-vie2 {
	padding-top: 14px;
	padding-bottom: 10px;
	color: #ff8401;
}

.dt-vie-ic {
	padding-left: 15px;
	margin-left: 4px;
}

.text-nowrap {
	margin-left: 4px;
}

i.fas.fa-pen {
	padding: 0 4px;
}

.button-down2 .btn-txt {
	text-align: center;
	font-size: 18px;
	width: 104px;
	float: left;
	margin-top: -10px;
}

.col-xl-8 {
    margin-top: 16px;
}
.dt-same {
    line-height: 28px;
    margin: 20px -12px;
}
.dt-same a {
	margin: 0 4px 0 10px;
    font-size: 15px;
    background: #cbf592;
    padding: 5px 0px;
    border-radius: 5px;
    color: #648d03;
    display: block;
    text-decoration: none;
    text-align: center;
}
a.btn2.button-down.bold {
    text-decoration: none;
}
a.btn2.button-down.bold:hover {
    color: #418f0d;

}
.button-small:hover{
color: #e34201;
}
a{
text-decoration: none;
}
.dt-same a:hover {
	margin: 0 4px 0 10px;
    color: #84c52c;
    text-decoration: none;
    transition: all 0.25s;
}
.dt-same a:hover {
    background: #84c52c;
    color: #fff;
}
.dt-tag {
    background: #f0ecdd;
    padding: 5px 15px;
    white-space: nowrap;
    border-radius: 4px;
    margin-right: 5px;
    border: 1px solid #8C6635; 
    
}
a.dt-tag {
 color: #8C6635;
 text-decoration: none;
 text-align: center;
 
}
a.dt-tag:hover{
color: #84c52c;
text-decoration: none;
transition: all 0.25s;
}
.col-xl-8 {
	margin-top: 16px;
}
/* component */
.star-rating {
    display: flex;
    flex-direction: row-reverse;
    font-size: 30px;
    justify-content: center;
    text-align: center;
}

.star-rating input {
	display: none;
}

.star-rating label {
	color: #ccc;
	cursor: pointer;
}

.star-rating :checked ~ label {
	color: var(--mau2);
}

.star-rating label:hover, .star-rating label:hover ~ label {
	color: var(--mau4);
}

/* explanation */
article {
	background-color: #ffe;
	box-shadow: 0 0 1em 1px rgba(0, 0, 0, .25);
	color: #006;
	font-family: cursive;
	font-style: italic;
	margin: 4em;
	max-width: 30em;
	padding: 2em;
}
.danhgia {
    display: flex;
    justify-content: center;
    margin-bottom: 50px;
}
.star-ratingg > div {
padding: 2px 0;}
.btn-warning{
color: #fff;
background-color: var(--mau4);
border-color: var(--mau4);
}
.btn-warning:hover{
color: var(--mau5);
background-color: var(--mau1);
border-color: var(--mau1);
}
.dt-vie-ic {
    background: url(../resources/images/eyes.png) no-repeat 0px 3px;
    padding-left: 15px;
}
a{
text-decoration: none!important;
}
a.dt-tag {
    padding: 10px 13px;
    display: inline-block;
    margin-bottom: 5px;
}
</style>


<c:if test = "${pageContext.request.userPrincipal.name != null}">
	<input type="hidden" value="${pageContext.request.userPrincipal.name}" id="userid" />
</c:if>
<div class="container">

	<div class="row info-home">

		<c:choose>
			<c:when test="${pageContext.request.userPrincipal.name != null}">
				<div class="col-xl-3 text-center">
					<img src="" class="avatar-home" id="id_user_img" />
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



	<div class="row wrap-panel-source">
		<div class="col-xl-2 text-center">
			<div class="item-panel-source">
				<div class="img_menu">
					<img src="<c:url value="/resources/images/upload-source.png"/>"
						alt="Upload source" class="img-upload-source" /><br /> <a
						href="/open4um/category1">UPLOAD SOURCE</a>
				</div>
			</div>
		</div>
		<div class="col-xl-5 text-center">
			<div class="item-panel-source">
				<div class="list_source">
					<a href="<%=contextPath%>/sourceweb"><img
						src="<c:url value="/resources/images/source-game.png"/>"
						alt="Upload source" class="img-upload-source" /><br /> SOURCE
						WEB</a>
				</div>
			</div>
		</div>
		<div class="col-xl-5 text-center">
			<div class="item-panel-source">
				<div class="list_source">
					<a href="<%=contextPath%>/sourcegame"><img
						src="<c:url value="/resources/images/source-web.png"/>"
						alt="Upload source" class="img-upload-source" /><br /> SOURCE
						GAME</a>
				</div>
			</div>
		</div>
	</div>

	<!-- TOP SOURCE -->
	<div class="text-center">
		<h3 class="mt-4 mb-4"
			style="color: var(--mau5); font-weight: 600; text-transform: uppercase;">CHI
			TIẾT SOURCE</h3>
	</div>
	<div class="row">
		<div class="col-xl-1"></div>
		<div class="col-xl-10">
			<div class="row"
				style="border: 1px solid var(--mau2); padding: 50px; margin: 40px 0; border-radius: 5px;">

				<div class="col-sm-4">
					<div class="img-border">
						<img style="width: 100%; left: 0; top: 0; position: absolute;"
							src="<c:url value="/resources/images/${listSourceOne.avatar}"/>">
					</div>
					                           <div class="text-center dt-same">
                                <a href="#code-giong"><span class="hidden-sm">Xem thêm </span><strong>CODE GẦN GIỐNG</strong></a>
                            </div>
                            <div class="dt-help">
                                		<c:forEach var="listTag" items="${listTag}">
                                        <a class="dt-tag" href="/open4um/tag/${listTag.tagid}">${listTag.tagname}</a>
                                        </c:forEach>
                                    
                            </div>
				</div>
				<div class="col-sm-8">
					<h1 class="title_detail" style="font-size: 32px;">${listSourceOne.sourcename}</h1>
					<span class="green bold" style="color: #84c52c;">[Mã code <span
						id="code">${listSourceOne.sourceid}</span>]
					</span>
					<div class="row title5">
						<div class="col-md-8 dt-sta-vie">
						 <c:forEach var = "i" begin = "1" end = "${ avgStart}">
			 				<span class="fa fa-star checked" style=" font-size: 14px;"></span>
			 			</c:forEach>
						  <span class="text-nowrap"
								style="margin-left: 4px;"> <b>
									<c:choose>
									  <c:when test="${avgStart == 0} ">
									  	0 Star
									  </c:when>
									  <c:otherwise>
									    ${avgStart } Star
									  </c:otherwise>
									</c:choose>
								</b> </span> 
								<div
								style="margin-left: 4px;color: #8C6635;display: inline-block;cursor: pointer;" class="clickdanhgia">
								<i class="fas fa-pen "></i>Đánh giá sao</div>
						</div>
						<div class="col-md-4 dt-sta-vie2">
							<i class="fa fa-download"></i><b
								id="mainbody_contentbody_DownloadCount"> ${listSourceOne.dowloads}</b>
							<span class="dt-vie-ic"><b id=""> ${listSourceOne.views}</b></span>
							<span class="text-nowrap"><i class="fa fa-heart"
								aria-hidden="true"></i> <b>1</b></span>
						</div>
					</div>
					<div class="line"></div>
					<div class="row">
						<div class="col-sm-9 dt-price">
							<span class="bold">Phí tải: <span>${listSourceOne.price}</span> VNĐ</span>
						</div>
						<div class="col-sm-3 dt-pri-btn">
							<a class="button-orange button-small" href=""><i
								class="fa fa-heart line-h20" aria-hidden="true"></i><span
								class="hidden-sm"> YÊU THÍCH</span></a>
						</div>
					</div>
					<div class="line"></div>
					<div class="row">
						<div class="col-md-7 dt-des">
							<div class="dt-col">Danh mục</div>
							<div itemprop="material">
								<a href="" class="aorange">${listSourceOne.ctgname}</a>
							</div>
							<div class="dt-col">Ngày đăng</div>
							<div id="mainbody_contentbody_Date2">${listSourceOne.date}</div>
							<div class="dt-col">Loại file</div>
							<div id="mainbody_contentbody_Type2">Full code</div>
							<div class="dt-col">Dung lượng</div>
							<div id="">${listSourceOne.title} MB</div>
						</div>
						<div class="col-md-5 dt-download" id="id_download_source"></div>
						<div id="id_download_more"></div>

					</div>
					<div class="line"></div>

				</div>
			</div>
			<div class="">
                    </div>
			<div>
				<span class="dt-box-title bold">MÔ TẢ CHI TIẾT</span>
				<div class="dt-box entry-detail">
					<p>${listSourceOne.contentdetails}</p>
				</div>
			</div>
			<div class="clear" style="height: 40px;">&nbsp;</div>
			<div class="col-md-12 dt-down">

				<div class="text-center">
					<h3 class="mt-4 mb-4 danhgiaa"
						style="color: var(--mau5); font-weight: 600; text-transform: uppercase;">đánh
						giá</h3>
				</div>

				<div class="danhgia">
<div class="tbdanhgia" style="
    width: 20%;
    border-right: 1px solid var(--mau2);
    margin-right: 10px;
    text-align: center;
">
	     <div class="numberStart" style="font-size: 60px;font-weight: 500;">${ avgStart}</div>
	   <!--   <div class="numberStart" style="font-size: 60px;font-weight: 500;">${ sourceid}</div> -->
			 <c:forEach var = "i" begin = "1" end = "${ avgStart}">
			 	<span class="fa fa-star checked" style=" font-size: 30px;"></span>
			 </c:forEach>
</div>
	<div class="star-ratingg">
	 <c:forEach var="item" items="${lRating}" varStatus="loop">
    			    <c:if test = "${item.ratevalue == 1}">
     					 <div  class="_sao">
			      			<span class="fa fa-star checked"></span>
							<span class="fa fa-star "></span> 
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span><b> <c:out value="${item.quantityStart }"></c:out> </b></span>
    			   		 </div>
  					</c:if>
  					<c:if test = "${item.ratevalue == 2}">
		     			<div  class="_sao">
			      			<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span> 
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span><b> <c:out value="${item.quantityStart }"></c:out> </b></span>
		    			</div>
  					</c:if>
  					<c:if test = "${item.ratevalue == 3}">
     					 <div  class="_sao">
      			    <span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span> 
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star "></span>
				<span class="fa fa-star "></span>
				<span><b> <c:out value="${item.quantityStart }"></c:out> </b></span>
    			   		</div>
  					</c:if>
  					<c:if test = "${item.ratevalue == 4}">
     					 <div  class="_sao">
      			    <span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span> 
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star "></span>
				<span><b> <c:out value="${item.quantityStart }"></c:out> </b></span>
    			   		</div>
  					</c:if>
  					<c:if test = "${item.ratevalue == 5}">
     					 <div  class="_sao">
      			    <span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span> 
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span><b> <c:out value="${item.quantityStart }"></c:out> </b></span>
    			   		</div>
  					</c:if>
			    </c:forEach>
	</div>
				</div>
				<div class="vietdanhgia" style="color: var(--mau5);font-weight: 600;font-size:16px;text-transform: uppercase;text-align: center;background-color: var(--mau1);padding: 5px;cursor: pointer;border-radius: 5px;">Đánh Giá Sao</div>
				 <div style="
    border: 1px solid var(--mau4);
    border-radius: 5px;
    text-transform: uppercase;
    padding: 50px;
    margin-top: 50px;
    display:none;
" id="boxSlide">
				 <h6 style="
    text-align: center;
">Sản phẩm đạt số sao</h6>
				<form action="/open4um/rating/add" id="star-ratinggg" method="POST">
				  <div class="star-rating">
					  <input type="radio" id="5-stars" name="ratevalue" value="5" />
					  <label for="5-stars" class="star">&#9733;</label>
					  <input type="radio" id="4-stars" name="ratevalue" value="4" />
					  <label for="4-stars" class="star">&#9733;</label>
					  <input type="radio" id="3-stars" name="ratevalue" value="3" />
					  <label for="3-stars" class="star">&#9733;</label>
					  <input type="radio" id="2-stars" name="ratevalue" value="2" />
					  <label for="2-stars" class="star">&#9733;</label>
					  <input type="radio" id="1-star" name="ratevalue" value="1" />
					  <label for="1-star" class="star">&#9733;</label>
				</div>
				<div class="nddanhgia" style="
    text-align: center;
">
					<!-- <textarea rows="5" cols="3" name="ratename" class="form-control" placeholder="Hãy chia sẽ về sản phẩm này nhé."></textarea> -->
					<button type="submit" onclick="redirectRating()" class="btn btn-warning mt-4">Gửi đánh giá</button>
				</div> 
				<input type="hidden"  name="sourceid" value="${ sourceid}">
				<input type="hidden" id="url"  name="url">
				</form> 
				 </div>
			</div>

			<div class="title-menu-home-center">
				<h3>
					<i class="fas fa-laptop-code"></i> SOURCE GẦN GIỐNG
				</h3>
			</div>
			<div class="row">
				<c:forEach var="item" items="${listSourceTheSame}">
					<div class="col-xl-4 col-md-6 post-source-item">
						<div class="img-post-source">
							<img src="<c:url value="/resources/images/${item.avatar}"/>" />
							<!-- <div class="cate-post-source">
								<i class="far fa-file-archive"></i> Game
							</div> -->
						</div>
						<div class="content-post-source">
							<a href="/open4um/source/${item.sourceid }/${item.ctgname}">
								<c:out value="${item.sourcename}" />
							</a>

						</div>
						<div class="info-post-source">
							<div class="info-post-source-left">
								<i class="fas fa-eye"></i>
								<c:out value="${item.views}" />
							</div>
							<div class="info-post-source-right">
								<i class="fas fa-cloud-download-alt"></i>
								<c:out value="${item.dowloads}" />
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>
		<div class="col-xl-1"></div>
	</div>
</div>
</div>
<script src="<c:url value="/resources/js/download.js" />"></script>
<script>
	$(document).ready(function() {
		// Check Radio-box
		$(".rating input:radio").attr("checked", false);

		$('.rating input').click(function() {
			$(".rating span").removeClass('checked');
			$(this).parent().addClass('checked');
		});

		$('input:radio').change(function() {
			var userRating = this.value;
		});
		
		
		$(".vietdanhgia").click(function(){
			console.log("ok");
		    $("#boxSlide").slideToggle("fast");
		  });
		$('.clickdanhgia').click(function() {
		    $('html, body').animate({
		        scrollTop: $(".danhgiaa").offset().top
		    }, 1000);
		});
		let urlRating =  window.location.href;
		$("#url").val(urlRating);
		 
	});
</script>
