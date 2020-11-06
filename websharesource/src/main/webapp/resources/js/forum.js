	/**@author 응이아 */
	

	function menuquick(){
		var menu = document.getElementById("menu-nhanh");
		var forum = document.getElementById("forum-page");
		if (menu.style.display === "none")
		{
			forum.style.opacity = "0.5";
			menu.style.display = "block";
		}
		else
		{
			forum.style.opacity = "1";
			menu.style.display = "none";
		}
			
	};

	var search = document.getElementById('clicksearch');
	search.addEventListener('click',show);

	function show(){
		$.ajax({
			url: "/open4um/forum/searchajax/",
			type: 'GET',
			dataType: 'json',
			data: {
				"search" : $("#searchi").val()
			},
			success: function(data) {
				$("#searchresulf").html(loadData(data));
				//$("#ctgname").artt('href',(data[0].url));
				$("#ctgname").text(data[0].ctgname);
				$("#title").text(data[0].title);
				$("#views").text(data[0].views);
			}
		});
	}
	function loadData(data){
		var str = "";
		
		str += " <ul class='list-category'> ";
		$.each(data,function(key,value) {
			str += "<li>";
				str += "<div class='category-title' style='display: none;'>";
					str += "<a href=" + value.url +  "id='ctgname'>" + value.ctgname;
					str += "</a>";
				str += "</div>";
				str += "<div class='post'>";
					str += "<div class='row row-post'>";
						str += "<div class='col-md-2 icon-post'>";
							str += "<i class='fa fa-comments' style='font-size: 40px;'>";
							str += "</i>";
						str += "</div>";
						str += "<div class='col-md-10 title-post'>";
							str += "<div class='name-post'>";
								str += "<a href='#' id='title'>" + value.title;
								str += "</a>";
							str +="</div>";
							str += "<div class='count-post'>";
								str += "<span id='views'>Lượt xem:" + value.views; 
								str += "</span>";
							str += "</div>";
						str += "</div>";
					str += "</div>";
				str += "</div>";
			str += "</li>";
		});
		str += "</ul>";
		$("#searchresult").html(str);
	}
	