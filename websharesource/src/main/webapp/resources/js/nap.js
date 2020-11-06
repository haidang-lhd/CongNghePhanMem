const id_user = document.getElementById("userid").value;
let url = window.location.href.split("open4um");
window.onload = function () {
    if(id_user == "") {
        window.location = "../open4um";
    }

    fetch('http://localhost:8080/open4um/api/info-user', {
        method: 'POST',
        body: id_user,
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())
    .then(data => {
        document.getElementById("user_money").innerHTML = "<b>" + data.money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " VNĐ</b>";
    })
    .catch(error => console.error(error));
}

function addMoney(){
    var money_user = document.getElementById("id_money_account").value;

    fetch(url[0] +'open4um/api/deposit', {
		method: 'POST',
		body: JSON.stringify({
			username: id_user,
			money: money_user
		}),
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(response => response.json())
		.then(data => {
			window.location = data.link;
		})
		.catch(error => console.error(error));
    
}