const id_user = document.getElementById("userid").value;
let urlz = window.location.href.split("open4um");
window.onload = function () {
    if(id_user != "") {
        loadMoney();
        loadPost();
    }
}

function loadMoney() {
    fetch(urlz[0] + 'open4um/api/info-user', {
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
			document.getElementById("id_user_img").src = urlz[0] + "open4um" + data.avatar;        
        })
        .catch(error => console.error(error));
}

function loadPost(){
    fetch(urlz[0] +'open4um/api/info-user-post', {
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