const id_user = document.getElementById("userid").value;
let url = window.location.href.split("open4um");
window.onload = function() {
	
	if(id_user != "") {
        loadMoney();
        loadPost();
    }
	
	loadDownload();
}

function loadDownload(){
	var arr = window.location.href.split("/");
	fetch(url[0] + 'open4um/api/history-download', {
		method: 'POST',
		body: JSON.stringify({
			username: id_user,
			sourceid: arr[arr.length - 2]
		}),
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(response => response.json())
		.then(data => {
			if(data.result == true)
				document.getElementById("id_download_source").innerHTML = "<a href='" + url[0] + "open4um/download/" + arr[arr.length - 2] + "' class='btn2 button-down bold'>DOWNLOAD</a>";
			else {
				if(data.money >= data.price)
					document.getElementById("id_download_source").innerHTML = "<button class='btn button-down bold' style='color: #fff;' onclick='chooseBuy()'>MUA SOURCE</button>";
				else
					document.getElementById("id_download_source").innerHTML = "<button class='btn button-down bold' style='color: #fff;' onclick='buySource()'>MUA SOURCE</button>";
			}
		})
		.catch(error => console.error(error));
}

function chooseBuy(){
	var str = "<div></div>";
	str += "<button class='btn p-2' style='background-color: #52796f;; border: none; color: #fff; margin-right: 10px;'><a href='/open4um/download/buy/" + arr[arr.length - 2] + "' style='color: #fff;'>Mua bằng tiền trong tài khoản</a></button>";
	str += "<button class='btn p-2' style='background-color: #A50064; border: none; color: #fff;' onclick='buySource()'>Thanh toán momo</button>";
	document.getElementById("id_download_more").innerHTML = str;
}

function buySource(){
	var arr = window.location.href.split("/");
	console.log(arr[arr.length - 2]);
	fetch(url[0] + 'open4um/api/download', {
		method: 'POST',
		body: JSON.stringify({
			username: id_user,
			sourceid: arr[arr.length - 2]
		}),
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(response => response.json())
		.then(data => {
			document.getElementById("id_download_more").innerHTML = "Thêm"
			window.location = data.link;
		})
		.catch(error => console.error(error));
}

function loadMoney() {
    fetch(url[0] + 'open4um/api/info-user', {
            method: 'POST',
            body: id_user,
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => response.json())
        .then(data => {
			if(data.money != null){
				document.getElementById("id_user_money").innerHTML = "<i class='fas fa-wallet'></i> " + data.money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "</div>";
			}else{
				document.getElementById("id_user_money").innerHTML = "<i class='fas fa-wallet'></i> " + 0 + "</div>";
			}
			console.log(data.avatar);
			document.getElementById("id_user_img").src = url[0] + "open4um" + data.avatar;        
        })
        .catch(error => console.error(error));
}

function loadPost(){
    fetch(url[0] +'open4um/api/info-user-post', {
            method: 'POST',
            body: id_user,
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => response.json())
        .then(data => {
            document.getElementById("id_user_post").innerHTML += "<i class='far fa-clipboard'></i> " + data.post + "</div>";
            document.getElementById("id_user_like").innerHTML += "<i class='far fa-thumbs-up'></i> " + data.like + "</div>";
        })
        .catch(error => console.error(error));
}

