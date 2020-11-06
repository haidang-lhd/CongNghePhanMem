function getId(id){
	 $.ajax({
        type : 'GET',
		dataType: 'json',
		data: {
			userid: id
		},
        url : "/open4um/api/dataUser/",
        success : function(data) {
			$("#userid").val(data[0].userid);
			$("#username").val(data[0].username);
			$("#phone").val(data[0].phone);
			$("#email").val(data[0].email);
			$("#role").val(data[0].roleaccount_name);
			$("#status").val(data[0].status);
			$("#myModal").modal();
			
        }
	});
}

function myFunction(){
 $.ajax({
	type : 'GET',
	dataType: 'json',
	data: {
		 "username" : $("#username1").val()
	},
    url : "/open4um/api/search/",
    success : function(data) {
		//console.log(JSON.stringify(data));
		$("#form-user").html(loadData(data));
		 var user = JSON.parse(JSON.stringify(data));
		$("userid").val(user[0].userid);
		$(".username1").val(user[0].username);
		$(".phone").val(user[0].phone);
		$(".email").val(user[0].email);
		$(".role").val(user[0].roleaccount_name);
		$(".status").val(user[0].status);	
    }
});
};

function loadData(data){
	var str = "<form>";
		str += "<table style='width: 90%; margin-left: 20px; margin-top: 20px; font-size: 13px' class='table table-bordered table-striped'>";
		str += "<tr>"
		str += "<th>User Name</th>"
		str += "<th>Phone</th>";
		str += "<th>Email</th>";
		str += "<th>Role</th>";
		str += "<th>Money</th>";
		str += "<th>Status</th>";
		str += "<th></th>";
		str += "</tr>";
		$.each(data, function(index, value){
			str += "<tr>";
			str += "<td><input style='padding: 10px;' name='username' value='" + value.username + "'></td>";
			str += "<td><input style='padding: 10px;' name='phone' value='" + value.phone + "'></td>";
			str += "<td><input style='padding:10px;' name='email' value='" + value.email + "'></td>";
			str += "<td><input style='padding: 10px;' name='roleaccount_name' value='" + value.roleaccount_name + "'></td>";
			str += "<td><input style='padding:10px;' name='money' value='" + value.money + "'></td>";
			str += "<td><input style='padding:10px;' name='status' value='" + value.status + "'></td>";
			str += "<td>";
			str += "<button type='button' class='btn btn-default btn-lg' id='myBtn'>";
			str += "<a onclick='getId(" + value.userid + ")' class='btn-edit'>Edit</a>";
			str += "</button>";
			str += "</td>";
			str += "</tr>";
			str += "</form>";
		});
	return str;
}