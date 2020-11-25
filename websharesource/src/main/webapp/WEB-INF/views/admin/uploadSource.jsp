<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%
	//String contextPath =pageContext.getRequest().getServletContext();
String contextPath = request.getContextPath();
%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
.u_image {
	width: 200px;
	height: 150px;
	background: url(<%=contextPath%>/resources/images/avatar.png) no-repeat;
	border-radius: 3px;
	float: left;
	position: relative;
	overflow: hidden;
	margin-right: 40px;
}
</style>
 <script src="https://cdn.tiny.cloud/1/nvcjgcn990ymxkqqams0ahaxrekx09iwdmoo6kryaz3xyasn/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
 <script type="text/javascript">
  tinymce.init({
    selector: '#myTextarea',
    width: 600,
    height: 300,
    plugins: [
      'advlist autolink link image lists charmap print preview hr anchor pagebreak',
      'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
      'table emoticons template paste help'
    ],
    toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | ' +
      'bullist numlist outdent indent | link image | print preview media fullpage | ' +
      'forecolor backcolor emoticons | help',
    menu: {
      favs: {title: 'My Favorites', items: 'code visualaid | searchreplace | emoticons'}
    },
    menubar: 'favs file edit view insert format tools table help',
    content_css: 'css/content.css'
  });
  </script>

</head>

<body>
	<div class="box-bg">
		<div class="upload_form">
			<h1 class="title3 bold text-center up-title">UPLOAD CODE CHIA SẺ
				& KIẾM TIỀN CÙNG TINHTE.VN</h1>
			<div class="up-note hidden-xs">
				<form id="contactForm" action="<c:url value ="/insertsource"/>" method="POST" enctype="multipart/form-data">
					<div class="up-box">
						<div id="mainbody_contentbody_contentpage_panDefaultButton"
							onkeypress="javascript:return WebForm_FireDefaultButton(event, &#39;mainbody_contentbody_contentpage_btnUpload&#39;)">
							<div class="form-horizontal">
								<div class="form-group"></div>
									<div class="form-group">
										<label class="col-md-2 control-label bold">TIÊU ĐỀ CODE
											<span class="text-error">*</span>
										</label>
										<div class="col-md-7">
										
											<input name="sourcename" type="text" maxlength="200"
											id="mainbody_contentbody_contentpage_txtTitle"
											class="form-control" onblur="ValidateTitle()"
											placeholder="Tối thiểu 20 kí tự" /> 
											
											<span
											class="glyphicon glyphicon-ok form-control-feedback success-ic"
											aria-hidden="true" id="successTitle"></span>
											
										</div>
										<div class="col-md-3 note-col">
											<div class="form-control-static">
											<span id="title_error" class="text-error "></span> <span
												class="text-nowrap title5">Quyết định 80% SEO <span
												data-toggle="tooltip" data-placement="top"
												title="Tiêu đề tối thiểu 20 kí tự, Tiêu đề cần chứa 'Từ khóa' trọng tâm, tiêu đề càng hấp dẫn sẽ thu hút nhiều lượt xem."><i
												class="fa fa-info-circle" aria-hidden="true"></i></span></span>
											</div>
										</div>
									</div>
								<div class="form-group">
									<label class="col-md-2 control-label bold">Danh mục <span
										class="text-error">*</span></label>
									<div class="col-md-4">
										<select name="ctgid"
											id="mainbody_contentbody_contentpage_ddlCategoryLang"
											class="form-control" onblur="ValidateCate()"
											onchange="ValidateCate()">
											<option value="">--Chọn danh mục--</option>
										 	<c:forEach var="category" items="${listCategory}">
												<option value="${category.ctgid}">${category.ctgname}</option>
											</c:forEach> 
										</select> <span
											class="glyphicon glyphicon-ok form-control-feedback success-ic3"
											aria-hidden="true" id="successCate"></span>

									</div>
									<div class="col-md-6">
										<div class="form-control-static">
											<span id="lang_error" class="text-error">&nbsp;</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label bold">Mô tả ngắn <span
										class="text-error">*</span></label>
									<div class="col-md-7">
										<textarea name="title" rows="2" cols="20"
											id="mainbody_contentbody_contentpage_txtSubTitle"
											class="form-control up-textarea" onblur="ValidateSub()"
											placeholder="Tối thiểu 70 kí tự" maxlength="200"
											style="height: 60px;">
										</textarea>
										<span
											class="glyphicon glyphicon-ok form-control-feedback success-ic3"
											aria-hidden="true" id="successSub"></span>
									</div>
									<div class="col-md-3 note-col">
										<span id="subdetail_error" class="text-error"></span> <span
											class="text-nowrap title5">Tối ưu từ 70 - 200 kí tự <span
											data-toggle="tooltip" data-placement="top"
											title="Để có thứ hạng cao trên kết quả tìm kiếm bạn cần viết mô tả hấp dẫn về code, chứa từ khóa, những ưu điểm và tính năng...để thu hút người mua"><i
												class="fa fa-info-circle" aria-hidden="true"></i></span></span>&nbsp; <span
											class="text-nowrap orange"><b id="lblcountSubTitle">0</b>
											Kí tự</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label bold">Link
										download <span class="text-error">*</span>
									</label>
									<div class="col-md-7">
										<input type="file" name="size"> <span
											class="glyphicon glyphicon-ok form-control-feedback success-ic"
											aria-hidden="true" id="successLink"></span>
									</div>
									<div class="col-md-3">
										<span id="link_error" class="text-error"></span>
									</div>
								</div>
  <div class="form-group">
                            <label class="col-md-2 control-label bold">Đặt phí tải</label>
                            <div class="col-md-10">
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-warning active" id="lblCheckFree">
                                        <input type="radio" name="options" id="idFree" value="Free" checked>
                                        Miễn phí (0 Xu)
                                    </label>
                                    <label class="btn btn-warning" id="lblCheckCode">
                                        <input type="radio" name="options" id="idCode" value="Code">
                                        Tham khảo (2Xu - 99Xu)
                                    </label>
                                    <label class="btn btn-warning" id="lblCheckCodeOK">
                                        <input type="radio" name="options" id="idCodeOK" value="CodeOK">
                                        Chất lượng (>= 100 Xu)
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" id="boxPrice">
                            <div class="col-sm-6 col-md-offset-2 col-md-4">
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-default dropdown-toggle up-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Chọn <span class="caret"></span></button>
                                        <ul class="dropdown-menu dropdown-menu-left">
                                            <li id="li5">5 Xu</li>
                                            <li id="li10">10 Xu</li>
                                            <li id="li15">15 Xu</li>
                                            <li id="li20">20 Xu</li>
                                            <li id="li40">40 Xu</li>
                                            <li id="li80">80 Xu</li>
                                            <li role="separator" class="divider"></li>
                                            <li id="li100">100 Xu</li>
                                            <li id="li150">150 Xu</li>
                                            <li id="li240">240 Xu</li>
                                            <li id="li400">400 Xu</li>
                                        </ul>

                                    </div>
                                    <input name="price" type="text" maxlength="4" id="mainbody_contentbody_contentpage_txtPriceOther" class="bold form-control" onblur="ValidatePrice()" onkeypress="CheckNumeric(event);" onkeyup="ChangPrice();" placeholder="Tự nhập phí tải" />
                                    <span class="glyphicon glyphicon-ok form-control-feedback success-ic" aria-hidden="true" id="successPrice" style="right: 60px;"></span>
                                    <span class="input-group-addon">Xu <span data-toggle="tooltip" data-placement="top" title="(1 Xu = 1.000 đ) Bạn có thể đặt phí tải tùy ý hoặc chia sẻ miễn phí 0 Xu, Khi code đã được duyệt nếu bạn GIẢM PHÍ TẢI phí tải sẽ được cập nhật ngay nhưng nếu TĂNG GIÁ thì cần chờ BQT kiểm duyệt giá đó! Nếu mức giá >= 100 Xu thì bạn cần cam kết HỖ TRỢ khi người mua liên hệ."><i class="fa fa-info-circle" aria-hidden="true"></i></span></span>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="checkbox" id="boxCheck">
                                    <label class="orange">
                                        <input id="chkCamKet" onchange="ValidatePrice()" value="1" type="checkbox" />
                                        Cam kết hỗ trợ người mua                                        
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-control-static">
                                    <span id="price_error" class="text-error">&nbsp;</span>
                                </div>
                            </div>
                        </div>
							<div class="form-group">
									<label class="col-md-2 control-label bold">Mô tả chi
										tiết <span class="text-error">*</span>
									</label>
									<div class="col-md-10" id="editorDetail">
										<textarea name="contentdetails" rows="2" cols="20"
											id="myTextarea"
											style="height: 200px;"></textarea>
										<span
											class="glyphicon glyphicon-ok form-control-feedback success-ic"
											aria-hidden="true" id="successDetail"></span>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-md-offset-2 col-md-10">
										<div id="listSuggest"></div>
									</div>
								</div>
								 <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <div id="listSuggest"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <textarea class="form-control up-textarea" rows="5" spellcheck="false">
								- Mọi thông tin của thành viên đăng tải trên diễn đàn sharecode.vn phải chính xác.
								- Mọi source code khi upload đã được build phải đảm bảo chạy tốt, mô tả đầy đủ thông tin và đúng như hình ảnh đính kèm.
								- Nội dung file nén đã được kiểm tra, đảm bảo không chứa tệp tin không khả dụng, độc hại, virus hoặc bất cứ liên kết khác...
								- File chứa code có đầy đủ file chạy, thông tin chi tiết về source, hướng dẫn cài đặt và tài khoản đăng nhập chi tiết.
								- Cam kết hỗ trợ hoặc fix lỗi nếu code >= 100Xu (Code chất lượng), khi người mua liên lạc qua email hoặc số điện thoại của bạn.
								- Tất cả source code bị báo cáo vi phạm bản quyền nếu được ban quản trị xác nhận là đúng, source code sẽ bị xóa bỏ.
								- Source code đã upload lên sharecode.vn là thành viên upload đã đồng ý cho phép các thành viên download và sử dụng.
 								</textarea>
                            </div>
                        </div>

								<div class="form-group">
									<div class="col-md-offset-2 col-md-10">
										<div class="checkbox">
											<label id="chkRequireBox" style="border-radius: 4px;">
												<input
												name="ctl00$ctl00$ctl00$mainbody$contentbody$contentpage$chkRequirement"
												type="checkbox"
												id="mainbody_contentbody_contentpage_chkRequirement"
												onchange="ValidateCheck()" value="1" /> <a
												href="/quy-dinh-chung.htm" target="_blank" class="aorange"
												title="Xem thêm điều khoản sử dụng">Tôi đã đọc và đồng ý
													với các điều khoản của Tinhte.vn&nbsp;</a>
											</label> &nbsp;&nbsp;<span id="check_error" class="text-error"
												style="line-height: 20px;">&nbsp;</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-offset-2 col-md-10">
										<span id="upload_error" class="text-error">&nbsp;</span>
									</div>
								</div>
								<br />
								<div class="form-group">
									<div class="col-md-offset-2 col-md-10 line-h">
										<button id="submit" type="submit" value="add" name="action"
											style="color: #d65106; background-color: transparent; background-image: none; border-color: #d65106 !important; font-weight: 600; border: 2px solid transparent; padding: 12px 30px; font-size: 16px; line-height: 1.5; border-radius: .1875rem;">
											Book Table</button> &nbsp;&nbsp; <span class="text-error text-nowrap"
											style="line-height: 40px;">(*) Là các trường bắt buộc
											nhập nội dung</span>
									</div>
								</div>
							</div>

						</div>

					</div>
				</form>

			</div>
		</div>

	</div>



	
    <script type="text/javascript">
        var imgValue = false;
     
        $(function () {
            var jcrop_api;
            $('#FileUpload1').change(function () {
                $('#PopupImage').hide();
                $("#Image1").removeAttr('style');
                $("#Image1").css("display", "none");
                var reader = new FileReader();
                reader.onload = function (e) {
                    // destroy Jcrop if it is existed
                    if (typeof jcrop_api != 'undefined')
                        jcrop_api.destroy();
                    //$('#Image1').show();

                    $('#Image1').attr("src", e.target.result);
                    $('#Image1').Jcrop({
                        onChange: SetCoordinates,
                        onSelect: SetCoordinates,
                        aspectRatio: 4 / 3,
                        setSelect: [0, 0, 200, 150],
                        allowMove: true,
                        boxWidth: 500,
                        boxHeight: 500
                        //minSize: [ 100, 100 ],
                        //maxSize: [ 100, 100 ]

                    }, function () {
                        // Store the Jcrop API in the jcrop_api variable
                        jcrop_api = this;
                    });
                }
                reader.readAsDataURL($(this)[0].files[0]);
                //show loading
                $("#imgLoading").show();
                setTimeout('Showpopup()', 500);//delay 1s
                $(this).val("");
            });

 
            //tag sugget
          
       

            //price
            $('#boxPrice').hide();
            $('#boxCheck').hide();
            $('input:radio[name="options"]').change(
                function () {
                    if (this.checked) {
                        if (this.value == 'Free') {
                            $('#boxPrice').hide();
                            $('#boxCheck').hide();
                            $('input:radio[name="options"][value="Free"]').prop('checked', true);
                        }
                        else if (this.value == 'Code') {
                            $('#boxPrice').show();
                            $('#boxCheck').hide();
                            $('input:radio[name="options"][value="Code"]').prop('checked', true);
                        }
                        else if (this.value == 'CodeOK') {
                            $('#boxPrice').show();
                            $('#boxCheck').show();
                            $('input:radio[name="options"][value="CodeOK"]').prop('checked', true);
                        }
                    }
                });
            $('#li5').click(function () {
                $("#mainbody_contentbody_contentpage_txtPriceOther").val(5);
                ChangPrice();
            });
            $('#li10').click(function () {
                $("#mainbody_contentbody_contentpage_txtPriceOther").val(10);
                ChangPrice();
            });
            $('#li15').click(function () {
                $("#mainbody_contentbody_contentpage_txtPriceOther").val(15);
                ChangPrice();
            });
            $('#li20').click(function () {
                $("#mainbody_contentbody_contentpage_txtPriceOther").val(20);
                ChangPrice();
            });
            $('#li40').click(function () {
                $("#mainbody_contentbody_contentpage_txtPriceOther").val(40);
                ChangPrice();
            });
            $('#li80').click(function () {
                $("#mainbody_contentbody_contentpage_txtPriceOther").val(80);
                ChangPrice();
            });
            $('#li100').click(function () {
                $("#mainbody_contentbody_contentpage_txtPriceOther").val(100);
                ChangPrice();
            });
            $('#li150').click(function () {
                $("#mainbody_contentbody_contentpage_txtPriceOther").val(150);
                ChangPrice();
            });
            $('#li240').click(function () {
                $("#mainbody_contentbody_contentpage_txtPriceOther").val(240);
                ChangPrice();
            });
            $('#li400').click(function () {
                $("#mainbody_contentbody_contentpage_txtPriceOther").val(400);
                ChangPrice();
            });
            //edit
            var price = parseInt($("#mainbody_contentbody_contentpage_txtPriceOther").val(), 10);
            if (price > 99)
                $('#chkCamKet').prop('checked', true);
            ChangPrice();
        });
        function SetCoordinates(c) {
            $('#imgX1').val(c.x);
            $('#imgY1').val(c.y);
            $('#imgWidth').val(c.w);
            $('#imgHeight').val(c.h);
            $('#btnCrop').show();
        };

        //popup image
        function Showpopup() {
            $('#PopupImage').modal('show');
            //hide loading
            $("#imgLoading").hide();
        }

        //close popup image
        $('#btnCancel').click(function (e) {
            $('#PopupImage').modal('hide');
        });
        //Đếm kí tự
        $('#lblcountSubTitle').text($('#mainbody_contentbody_contentpage_txtSubTitle').val().length);
        $('#mainbody_contentbody_contentpage_txtSubTitle').keyup(function () {
            var cs = $(this).val().length;
            $('#lblcountSubTitle').text(cs);
        });

        //Sussget tag
        function SussgetTag() {
            jQuery.ajax({
                type: "POST",
                url: "/Ajax/TagSuggest.aspx/SuggestForTitle",
                data: '{titleCode: "' + jQuery('#mainbody_contentbody_contentpage_txtTitle').val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var list = data.d;
                    var listSuggest = document.getElementById('listSuggest');
                    listSuggest.innerHTML = "";
                    $.each(list, function (index, item) {
                        var newSpan = document.createElement('span');
                        newSpan.setAttribute('class', 'tag-editor-tagadd');
                        newSpan.innerHTML = item;
                        newSpan.onclick = function AddTag() {
                            $('#mainbody_contentbody_contentpage_txtTag').tagEditor('addTag', item);
                            ValidateTag();
                        };
                        listSuggest.appendChild(newSpan);
                    });

                }
            });
        }
        function HideIco() {
            jQuery('#successTitle').hide();
            jQuery('#successLink').hide();
            jQuery('#successImg').hide();
            jQuery('#successCate').hide();
            jQuery('#successSub').hide();
            jQuery('#successTag').hide();
            jQuery('#successDetail').hide();
            jQuery('#successPrice').hide();
            jQuery('#successDemo').hide();
        }
        function ValidateTitle() {
            var kt = true;
            jQuery('#title_error').html('');
            jQuery('#mainbody_contentbody_contentpage_txtTitle').removeClass('validation-failed');
            jQuery('#mainbody_contentbody_contentpage_txtTitle').removeClass('validation-success');
            jQuery('#successTitle').hide();
            var title = jQuery('#mainbody_contentbody_contentpage_txtTitle').val();
            if (title == '') {
                jQuery('#title_error').html('Vui lòng nhập tiêu đề.');
                kt = false;
            }
            else {
                title = title.trim();
                title = title.replace(/\s+/g, ' ');
                jQuery('#mainbody_contentbody_contentpage_txtTitle').val(title);
                if (title.length < 20) {
                    jQuery('#title_error').html('Tiêu đề phải dài hơn 20 kí tự.');
                    kt = false;
                }
                else {
                    jQuery.ajax({
                        type: "POST",
                        url: "/Ajax/GetLinkCode.aspx/CheckCodeName",
                        data: '{codeid: "' + jQuery('#mainbody_contentbody_contentpage_hdCodeId').val() + '",namenew: "' + title + '" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: false,
                        success: function (data) {
                            //alert(data.d);
                            if (data.d == true) {
                                jQuery('#title_error').html('Tiêu đề đã tồn tại.');
                                kt = false;
                            }
                        }
                    });
                }
            }
            if (kt) {
                jQuery('#mainbody_contentbody_contentpage_txtTitle').addClass('validation-success');
                jQuery('#successTitle').show();
                return true;
            } else {
                jQuery('#mainbody_contentbody_contentpage_txtTitle').addClass('validation-failed');
                return false;
            }
        }
        function ValidateLink() {
            var kt = true;
            jQuery('#link_error').html('');
            jQuery('#mainbody_contentbody_contentpage_txtLink').removeClass('validation-failed');
            jQuery('#mainbody_contentbody_contentpage_txtLink').removeClass('validation-success');
            jQuery('#successLink').hide();
            var link = jQuery('#mainbody_contentbody_contentpage_txtLink').val().trim();
            if (link == '') {
                jQuery('#link_error').html('Vui lòng nhập link download.');
                kt = false;
            }
            else if (!(link.indexOf("http://") == 0 || link.indexOf("https://") == 0)) {
                jQuery('#link_error').html('Link phải bắt đầu http://... (or) https://...');
                kt = false;
            }
            if (kt) {
                jQuery('#mainbody_contentbody_contentpage_txtLink').addClass('validation-success');
                jQuery('#successLink').show();
                return true;
            } else {
                jQuery('#mainbody_contentbody_contentpage_txtLink').addClass('validation-failed');
                return false;
            }
        }
        function ValidateDemo() {
            jQuery('#demo_error').html('');
            jQuery('#mainbody_contentbody_contentpage_txtLinkDemo').removeClass('validation-failed');
            jQuery('#mainbody_contentbody_contentpage_txtLinkDemo').removeClass('validation-success');
            jQuery('#successDemo').hide();
            var link = jQuery('#mainbody_contentbody_contentpage_txtLinkDemo').val().trim();
            if (link != '') {
                if (!(link.indexOf("http://") == 0 || link.indexOf("https://") == 0)) {
                    jQuery('#demo_error').html('Link phải bắt đầu http://... (or) https://...');
                    jQuery('#mainbody_contentbody_contentpage_txtLinkDemo').addClass('validation-failed');
                    return false;
                }
                else {
                    jQuery('#mainbody_contentbody_contentpage_txtLinkDemo').addClass('validation-success');
                    jQuery('#successDemo').show();
                    return true;
                }
            }
            return true;
        }
        function ValidateImg() {
            var kt = true;
            jQuery('#img_error').html('');
            jQuery('.u_image').removeClass('validation-failed');
            jQuery('.u_image').removeClass('validation-success');
            jQuery('#successImg').hide();

            if (($('#mainbody_contentbody_contentpage_imgUpdateCode').attr('src') == '' || $('#mainbody_contentbody_contentpage_imgUpdateCode').attr('src') == null) && imgValue == false) {
                jQuery('#img_error').html('Vui lòng chọn ảnh đại diện.');
                kt = false;
            }

            if (kt) {
                jQuery('.u_image').addClass('validation-success');
                jQuery('#successImg').show();
                return true;
            } else {
                jQuery('.u_image').addClass('validation-failed');
                return false;
            }
        }
        function ValidateCate() {
            var kt = true;
            jQuery('#lang_error').html('');
            jQuery('#mainbody_contentbody_contentpage_ddlCategoryLang').removeClass('validation-failed');
            jQuery('#mainbody_contentbody_contentpage_ddlCategoryLang').removeClass('validation-success');
            jQuery('#successCate').hide();
            var lang = jQuery('#mainbody_contentbody_contentpage_ddlCategoryLang').val();
            if (lang == '0') {
                jQuery('#lang_error').html('Chưa chọn danh mục.');
                kt = false;
            }
            if (kt) {
                jQuery('#mainbody_contentbody_contentpage_ddlCategoryLang').addClass('validation-success');
                jQuery('#successCate').show();
                return true;
            } else {
                jQuery('#mainbody_contentbody_contentpage_ddlCategoryLang').addClass('validation-failed');
                return false;
            }
        }
        function ValidateSub() {
            var kt = true;
            jQuery('#subdetail_error').html('');
            jQuery('#mainbody_contentbody_contentpage_txtSubTitle').removeClass('validation-failed');
            jQuery('#mainbody_contentbody_contentpage_txtSubTitle').removeClass('validation-success');
            jQuery('#successSub').hide();
            var subtitle = jQuery('#mainbody_contentbody_contentpage_txtSubTitle').val();
            if (subtitle == '') {
                jQuery('#subdetail_error').html('Vui lòng nhập mô tả ngắn.');
                kt = false;
            }
            else {
                subtitle = subtitle.trim();
                subtitle = subtitle.replace(/\s+/g, ' ');
                jQuery('#mainbody_contentbody_contentpage_txtSubTitle').val(subtitle);
                if (subtitle.length < 70) {
                    jQuery('#subdetail_error').html('Mô tả ngắn phải dài hơn 70 kí tự.');
                    kt = false;
                }
            }
            if (kt) {
                jQuery('#mainbody_contentbody_contentpage_txtSubTitle').addClass('validation-success');
                jQuery('#successSub').show();
                return true;
            } else {
                jQuery('#mainbody_contentbody_contentpage_txtSubTitle').addClass('validation-failed');
                return false;
            }
        }
        function ValidateTag() {
            var kt = true;
            jQuery('#tag_error').html('');
            jQuery('.tag-editor').removeClass('validation-failed');
            jQuery('.tag-editor').removeClass('validation-success');
            jQuery('#successTag').hide();
            var tag = jQuery('#mainbody_contentbody_contentpage_txtTag').val();
            var count = 0;
            for (var i = 0; i < tag.split(",").length; i++) {
                if (tag.split(",")[i].trim().length != 0)
                    count++;
            }
            if (count < 3) {
                jQuery('#tag_error').html('Nhập tối thiểu 3 từ khóa.');
                kt = false;
            }
            if (kt) {
                jQuery('.tag-editor').addClass('validation-success');
                jQuery('#successTag').show();
                return true;
            } else {
                jQuery('.tag-editor').addClass('validation-failed');
                return false;
            }
        }
        function ValidateDetail() {
            var kt = true;
            jQuery('#upload_error').html('');
            jQuery('#editorDetail span:first').removeClass('validation-failed');
            jQuery('#editorDetail span:first').removeClass('validation-success');
            jQuery('#successDetail').hide();
            if (jQuery("#editorDetail iframe").contents().find("body").text() == '') {
                jQuery('#upload_error').html('Vui lòng nhập mô tả chi tiết.');
                kt = false;
            }
            if (kt) {
                jQuery('#editorDetail span:first').addClass('validation-success');
                jQuery('#successDetail').show();
                return true;
            } else {
                jQuery('#editorDetail span:first').addClass('validation-failed');
                return false;
            }
        }
        function ValidateCheck() {
            var kt = true;
            jQuery('#check_error').html('');
            jQuery('#chkRequireBox').removeClass('validation-failed');

            if (document.getElementById("mainbody_contentbody_contentpage_chkRequirement").checked == false) {
                jQuery('#check_error').html('Vui lòng đọc và đồng ý các điều khoản.');
                kt = false;
            }
            if (kt) {
                return true;
            } else {
                jQuery('#chkRequireBox').addClass('validation-failed');
                return false;
            }
        }
        function ValidatePrice() {
            var kt = true;
            jQuery('#price_error').html('');
            jQuery('#mainbody_contentbody_contentpage_txtPriceOther').removeClass('validation-failed');
            jQuery('#mainbody_contentbody_contentpage_txtPriceOther').removeClass('validation-success');
            jQuery('#successPrice').hide();
            //alert($('input:radio[name="options"]').val());
            if ($('input:radio[name="options"]:checked').val() == 'Free') {
                $('#boxPrice').hide();
                $('#boxCheck').hide();
                return true;
            }
            else {
                var price = jQuery('#mainbody_contentbody_contentpage_txtPriceOther').val();
                if (price == '') {
                    jQuery('#price_error').html('Vui lòng nhập phí tải.');
                    kt = false;
                }
                else if (parseInt(price, 10) < 2) {
                    jQuery('#price_error').html('Phí tải tối thiểu là 2 Xu.');
                    kt = false;
                }
                else if (parseInt(price, 10) > 99 && document.getElementById("chkCamKet").checked == false) {
                    jQuery('#price_error').html('Chưa chọn cam kết hỗ trợ người mua.');
                    kt = false;
                }
            }

            if (kt) {
                jQuery('#mainbody_contentbody_contentpage_txtPriceOther').addClass('validation-success');
                jQuery('#successPrice').show();
                return true;
            } else {
                jQuery('#mainbody_contentbody_contentpage_txtPriceOther').addClass('validation-failed');
                return false;
            }
        }
        //Validate form
        function ValidateUpload() {

            var ktt = true;

            if (!ValidateTag()) {
                ktt = false;
            }
            if (!ValidateCheck()) {
                ktt = false;
            }
            if (!ValidateDetail()) {
                ktt = false;
            }
            //TH tự đặt giá
            if (!ValidatePrice()) {
                jQuery('#mainbody_contentbody_contentpage_txtPriceOther').focus();
                ktt = false;
            }
            if (!ValidateDemo()) {
                ktt = false;
                jQuery('#mainbody_contentbody_contentpage_txtLinkDemo').focus();
            }
            if (!ValidateLink()) {
                ktt = false;
                jQuery('#mainbody_contentbody_contentpage_txtLink').focus();
            }
            if (!ValidateSub()) {
                jQuery('#mainbody_contentbody_contentpage_txtSubTitle').focus();
                ktt = false;
            }
            if (!ValidateCate()) {
                jQuery('#mainbody_contentbody_contentpage_ddlCategoryLang').focus();
                    ktt = false;
                }
                if (!ValidateTitle()) {
                    ktt = false;
                    jQuery('#mainbody_contentbody_contentpage_txtTitle').focus();
            }
            if (!ValidateImg()) {
                jQuery('#FileUpload1').focus();
                ktt = false;
            }
            if (ktt) {
                //jQuery('#mainbody_contentbody_contentpage_btnUpload').addClass('upload_btn UploadSuccess');//hiển thị thông báo thành công
                return true;
            } else {
                if (jQuery('#upload_error').html() == "")
                    jQuery('#upload_error').html('Vui lòng điền thông tin còn thiếu.');
                return false;
            }
        }
        function CheckNumeric(e) {
            if (window.event) // IE 
            {
                if ((e.keyCode < 48 || e.keyCode > 57) & e.keyCode != 8) {
                    event.returnValue = false;
                    return false;
                }
            }
            else { // Fire Fox
                if ((e.which < 48 || e.which > 57) & e.which != 8) {
                    e.preventDefault();
                    return false;
                }
            }

        }
        function ChangPrice() {
            //price change
            var price = parseInt($("#mainbody_contentbody_contentpage_txtPriceOther").val(), 10);
            if (price == 0) {
                $('#boxPrice').hide();
                $('#boxCheck').hide();
                jQuery('#lblCheckFree').addClass('active');
                jQuery('#lblCheckCode').removeClass('active');
                jQuery('#lblCheckCodeOK').removeClass('active');
                $('input:radio[name="options"][value="Free"]').prop('checked', true);

            } else if (price > 0 && price < 100) {
                $('#boxPrice').show();
                $('#boxCheck').hide();
                jQuery('#lblCheckFree').removeClass('active');
                jQuery('#lblCheckCode').addClass('active');
                jQuery('#lblCheckCodeOK').removeClass('active');
                $('input:radio[name="options"][value="Code"]').prop('checked', true);
            }
            else if (price > 99) {
                $('#boxPrice').show();
                $('#boxCheck').show();
                jQuery('#lblCheckFree').removeClass('active');
                jQuery('#lblCheckCode').removeClass('active');
                jQuery('#lblCheckCodeOK').addClass('active');
                $('input:radio[name="options"][value="CodeOK"]').prop('checked', true);
            }
            //alert($('input:radio[name="options"]:checked').val() + "====");
        }
    </script>
</body>


</html>
