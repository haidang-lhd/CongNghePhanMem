// toggle-hide-show
function toggleHide() {
  var x = document.getElementById("hide-show");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
//hide-show-button-edit
 var  im =document.getElementById("main-avatar");    
  im.addEventListener("mouseover", showbutton);
  im.addEventListener("mouseout", hidebutton);
function showbutton(){
	var bt = document.getElementById("edit-avatar");
	 bt.style.display = "block";
} 
function hidebutton(){
	var bt = document.getElementById("edit-avatar");
	bt.style.display = "none";
}
//edit-avatar
function hideEditAvatar(){
	var ea = document.getElementById("formUploadFile");
	if (ea.style.display === "none") {
    ea.style.display = "block";
  } else {
    ea.style.display = "none";
  }
}