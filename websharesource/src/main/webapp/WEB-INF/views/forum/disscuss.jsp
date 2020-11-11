<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- @Author: 응이아 -->


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>

<c:if test = "${pageContext.request.userPrincipal.name != null}">
	<input type="hidden" value="${pageContext.request.userPrincipal.name}" id="userid" />
</c:if>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-xl-2 left">
                    <div class="top-left">
                        <h2>Cộng đồng thảo luận</h2>
                    </div>
    
                    <div class="bottom-left">
                        <div>
                            <a href="#">
                                <i class="fa fa-comments"></i>
                                <span>Thảo Luận</span>
                            </a>
                        </div>

                        <div>
                            <a href="#">
                                <i class="fa fa-info-circle" ></i>
                                <span>Thông tin</span>
                            </a>
                        </div>
                        <div>
                            <a href="#">
                                <i class="fa fa-newspaper-o" ></i>
                                <span>Tin tức</span>
                            </a>
                            <p>3745</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-7 mid">
                    <div class="search" style="display: none;">
                        <input type="search" placeholder="Input Search">
                        <div>
                            <i class="fa fa-search"></i>
                        </div>
                    </div>
                    <div class="post" id="postid">
                        <div class="place">
                            <div>
                                <textarea id="post-status" rows="3" cols="50" placeholder="Status không friend ?"></textarea>
                                <div>
                                    <img src="<c:url value="/resources/images/avartarnone.png"/>" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="frames-post" id="frames-postid" style="display: none;">
                        <div class="title">
                            <h5>Tạo bài chia sẽ</h5>
                        </div>
                        <div class="frames-infor">
                                <img src="<c:url value="/resources/images/avartarnone.png"/>" alt="">
                               <c:choose>
									<c:when test="${pageContext.request.userPrincipal.name != null}">
										<c:out value="${pageContext.request.userPrincipal.name}" />
									</c:when>
									<c:otherwise>
										<a href="/open4um/login">DANG NHAP</a>
									</c:otherwise>
								</c:choose>
                        </div>

                        <form method="POST" action="/open4um/insertPosts/" enctype="multipart/form-data" >
                            <div class="frames-content">
                                <textarea  name="textarea-frames" cols="40" rows="5" placeholder="Viết nội dung bạn muốn chia sẽ vào đây nè ^^"></textarea>
                                <div>
                                    <!-- <div id="images-title">
                                        <img class="images-title" src="<c:url value="/resources/images/butchi.png"/>" alt="">
                                    </div> -->
                                    
                                    <div>
                                        <select name="title" id="title">
                                            <option value="0">Chọn chủ đề</option>
                                            <option value="3">Tin Tức CNTT</option>
                                            <option value="4">Nghề Nghiệp</option>
                                            <option value="6">Nhập Môn Lập Trình</option>
                                            <option value="7">Kĩ Thuật Lập trình</option>
                                          </select>
                                    </div>
                                    
                                </div>
                            </div>
                        
                            <div class="button-images">
                                <span>Thêm ảnh</span>
                                <label for="inputimages" style="float: right;">
                                    <i class="fa fa-picture-o" aria-hidden="true">Ảnh</i>
                                </label>
                                <input type="file" id="inputimages" name="inputimage" multiple="multiple" style="display: none;">
                            </div></br>
                            <div class="button-post">
                                <button onclick="btposts()"> Đăng Bài</button>
                            </div>
                        </form>
                    </div>
       <!-- foreach -->
                  <c:forEach var="list" items="${Listposts}">
                    <div class="posts" id="posts" style="margin-top: 15px;">
                        <div class="header-posts">
                            <div>
                                <div class="avatar">
                                    <a href="#"><img src="<c:url value="/resources/images/avatar.jpg"/>" alt=""></a>
                                </div>
                                <div class="name-time">
									<a href="#"><p>${list.username}</p></a>                   		
                                   	<span>${list.time}</span>
                                </div>
                            </div>
                        </div>
                        <div class="content-posts">
                            <div class="content">
                                <span>
                                    ${list.content} </br>
                                </span>
                            </div>
                        </div>
                        <div class="images-posts">
                            <div class="images">
                                <img src="<c:url value="${list.image}"/>" alt="">
                            </div>
                        </div>

                        <div class="button-posts">
                             <div class="like" id="like-${list.proid }" onclick="updatelike(${list.proid})">
                                <i class="fa fa-heart"></i>
                               <span id="resultlike-${list.proid}">  ${list.like} Thích</span>
                            </div>
                            <div class="comment">
                                <i class="fa fa-commenting-o"></i>
                                <span onclick="callData(${list.proid})"> Bình luận</span>
                            </div>
                            <div class="share" style="display: none;">
                                <i class="fa fa-share"></i>
                                <span>1 Chia sẽ</span>
                            </div>
                        </div>
                        <div id="post-content-${list.proid}"></div>
                    </div>
                </c:forEach>
                
<!-- foreach -->
                </div>
                <div class="col-xl-3 right">
                    <div class="exciting">
                        <h5> Có thể bạn quan tâm</h5>
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

</div> 
</div>
    <script src="<c:url value="/resources/js/diss_know.js" />"></script>
