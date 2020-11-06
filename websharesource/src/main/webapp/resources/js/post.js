const id_user = document.getElementById("userid").value;
window.onload = function() {
	console.log(id_user);
	loadPostForum();
}
let url = window.location.href.split("open4um");
let arr =  window.location.href.split("/");
function loadPostForum() {
	
	fetch(url[0] + 'open4um/api/post', {
		method: 'POST',
		body: arr[arr.length - 1],
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(response => response.json())
		.then(data => {
			console.log(data);
			loadInfoPost(data);
		})
		.catch(error => console.error(error));
}

function loadCategoryPost(cateid, str) {
	fetch(url[0] +'open4um/api/category', {
		method: 'POST',
		body: cateid,
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(response => response.json())
		.then(data => {
			var str2 = "";
			str2 += " <a href='#' class='item-post-menu-category'>" + data.ctgname + "</a>";
			var cate = str2 + str;
			if (data.parentid != 0) {
				loadCategoryPost(data.parentid, cate);
			} else {
				document.getElementById("id_post_category").innerHTML += cate;
			}
		})
		.catch(error => console.error(error));
}

function loadInfoPost(data) {
	var arr = window.location.href.split("/");
	loadCategoryPost(data.ctgid, "");
	document.getElementById("id_post_title").innerHTML = "<i class='far fa-clipboard'></i> " + data.title;
	var link = document.getElementById("id_post_avatar").src;
	document.getElementById("id_post_avatar").src = link.slice(0, link.length - 1) + data.avatar;
	document.getElementById("id_user_post").innerHTML = data.username;
	document.getElementById("id_post_date").innerHTML = timeSince(data.datepost);
	document.getElementById("id_post_content").innerHTML = data.content;

	var detail = "<div class='row post-detail'>";
	detail += "<div class='col-6 text-left'>";
	detail += "<div id='id_post_like'>" + data.like + " <i class='far fa-thumbs-up'></i></div>";
	detail += "</div>";
	if (id_user != "") {
		detail += "<div class='col-6 text-right pr-4'>";
		detail += "<span class='item-post-detail' onclick='like()'><i class='far fa-thumbs-up'></i> Thích</span>";
		detail += "<a href='../report/" + arr[arr.length - 1] + "' class='item-post-detail'><i class='fas fa-minus-circle'></i> Báo cáo</a>";
		detail += "</div>";
	}
	detail += "</div>";
	document.getElementById("id_post_details").innerHTML = detail;
}

function loadComment() {

	if (document.getElementById("show-comment").textContent == "Hiện bình luận") {
		document.getElementById("show-comment").innerHTML = "Ẩn bình luận";
		document.getElementById("post-content").innerHTML = "<div class='text-center'><img src='/open4um/resources/images/loading-web.gif' class='img-loadding' /></div>";
		setTimeout(callData, 1000);
	} else {
		document.getElementById("show-comment").innerHTML = "Hiện bình luận";
		document.getElementById("post-content").innerHTML = "";
	}
}

function like() {
	var arr = window.location.href.split("/");

	fetch(url[0] +'open4um/api/likepost', {
		method: 'POST',
		body: arr[arr.length - 1],
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(response => response.json())
		.then(data => {
			document.getElementById("id_post_like").innerHTML = data + " <i class='far fa-thumbs-up'></i>";
		})
		.catch(error => console.error(error));
}

function callData() {
	var arr = window.location.href.split("/");
	fetch(url[0] +'open4um/api/post/comment', {
		method: 'POST',
		body: arr[arr.length - 1],
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(response => response.json())
		.then(data => {
			console.log(data);
			if (data.length === 0) {
				document.getElementById("post-content").innerHTML = "<div class='text-center p-2'>Chưa có bình luận!</div>";
				if (id_user != "") {
					var cmt = "<div class='row'>";
					cmt += "<div class='col p-0'>";
					cmt += "<div class='post-comment'>";
					cmt += "<textarea rows='6' placeholder='Viết bình luận' class='input-comment' id='id_post_content_comment'></textarea>";
					cmt += "<button class='btn-comment' onclick='addComment()'><i class='fas fa-paper-plane'></i></button>";
					cmt += "</div>";
					cmt += "</div>";
					cmt += "</div>";
					document.getElementById("post-content").innerHTML += cmt;
				}
			} else {
				showData(data);
			}
		})
		.catch(error => console.error(error));
}

function addReply(cmtid) {
	var arr = window.location.href.split("/");
	var content = document.getElementById("id_post_content_reply").value;
	var m = new Date();
	var date = m.getUTCFullYear() + "-" +
		("0" + (m.getUTCMonth() + 1)).slice(-2) + "-" +
		("0" + m.getUTCDate()).slice(-2) + " " +
		("0" + m.getHours()).slice(-2) + ":" +
		("0" + m.getMinutes()).slice(-2) + ":" +
		("0" + m.getSeconds()).slice(-2);
	var arr = window.location.href.split("/");
	var productid = arr[arr.length - 1];
	fetch(url[0] +'open4um/api/post/add-reply', {
		method: 'POST',
		body: JSON.stringify({
			cmtname: content,
			datecmt: date,
			username: id_user,
			parent: cmtid,
			productid: arr[arr.length - 1]
		}),
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(response => response.json())
		.then(data => {
			showData(data);
		})
		.catch(error => console.error(error));
}

function showInputReply(cmtid) {
	var str = document.getElementById("id_post_rep_" + cmtid).textContent;
	if (document.getElementById("id_post_rep_" + cmtid).textContent == " Trả lời") {
		document.getElementById("id_post_rep_" + cmtid).innerHTML = "<i class='fas fa-reply'></i> Đóng trả lời</span>";
		var cmt = "<div class='row'>";
		cmt += "<div class='col-xl-12 p-0'>";
		cmt += "<div class='post-comment'>";
		cmt += "<textarea rows='3' placeholder='Viết bình luận' class='input-comment' id='id_post_content_reply'></textarea>";
		cmt += "<button class='btn-comment' onclick='addReply(" + cmtid + ")'><i class='fas fa-paper-plane'></i></button>";
		cmt += "</div>";
		cmt += "</div>";
		cmt += "</div>";
		document.getElementById("id_post_reply_" + cmtid).innerHTML = cmt;
	} else {
		document.getElementById("id_post_rep_" + cmtid).innerHTML = "<i class='fas fa-reply'></i> Trả lời</span>";
		document.getElementById("id_post_reply_" + cmtid).innerHTML = "";
	}
}

function showData(data) {
	var arr = window.location.href.split("/");
	var post = document.getElementById("post-content");
	document.getElementById("post-content").innerHTML = "";
	data.forEach(item => {
		if (item.parent == 0) {
			var str = "";
			str += "<div id='post-" + item.cmtid + "'>";
			str += "<div class='row pl-3 pr-3'>";
			str += "<div class='col post-comment-content'>";
			str += "<div class='post-user-comment'>";
			str += "<a href='#'><i class='fas fa-user-edit'></i> " + item.username + "</a> - " + timeSince(new Date(item.datecmt).getTime());
			str += "</div>";
			str += item.cmtname;
			str += "</div>";
			str += "</div>";
			str += "<div class='row post-detail'>";
			str += "<div class='col-6 text-left'></div>";
			if (id_user != "") {
				str += "<div class='col-6 text-right pr-4'>";
				str += "<span class='item-post-detail' onclick='showInputReply(" + item.cmtid + ")' id='id_post_rep_" + item.cmtid + "'><i class='fas fa-reply'></i> Trả lời</span>";
				str += "<a href='../report/" + arr[arr.length - 1] + "/" + item.cmtid + "' class='item-post-detail'><i class='fas fa-minus-circle'></i> Báo cáo</a>";
				str += "</div>";
				str += "</div>";
				str += "<div id='id_post_reply_" + item.cmtid + "'></div>";
			}
			str += "</div>";
			post.innerHTML += str;
		} else {
			var rep = "";
			rep += "<div class='row pl-3 pr-3'>";
			rep += "<div class='col post-comment-reply pl-3 pr-3'>";
			rep += "<div class='post-user-comment'>";
			rep += "<a href='#'><i class='fas fa-user-edit'></i> " + item.username + "</a> - " + timeSince(new Date(item.datecmt).getTime());
			rep += "</div>";
			rep += item.cmtname;
			if (id_user != "") {
				rep += "<div class='detail-reply'>";
				rep += "<a href='../report/" + arr[arr.length - 1] + "/" + item.cmtid + "' class='item-post-detail'><i class='fas fa-minus-circle'></i> Báo cáo</a>";
				rep += "</div>";
			}
			rep += "</div>";
			rep += "</div>";
			document.getElementById("post-" + item.parent).innerHTML += rep;
		}
	});
	if (id_user != "") {
		var cmt = "<div class='row'>";
		cmt += "<div class='col p-0'>";
		cmt += "<div class='post-comment'>";
		cmt += "<textarea rows='6' placeholder='Viết bình luận' class='input-comment' id='id_post_content_comment'></textarea>";
		cmt += "<button class='btn-comment' onclick='addComment()'><i class='fas fa-paper-plane'></i></button>";
		cmt += "</div>";
		cmt += "</div>";
		cmt += "</div>";
		post.innerHTML += cmt;
	}
}

function addComment() {
	var arr = window.location.href.split("/");
	var content = document.getElementById("id_post_content_comment").value;
	var m = new Date();
	var date = m.getUTCFullYear() + "-" +
		("0" + (m.getUTCMonth() + 1)).slice(-2) + "-" +
		("0" + m.getUTCDate()).slice(-2) + " " +
		("0" + m.getHours()).slice(-2) + ":" +
		("0" + m.getMinutes()).slice(-2) + ":" +
		("0" + m.getSeconds()).slice(-2);
	var arr = window.location.href.split("/");
	var productid = arr[arr.length - 1];
	fetch(url[0] +'open4um/api/post/add-comment', {
		method: 'POST',
		body: JSON.stringify({
			cmtname: content,
			datecmt: date,
			username: id_user,
			productid: arr[arr.length - 1]
		}),
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(response => response.json())
		.then(data => {
			showData(data);
		})
		.catch(error => console.error(error));
}

function timeSince(date) {

	var seconds = Math.floor((new Date() - date) / 1000);

	var interval = seconds / 31536000;

	if (interval > 1) {
		return Math.floor(interval) + " năm trước";
	}
	interval = seconds / 2592000;
	if (interval > 1) {
		return Math.floor(interval) + " tháng trước";
	}
	interval = seconds / 86400;
	if (interval > 1) {
		return Math.floor(interval) + " ngày trước";
	}
	interval = seconds / 3600;
	if (interval > 1) {
		return Math.floor(interval) + " giờ trước";
	}
	interval = seconds / 60;
	if (interval > 1) {
		return Math.floor(interval) + " phút trước";
	}
	return Math.floor(seconds) + " giây trước";
}

