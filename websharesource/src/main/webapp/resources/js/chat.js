/**
 *  author Thong
 */
let urlT = window.location.href.split("open4um");
$.ajax({
		type: 'GET',
		dataType: "json", 
		url: urlT[0] +"open4um/api/message",
		success : function (data){
      			//console.log(data);
				var str = "";
				str += "<table border='1' width='100%' action='upload'>";
				str += "<thead>";
                str += "<tr>";
                str += "<th>USER NAME</th>";
				str += "<th>Sub</th>";
                str += "<th>DATE</th>";
                str += "</tr>";
				str += "</thead>";
				str += "<tbody id='myTable'>";
				$.each(data, function(key, value) {			
				str += "<tr>";
				str += "<td><a href='boxchat/"+value.senduserid + "'>" + value.sendusername + "</a></td>";
				str += "<td>" + value.content + "</td>";
				str += "<td>" + timeSince(value.datemsg)+ "</td>";
				str += "</tr>";
								});
				str += "</tbody>"				
				str += "</table>"
			$("#listMessage").html(str);
 	}
});
//box message
function timeSince(date) {
	var seconds = Math.floor((new Date() - date) / 1000);
	var interval = seconds / 31536000;
	if (interval > 1) {
		return Math.floor(interval) + " year ago";
	}
	interval = seconds / 2592000;
	if (interval > 1) {
		return Math.floor(interval) + " month ago";
	}
	interval = seconds / 86400;
	if (interval > 1) {
		return Math.floor(interval) + " day ago";
	}
	interval = seconds / 3600;
	if (interval > 1) {
		return Math.floor(interval) + " hour";
	}
	interval = seconds / 60;
	if (interval > 1) {
		return Math.floor(interval) + " minute";
	}
	return Math.floor(seconds) + " second";
}
//creat message
function creatTable() {
  var x = document.getElementById("tab-creat");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
//Search
$(document).ready(function(){
  $("#search-chat").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});