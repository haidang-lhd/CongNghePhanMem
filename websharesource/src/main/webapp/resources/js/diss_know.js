const id_user = document.getElementById("userid").value;
let url = window.location.href.split("open4um");

window.onload = function (){
    var status = document.getElementById('post-status');
    status.addEventListener('click', showpost);
    var search = document.getElementById('searchi').style.display = 'none';

}


function btposts(){
	alert("Bài viết đang được xét duyệt, xin vui lòng đợi ^^");
}

function showbutton(idpro){
    var button = document.getElementById('show-button-' + idpro);
    if(button.style.display === 'none'){
        button.style.display = 'block';
    }else{
        button.style.display = 'block';
    }
}



function showreply (idpro){
    var replycomment = document.getElementById('reply-comment-' + idpro);
    if (replycomment.style.display === 'none'){
        replycomment.style.display = 'block';
    }else{
        replycomment.style.display = 'block'; 
    }
}

function showpost(){
    var framespost = document.getElementById('frames-postid');
    var posts = document.getElementById('posts');

    if (framespost.style.display === 'none')
    {
        framespost.style.display = 'block';
        posts.style.marginTop = '210px';
    }
    else
    {
        framespost.style.display = 'none';
    }
}

function updatelike(id) {
	$.ajax({
		url: "/open4um/forum/updatelikeajax/",
		type: 'POST',
		contentType: "application/json",
		dateType: 'json',
		data: JSON.stringify(id),
		success: function(data) {
			console.log(data);
			$("#resultlike-" + id).html(data + " Thích");
		}
	});
}

function callData(id) {
	console.log(id);
	var arr = window.location.href.split("/");
	fetch(url[0] +'open4um/api/post/comment', {
		method: 'POST',
		body: id,
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(response => response.json())
		.then(data => {
			console.log(data);
			if (data.length === 0) {
				document.getElementById("post-content-" + id).innerHTML = "<div class='text-center p-2'>Chưa có bình luận!</div>";
				if (id_user != "") {
					var cmt = "<div class='row'>";
					cmt += "<div class='col p-0'>";
					cmt += "<div class='post-comment'>";
					cmt += "<textarea rows='6' placeholder='Viết bình luận' class='input-comment' id='id_post_content_comment'></textarea>";
					cmt += "<button class='btn-comment' onclick='addComment(" + id + ")'><i class='fas fa-paper-plane'></i></button>";
					cmt += "</div>";
					cmt += "</div>";
					cmt += "</div>";
					document.getElementById("post-content-" + id).innerHTML += cmt;
				}
			} else {
				showData(data, id);
			}
		})
		.catch(error => console.error(error));
}

function showData(data, id) {
	var arr = window.location.href.split("/");
	var post = document.getElementById("post-content-" + id);
	document.getElementById("post-content-" + id).innerHTML = "";
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
				str += "<span class='item-post-detail' onclick='showInputReply(" + item.cmtid + ", " + id + ")' id='id_post_rep_" + item.cmtid + "'><i class='fas fa-reply'></i> Trả lời</span>";
				str += "<a href='/open4um/report/" + id + "/" + item.cmtid + "' class='item-post-detail'><i class='fas fa-minus-circle'></i> Báo cáo</a>";
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
				rep += "<a href='/open4um/report/" + id + "/" + item.cmtid + "' class='item-post-detail'><i class='fas fa-minus-circle'></i> Báo cáo</a>";
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
		cmt += "<button class='btn-comment' onclick='addComment(" + id + ")'><i class='fas fa-paper-plane'></i></button>";
		cmt += "</div>";
		cmt += "</div>";
		cmt += "</div>";
		post.innerHTML += cmt;
	}
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

function addComment(id) {
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
	var productid = id;
	fetch(url[0] +'open4um/api/post/add-comment', {
		method: 'POST',
		body: JSON.stringify({
			cmtname: content,
			datecmt: date,
			username: id_user,
			productid: id
		}),
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(response => response.json())
		.then(data => {
			showData(data, id);
		})
		.catch(error => console.error(error));
}

function addReply(cmtid, id) {
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
	var productid = id;
	fetch(url[0] +'open4um/api/post/add-reply', {
		method: 'POST',
		body: JSON.stringify({
			cmtname: content,
			datecmt: date,
			username: id_user,
			parent: cmtid,
			productid: id
		}),
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(response => response.json())
		.then(data => {
			showData(data, id);
		})
		.catch(error => console.error(error));
}

function showInputReply(cmtid, id) {
	var str = document.getElementById("id_post_rep_" + cmtid).textContent;
	if (document.getElementById("id_post_rep_" + cmtid).textContent == " Trả lời") {
		document.getElementById("id_post_rep_" + cmtid).innerHTML = "<i class='fas fa-reply'></i> Đóng trả lời</span>";
		var cmt = "<div class='row'>";
		cmt += "<div class='col-xl-12 p-0'>";
		cmt += "<div class='post-comment'>";
		cmt += "<textarea rows='3' placeholder='Viết bình luận' class='input-comment' id='id_post_content_reply'></textarea>";
		cmt += "<button class='btn-comment' onclick='addReply(" + cmtid + ", " + id + ")'><i class='fas fa-paper-plane'></i></button>";
		cmt += "</div>";
		cmt += "</div>";
		cmt += "</div>";
		document.getElementById("id_post_reply_" + cmtid).innerHTML = cmt;
	} else {
		document.getElementById("id_post_rep_" + cmtid).innerHTML = "<i class='fas fa-reply'></i> Trả lời</span>";
		document.getElementById("id_post_reply_" + cmtid).innerHTML = "";
	}
}

