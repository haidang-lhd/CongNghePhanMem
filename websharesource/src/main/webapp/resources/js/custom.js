$(document).ready(function() {
    loadCategory();
});

function loadDataSource(id) {
	fetch(url[0] + 'open4um/api/get-category', {
		method: 'POST',
		body: id,
		headers: {
			'Content-Type': 'application/json',
		}
	})
		.then(response => response.json())
		.then(data => {
			return data;
		})
		.catch(error => console.error(error));

}

function loadCategory(){
	 $.ajax({
        type : 'GET',
		dataType: 'json',
        url : "/open4um/api/showCate/",
        success : function(data) {
			//$("#menu").html(loadDataCategory(data));
			//$("#ctgname").val(data[0].ctgname);
			loadDataCategory(data);
		}     
	});
}
function loadDataCategory(data){
	var item = "";
	$.each(data, function(index, value){
		item += "<li><a href='/open4um/category/" + value.ctgid + " '>"  + value.ctgname + "</a></li>";
	})
	
	document.getElementById("id_menu_category").innerHTML = item;
}
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      $('#previewHolder').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  } else {
   
    $('#previewHolder').attr('src', '');
$('#imgpencil').attr('src', '');
$('#imgpencil').css('opacity', '0');
  }
}

$("#inputimage").change(function() {
  readURL(this);
});
