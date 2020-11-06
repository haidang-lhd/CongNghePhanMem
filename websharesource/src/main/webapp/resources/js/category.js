const id_user = document.getElementById("userid").value;
window.onload = function() {
	loadCategory();
}
let url = window.location.href.split("open4um");
let arr =  window.location.href.split("/");
function loadCategory() {
	
	fetch(url[0] + 'open4um/api/categoryAll', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(response => response.json())
		.then(data => {
			console.log(data);
			showCategory(data);
		})
		.catch(error => console.error(error));
}

function showCategory(data){
    let str = "<table class='table' style='width: 100%;'>";
            str += "<tr>";
            str += "<th scope='col' class='text-center'>Chuyên mục</th>";
            str += "<th scope='col' class='text-center'>Ngày tạo</th>";
            str += "<th scope='col' class='text-center'>Chuyên mục cha</th>";
            str += "<th scope='col' class='text-center' colspan='2'></th>";
            str += "</tr>";
    data.forEach(item => {
        str += "<tr>";
            str += "<td class='text-center'>" + item.ctgname + "</td>";
            str += "<td class='text-center'>" + item.ctgdate + "</td>";
            str += "<td class='text-center'>" + item.parent +"</td>";
            str += "<td class='text-center'>";
                str += "<a href='/open4um/admin/category/edit/" + item.ctgid + "'><i class='fas fa-edit'></i></a>";
            str += "</td>";
            str += "<td class='text-center'>";
                str += "<a href='/open4um/admin/category/delete/" + item.ctgid + "'><i class='fas fa-trash'></i></a>";
            str += "</td>";
        str += "</tr>";
    });
    str += "</table>";
    document.getElementById("id_category_content").innerHTML = str;
}