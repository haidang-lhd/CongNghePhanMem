

let menu_right_setting = document.querySelector('.menu_right_setting > i');
let menu_setting = document.querySelector('.menu_setting');

menu_right_setting.addEventListener('click', function(e) {

	menu_setting.style.opacity = 1;
	menu_setting.style.visibility = "visible";
})
$(document).keyup(function(e) {
	if (e.keyCode === 27) {
		menu_setting.style.opacity = 0;
		menu_setting.style.visibility = "hidden";
	} //
})
// js toggle setting xxx


/*
validate form register
*/
function validateLogin() {
	let us = document.querySelector('#username1').value;
	let pw = document.querySelector('#password1').value;
	if (us == "" || pw == "") {
		alert("please fill the fields ");
		return false;
	}
	return true;
}
function validateRegister() {
	let us = document.querySelector('#username').value;
	let pw = document.querySelector('#password_register').value;
	let email = document.querySelector('#emaill').value;
	let phone = document.querySelector('#phone').value;
	if (us == "" || pw == "" || email == "" || phone == "") {
		alert("please fill the fields ");
		return false;
	}
	if (us.length < 6 || pw.length < 6) {
		alert("username and password more 6 character");
		return false;
	}
	if (phone.length > 10 || phone.length < 10) {
		alert("phone number included 10 character");
		return false;
	}
	if (email.includes("@gmail.com") == false) {
		alert("Incorrect email format");
		return false;
	}
	return true;
}
let registerForm = $('#registerForm');
registerForm.on('submit', (e) => {
	e.preventDefault();
	if (validateRegister()) {
		registerForm.off('submit').submit();
	}
});
let loginForm = $('#loginForm');
loginForm.on('submit', (e) => {
	e.preventDefault();
	if (validateLogin()) {
		loginForm.off('submit').submit();
	}
});

let urll = window.location.href.split("open4um");
let arr = window.location.href.split("/");
 

function loadSourceWeb() {
	let readMore = document.querySelector('#readMore');
	readMore.innerHTML = "Đang Tải...";

	setTimeout(function fectData() {
		fetch(urll[0] + 'open4um/post/page', {
			method: 'POST',
			body: 3,
			headers: {
				'Content-Type': 'application/json',
			}
		})
			.then(response => response.json())
			.then(data => {
				appendata(data);
			})
			.catch(error => console.error(error));
	}, 1000);
}
let keySearch = document.querySelector("#search_header");
keySearch.addEventListener("keyup", function(event) {
	if (event.key === "Enter") {
		searchSource();
	}
});
function searchSource() {
	let keySearch = document.querySelector("#search_header").value;
	fetch(urll[0] + 'open4um/search', {
		method: 'POST',
		body: keySearch,
		headers: {
			'Content-Type': 'application/json',
		}
	})
		.then(response => response.json())
		.then(data => {
			viewsSearchSource(data);
		})
		.catch(error => console.error(error));
};
function viewsSearchSource(data) {
	let nttSource = $('.nttSource-container');
	nttSource.html("");
	let html = `<div class="title-menu-home-center">
					<h3>
						<i class="fas fa-laptop-code"></i> KẾT QUẢ TÌM KIẾM
					</h3>
				</div> <div class="row">`;
	for (var i = 0; i < data.length; i++) {
		if (data[i].views == null || data[i].dowloads == null) {
			data[i].views = 0;
			data[i].dowloads = 0;
		}
		html += `<div class="col-md-4 post-source-item">
							<div class="img-post-source">
								<img src="/open4um/resources/images/${data[i].avatar}" />
								 
							</div>
							<div class="content-post-source">
								<a href="/open4um/source/${data[i].sourceid}">${data[i].sourcename} </a>
							</div>
							<div class="info-post-source">
								<div class="info-post-source-left">
									<i class="fas fa-eye"></i>
									${data[i].views}
								</div>
								<div class="info-post-source-right">
									<i class="fas fa-cloud-download-alt"></i>
									${data[i].dowloads}
								</div>
							</div>
						</div>`;
	}
	html += `</div>`;
	nttSource.append(html)

}
function appendata(data) {
	let SourceNew = $('.SourceNew');
	for (var i = 0; i < data.length; i++) {
		if (data[i].views == null || data[i].dowloads == null) {
			data[i].views = 0;
			data[i].dowloads = 0;
		}
		SourceNew.append(`<div class="col-xl-4 col-md-6 post-source-item">
						<div class="img-post-source">
							<img src="/open4um/resources/images/${data[i].avatar}" />
							<!-- <div class="cate-post-source">
								<i class="far fa-file-archive"></i> Game
							</div> -->
						</div>
						<div class="content-post-source">
							<a href="/open4um/source/${data[i].sourceid}">${data[i].sourcename} </a>
						</div>
						<div class="info-post-source">
							<div class="info-post-source-left">
								<i class="fas fa-eye"></i>
								${data[i].views}
							</div>
							<div class="info-post-source-right">
								<i class="fas fa-cloud-download-alt"></i>
								${data[i].dowloads}
							</div>
						</div>
					</div>`)
		readMore.innerHTML = "Xem Thêm...";
	}
}

//let urlRating =  window.location.href;

//function redirectRating(){
//fetch(urll[0] + 'open4um/rating/add')
//.then(function(res){ return res.json(); })
//.then(function(data){ alert( JSON.stringify( data ) ) })}





