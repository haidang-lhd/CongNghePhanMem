/*
// Thanh menu chinh
$("#test").click(function(e){
	//console.log($("#test").css)
	console.log($("#container").css("left"));
		  	if($("#container").css("left") == "0px"){  //
		  		console.log('11111');
		  		$("#container").css("left","-800px");
		  	}else{
		  		console.log('22222');
		  		$("#container").css("left","0");
		  	}
		  	console.log('33333');
		  });


// nut menu cac bang user bai viet  report
const nut1 = document.getElementById("nut1");
const nut2 = document.getElementById("nut2");
const xoxuong = document.getElementById("xoxuong");

nut1.addEventListener("click", function(event) {
	nut1.style.display = "none";
	nut2.style.display = "block";
	xoxuong.style.display = "none";
})

nut2.addEventListener("click", function(event) {
	nut2.style.display = "none";
	nut1.style.display = "block";
	xoxuong.style.display = "block";
})



const nut3 = document.getElementById("nut3");
const nut4 = document.getElementById("nut4");
const xoxuong1 = document.getElementById("xoxuong1");

nut3.addEventListener("click", function(event) {
	nut3.style.display = "none";
	nut4.style.display = "block";
	xoxuong1.style.display = "none";
})

nut4.addEventListener("click", function(event) {
	nut4.style.display = "none";
	nut3.style.display = "block";
	xoxuong1.style.display = "block";
})


const nut5 = document.getElementById("nut5");
const nut6 = document.getElementById("nut6");
const xoxuong2 = document.getElementById("xoxuong2");

nut5.addEventListener("click", function(event) {
	nut5.style.display = "none";
	nut6.style.display = "block";
	xoxuong2.style.display = "none";
})

nut6.addEventListener("click", function(event) {
	nut6.style.display = "none";
	nut5.style.display = "block";
	xoxuong2.style.display = "block";
})
*/
tinymce.init({
	selector: '#contentPost',
	height: 200,
	plugins: 'paste image link autolink lists table media',
	menubar: false,
	toolbar: [
		'undo redo | bold italic underline strikethrough | numlist bullist | alignleft aligncenter alignright | forecolor backcolor | table link image media',],
});
$('#datepost').datetimepicker({
	format: 'd/m/Y',
	timepicker: false,
	mask: true
})