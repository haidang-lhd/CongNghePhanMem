<!-- @Author: HuuNghia -->

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link
    href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;1,300;1,400&display=swap"
    rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="webapp/resource/css/style_forum.css" >
</head>
<body> --%>
   <!--  <header>
        <div class="container">
            <div class="row">
                <div class="col-md-2 logo-header">
                    <a href=""><h2>OPEN4UM</h2></a>
                </div>
                <div class="col-md-4 menu-header">
                    <ul>
                        <li><a href="#">Forum</a></li>
                        <li><a href="#">Source</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <div class="search-header">
                        <input type="search" name="keyword" placeholder="TÃ¬m kiáº¿m" />                        
                        <div class="icon-search">
                            <a href="#"><i class="fa fa-search"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 login-header">
                    <a href="#">Login</a>
                </div>
            </div>
        </div>
    </header>

    <nav>
        <div class="container">
            <div class="menu-nav">
                <ul>
                    <li>
                        <a href="#"><i class="fa fa-star"></i></a>
                        <a href="#"><span>Discussion</span></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-star"></i></a>
                        <a href="#"><span>Knowledge</span></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-calendar-check-o"></i></a>
                        <a href="#"><span>There are no upcoming events</span></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav> -->
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <section>
    
        <div class="container">
            <div class="row section-content">
                <div class="col-md-2 menu-left">
                    <ul>
<%--                         <c:foreach var="list" items="$(CategoryName)">
                    		 <li>
	                            <a href="#"><i class="fa fa-globe"></i> </a>
	                            <a href="#">${list.ctgname }</a>  
                        	</li>
                    	</c:foreach> --%>
                        <li>
                            <a href="#"><i class="fa fa-globe"></i> </a>
                            <a href="#">News CNTT</a>  
                        </li>

                        <li>
                            <a href="#"><i class="fa fa-laptop"></i> </a>
                            <a href="#">Job</a>
                        </li>

                        <li>
                            <a href="#"><i class="fa fa-book"></i> </a>
                            <a href="#">Introduction to programming</a>
                        </li>

                        <li>
                            <a href="#"><i class="fa fa-free-code-camp"></i> </a>
                            <a href="#">programming techniques</a>
                        </li>
                    </ul>    
                </div>
                <div class="col-md-7 content-middle">
                    <div class="content-middle-icon">
                        <div class="menu-home">
                            <a href="#"><i class="fa fa-home" aria-hidden="true"></i></a>
                            <span>></span>
                        </div>
                    </div>
                    <h2>OPEN4UM.vn</h2>
                    <div class="list-content">
                            <ul class="list-category">
                             <c:forEach var="list" items="${listCategory}">
	                                <li>
	                                    <div class="category-title">
	                                        <a href="#">${list.ctgname}</a>  
	                                    </div>
<%-- 	                                    <c:set var="listp" value="${listProduct}"></c:set>
	                                    <c:if test="${listp.ctgid}"></c:if> --%>
	                                    <div class="post">
	                                        <div class="row row-post">
	                                            <div class="col-md-2 icon-post">
	                                                <i class="fa fa-comments" style="font-size: 40px;"></i>
	                                            </div>
	
	                                            <div class="col-md-10 title-post">
	                                                <div class="name-post">
	                                                    <a href="#">Name Post News CNTT 11111111111</a>
	                                                </div>
	                                                <div class="count-post">
	                                                    <span>Posts: 40</span>
	                                                </div>
	                                            </div>
	                                        </div>
	                                        
	                                        <div class="row row-post">
	                                            <div class="col-md-2 icon-post">
	                                                <i class="fa fa-comments" style="font-size: 40px;"></i>
	                                            </div>
	
	                                            <div class="col-md-10 title-post">
	                                                <div class="name-post">
	                                                    <a href="#">Name Post News CNTT 222222222222</a>
	                                                </div>
	                                                <div class="count-post">
	                                                    <span>Posts: 30</span>
	                                                </div>
	                                            </div>
	                                        </div>
	                                        <div class="row row-post">
	                                            <div class="col-md-2 icon-post">
	                                                <i class="fa fa-comments" style="font-size: 40px;"></i>
	                                            </div>
	
	                                            <div class="col-md-10 title-post">
	                                                <div class="name-post">
	                                                    <a href="#">Name Post News CNTT 33333333333</a>
	                                                </div>
	                                                <div class="count-post">
	                                                    <span>Posts: 50</span>
	                                                </div>
	                                            </div>
	                                        </div> 
	                                    </div>
	                                </li>
                                	
                                </c:forEach>
                               <!--  <li>
                                    <div class="category-title">
                                        <a href="#"> News CNTT</a>  
                                    </div>
                                    <div class="post">
                                        <div class="row row-post">
                                            <div class="col-md-2 icon-post">
                                                <i class="fa fa-comments" style="font-size: 40px;"></i>
                                            </div>

                                            <div class="col-md-10 title-post">
                                                <div class="name-post">
                                                    <a href="#">Name Post News CNTT 11111111111</a>
                                                </div>
                                                <div class="count-post">
                                                    <span>Posts: 40</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row row-post">
                                            <div class="col-md-2 icon-post">
                                                <i class="fa fa-comments" style="font-size: 40px;"></i>
                                            </div>

                                            <div class="col-md-10 title-post">
                                                <div class="name-post">
                                                    <a href="#">Name Post News CNTT 222222222222</a>
                                                </div>
                                                <div class="count-post">
                                                    <span>Posts: 30</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row row-post">
                                            <div class="col-md-2 icon-post">
                                                <i class="fa fa-comments" style="font-size: 40px;"></i>
                                            </div>

                                            <div class="col-md-10 title-post">
                                                <div class="name-post">
                                                    <a href="#">Name Post News CNTT 33333333333</a>
                                                </div>
                                                <div class="count-post">
                                                    <span>Posts: 50</span>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </li>

                                <li>
                                    <div class="category-title">
                                        <a href="#">Job</a>  
                                    </div>
                                    <div class="post">
                                        <div class="row row-post">
                                            <div class="col-md-2 icon-post">
                                                <i class="fa fa-comments" style="font-size: 40px;"></i>
                                            </div>

                                            <div class="col-md-10 title-post">
                                                <div class="name-post">
                                                    <a href="#">Name Post Job 11111111111</a>
                                                </div>
                                                <div class="count-post">
                                                    <span>Posts: 40</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row row-post">
                                            <div class="col-md-2 icon-post">
                                                <i class="fa fa-comments" style="font-size: 40px;"></i>
                                            </div>

                                            <div class="col-md-10 title-post">
                                                <div class="name-post">
                                                    <a href="#">Name Post Job 222222222222</a>
                                                </div>
                                                <div class="count-post">
                                                    <span>Posts: 30</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row row-post">
                                            <div class="col-md-2 icon-post">
                                                <i class="fa fa-comments" style="font-size: 40px;"></i>
                                            </div>

                                            <div class="col-md-10 title-post">
                                                <div class="name-post">
                                                    <a href="#">Name Post Job 33333333333</a>
                                                </div>
                                                <div class="count-post">
                                                    <span>Posts: 50</span>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </li>

                                <li>
                                    <div class="category-title">
                                        <a href="#"> Introduction to programming</a>  
                                    </div>
                                    <div class="post">
                                        <div class="row row-post">
                                            <div class="col-md-2 icon-post">
                                                <i class="fa fa-comments" style="font-size: 40px;"></i>
                                            </div>

                                            <div class="col-md-10 title-post">
                                                <div class="name-post">
                                                    <a href="#">Name Post Introduction to programming 111111</a>
                                                </div>
                                                <div class="count-post">
                                                    <span>Posts: 40</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row row-post">
                                            <div class="col-md-2 icon-post">
                                                <i class="fa fa-comments" style="font-size: 40px;"></i>
                                            </div>

                                            <div class="col-md-10 title-post">
                                                <div class="name-post">
                                                    <a href="#">Name Post Introduction to programming 2222222</a>
                                                </div>
                                                <div class="count-post">
                                                    <span>Posts: 30</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row row-post">
                                            <div class="col-md-2 icon-post">
                                                <i class="fa fa-comments" style="font-size: 40px;"></i>
                                            </div>

                                            <div class="col-md-10 title-post">
                                                <div class="name-post">
                                                    <a href="#">Name Post Introduction to programming 333333</a>
                                                </div>
                                                <div class="count-post">
                                                    <span>Posts: 50</span>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </li>

                                <li>
                                    <div class="category-title">
                                        <a href="#"> Programming techniques</a>  
                                    </div>
                                    <div class="post">
                                        <div class="row row-post">
                                            <div class="col-md-2 icon-post">
                                                <i class="fa fa-comments" style="font-size: 40px;"></i>
                                            </div>

                                            <div class="col-md-10 title-post">
                                                <div class="name-post">
                                                    <a href="#">Name Post Programming techniques 11111111111</a>
                                                </div>
                                                <div class="count-post">
                                                    <span>Posts: 40</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row row-post">
                                            <div class="col-md-2 icon-post">
                                                <i class="fa fa-comments" style="font-size: 40px;"></i>
                                            </div>

                                            <div class="col-md-10 title-post">
                                                <div class="name-post">
                                                    <a href="#">Name Post Programming techniques 222222222222</a>
                                                </div>
                                                <div class="count-post">
                                                    <span>Posts: 30</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row row-post">
                                            <div class="col-md-2 icon-post">
                                                <i class="fa fa-comments" style="font-size: 40px;"></i>
                                            </div>

                                            <div class="col-md-10 title-post">
                                                <div class="name-post">
                                                    <a href="#">Name Post Programming techniques 33333333333</a>
                                                </div>
                                                <div class="count-post">
                                                    <span>Posts: 50</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row row-post">
                                            <div class="col-md-2 icon-post">
                                                <i class="fa fa-comments" style="font-size: 40px;"></i>
                                            </div>

                                            <div class="col-md-10 title-post">
                                                <div class="name-post">
                                                    <a href="#">Name Post Programming techniques 444444444</a>
                                                </div>
                                                <div class="count-post">
                                                    <span>Posts: 50</span>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </li> -->
                            </ul>   
                    </div>
                </div>

                <div class="col-md-3 menu-right">
                    <div class="register">
                        <a href="#">
                            <button>Register</button>
                        </a>
                    </div>

                    <div class="exciting">
                        <h5>EXCITING DURING THE WEEK</h5>
                        <div class="list-exciting-post">
                            <ul>
                                <li>
                                    <a href="#">
                                        <img src="resources/images/logo.PNG" alt="">
                                        <span>Exciting Post 1</span>
                                    </a>
                                </li>
                                
                                <li>
                                    <a href="#">
                                        <img src="resources/images/logo.PNG" alt="">
                                        <span>Exciting Post 2</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <img src="resources/images/logo.PNG" alt="">
                                        <span>Exciting Post 3</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <img src="resources/images/logo.PNG" alt="">
                                        <span>Exciting Post 4</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <img src="resources/images/logo.PNG" alt="">
                                        <span>Exciting Post 5</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <img src="resources/images/logo.PNG" alt="">
                                        <span>Exciting Post 6</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

  <!--   <footer>
        <div class="container">
            <div class="menu-footer">
                <ul>
                    <li><a href="#">HOME PAGE</a></li>
                    <li><a href="#">HELP</a></li>
                    <li><a href="#">TERMS & CONDITIONS</a></li>
                    <li><a href="#">PRIVACY POLICY</a></li>
                    <li><a href="#"><i  class="fa fa-arrow-up"></i></a></li>
                   
                </ul>
            </div>

            <div class="middle-footer">
                    <div class="row row-middle-footer">
                        <div class="col-md-4">
                            <span>OPEN4UM.VN</span>
                            <ul>
                                <li><a href="#">Home Page</a></li>
                                <li><a href="#">Forum</a></li>
                                <li><a href="#">Source</a></li>
                                <li><a href="#">Contact advertising</a></li>
                            </ul>
                        </div>

                        <div class="col-md-4">
                            <span>FORUM</span>
                            <ul>
                                <li><a href="#">News CNTT</a></li>
                                <li><a href="#">Job</a></li>
                                <li><a href="#">Introduction to programming</a></li>
                                <li><a href="#">Programming techniques</a></li>
                            </ul>
                        </div>

                        <div class="col-md-4">
                            <span>SOURCE</span>
                            <ul>
                                <li><a href="#">Source web</a></li>
                                <li><a href="#">Source game</a></li>
                            </ul>
                        </div>
                    </div>
            </div>
        </div>

        <div class="bottom-footer">
            <div class="row">
                <div class="col-md-8 address">
                    <p>Responsible for the content: Nguyá»n ThÃ¡i Y â¢ Â© 2020 Joint stock company Social Networks Open4um </p>
                    <p>â¢ MST: ------ Äá»a chá»: ------â¢ SÄT: ------- â¢ Giáº¥y phÃ©p thiáº¿t láº­p MXH --------, kÃ½ ngÃ y: -------.</p> 
                </div>

                <div class="col-md-4 icon-footer">
                    <ul>
                        <li><a href="#"><i class="fa fa-facebook-square"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus-official"></i></a></li>
                        <li><a href="#"><i class="fa fa-youtube-play"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer> -->

<!-- </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html> -->