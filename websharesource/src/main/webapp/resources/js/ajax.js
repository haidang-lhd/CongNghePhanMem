//doi mau duyet hay chua duyet
//author:Toan
var s = $('.duyet').text();
	var a = document.querySelectorAll(".duyet");
	for(var i = 0 ; i < a.length ; ++i){
		if(a[i].textContent === "Đã Duyệt"){
			a[i].style.color = "green";
		}else{
			a[i].style.color = "red";
		}
	}
	
//checkAll 	 admin/quanlybaiviet/list/#
//author:Toan
	$("#checkAll").change(function () {
	    $("input:checkbox.cb-element").prop('checked', $(this).prop("checked"));
	});
	$(".cb-element").change(function () {
	        _tot = $(".cb-element").length                        
	        _tot_checked = $(".cb-element:checked").length;
	 
	        if(_tot != _tot_checked){
	            $("#checkAll").prop('checked',false);
	        }
	});
	$("#checkAll1").change(function () {
	    $("input:checkbox.cb-element1").prop('checked', $(this).prop("checked"));
	});
	$(".cb-element1").change(function () {
	        _tot = $(".cb-element1").length                        
	        _tot_checked = $(".cb-element1:checked").length;
	 
	        if(_tot != _tot_checked){
	            $("#checkAll1").prop('checked',false);
	        }
	});
	$("#checkAll2").change(function () {
	    $("input:checkbox.cb-element2").prop('checked', $(this).prop("checked"));
	});
	$(".cb-element2").change(function () {
	        _tot = $(".cb-element2").length                        
	        _tot_checked = $(".cb-element2:checked").length;
	 
	        if(_tot != _tot_checked){
	            $("#checkAll2").prop('checked',false);
	        }
	});
//	nut selection
	$('#doaction').on("click",function(){
		var test = $('#bulk-action-selector-top').val();
		
	});
//chua duyet da duyet
	
	function chuaduyet() {
		  document.getElementById("trangthai").innerHTML = "Chưa Duyệt";
		  document.getElementById("trangthai").style.color = "red";
		  document.getElementById("trangthai").style.fontWeight = "700";
		}
		function daduyet() {
		  document.getElementById("trangthai").innerHTML = "Đã Duyệt";
		  document.getElementById("trangthai").style.color = "green";
		  document.getElementById("trangthai").style.fontWeight = "700";
		}
			
		
		
//Het author:Toan	
//panigation admin/quanlybaiviet/list/#
	var table = "#mytable"
		$('#maxRows').on('change',function(){
			$('.pagination').html('')
			var trnum = 0
			var maxRows = parseInt($(this).val())
			var totalRows = $(table+' tbody tr').length
			$(table+' tr:gt(0)').each(function(){
				trnum++
				if(trnum > maxRows) {
					$(this).hide()
				}
				if(trnum <= maxRows) {
					$(this).show()
				}
			})
			if(totalRows > maxRows) {
				var pagenum = Math.ceil(totalRows/maxRows) 
				for(var i=1;i<=pagenum;){
					$('.pagination').append('<li data-page="'+i+'">\<span>'+ i++ +'<span class="sr-only">(current)</span></span>\</li>').show()
					}
				}
			$('.pagination li:first-child').addClass('active')
			$('.pagination li').on('click',function(){
				var pageNum = $(this).attr('data-page')
				var trIndex = 0;
				$('.pagination li').removeClass('active')
				$(this).addClass('active')
				$(table+' tr:gt(0)').each(function(){
						trIndex++
						if(trIndex > (maxRows*pageNum)|| trIndex <=((maxRows*pageNum)-maxRows)){
							$(this).hide()
						}else{
							$(this).show()
						}
					})
				})
			})
			$(function(){
				$('table tr:eq(0)').prepend('<th>ID</th>')
				var id= 0;
				$('table tr:gt(0)').each(function(){
					id++
					$(this).prepend('<td>'+id +'</td>')
					
				})
				
			})
				
	var table1 = "#mytable1"
		$('#maxRows1').on('change',function(){
			$('.pagination1').html('')
			var trnum1 = 0
			var maxRows1 = parseInt($(this).val())
			var totalRows1 = $(table1+' tbody tr').length
			$(table1+' tr:gt(0)').each(function(){
				trnum1++
				if(trnum1 > maxRows1) {
					$(this).hide()
				}
				if(trnum1 <= maxRows1) {
					$(this).show()
				}
			})
			if(totalRows1 > maxRows1) {
				var pagenum1 = Math.ceil(totalRows1/maxRows1) 
				for(var i=1;i<=pagenum1;){
					$('.pagination1').append('<li data-page="'+i+'">\<span>'+ i++ +'<span class="sr-only">(current)</span></span>\</li>').show()
					}
				}
			$('.pagination1 li:first-child').addClass('active')
			$('.pagination1 li').on('click',function(){
				var pageNum1 = $(this).attr('data-page')
				var trIndex1 = 0;
				$('.pagination1 li').removeClass('active')
				$(this).addClass('active')
				$(table1+' tr:gt(0)').each(function(){
						trIndex1++
						if(trIndex1 > (maxRows1*pageNum1)|| trIndex1 <=((maxRows1*pageNum1)-maxRows1)){
							$(this).hide()
						}else{
							$(this).show()
						}
					})
				})
			})
			$(function(){
				$('table1 tr:eq(0)').prepend('<th>ID</th>')
				var id= 0;
				$('table1 tr:gt(0)').each(function(){
					id++
					$(this).prepend('<td>'+id +'</td>')
					
				})
				
			})
			var table2 = "#mytable2"
		$('#maxRows2').on('change',function(){
			$('.pagination2').html('')
			var trnum2 = 0
			var maxRows2 = parseInt($(this).val())
			var totalRows2 = $(table2+' tbody tr').length
			$(table2+' tr:gt(0)').each(function(){
				trnum2++
				if(trnum2 > maxRows2) {
					$(this).hide()
				}
				if(trnum2 <= maxRows2) {
					$(this).show()
				}
			})
			if(totalRows2 > maxRows2) {
				var pagenum2 = Math.ceil(totalRows2/maxRows2) 
				for(var i=1;i<=pagenum2;){
					$('.pagination2').append('<li data-page="'+i+'">\<span>'+ i++ +'<span class="sr-only">(current)</span></span>\</li>').show()
					}
				}
			$('.pagination2 li:first-child').addClass('active')
			$('.pagination2 li').on('click',function(){
				var pageNum2 = $(this).attr('data-page')
				var trIndex2 = 0;
				$('.pagination1 li').removeClass('active')
				$(this).addClass('active')
				$(table2+' tr:gt(0)').each(function(){
						trIndex2++
						if(trIndex2 > (maxRows2*pageNum2)|| trIndex2 <=((maxRows2*pageNum2)-maxRows2)){
							$(this).hide()
						}else{
							$(this).show()
						}
					})
				})
			})
			$(function(){
				$('table2 tr:eq(0)').prepend('<th>ID</th>')
				var id= 0;
				$('table2 tr:gt(0)').each(function(){
					id++
					$(this).prepend('<td>'+id +'</td>')
					
				})
				
			})
//  author:Toan  ajax
  tinymce.init({
            selector: '#contentPost',
            min_height: 500,
            plugins: 'paste image link autolink lists table media',
            menubar: false,
            toolbar: [
                'undo redo | bold italic underline strikethrough | numlist bullist | alignleft aligncenter alignright | forecolor backcolor | table link image media',
            ],
        });
 $('#datepost').datetimepicker({
            format: 'Y-m-d H:i:s',
            timepicker: false,
            mask: true
        })

$('.thatim').on("click",function(){
	console.log('ok');
});
 