<!doctype html>
<html>
<head>
	<title> Welcome to Web portal for Conway's game of LIFE by {{name}}</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<script type="text/javascript" src="js/jquery-1.11.1.js" > </script>
<script type="text/javascript">

var showSlide1 = function(){
        $("#slide3").css("display","none");
        $("#slide1").css("display","block");
        $("#slide1").animate({opacity:1.0},2000);
        $("#slide1").animate({opacity:0.0},2000);
        setTimeout(showSlide2,4000);
        }
var showSlide2 = function(){

        $("#slide1").css("display","none");
        $("#slide2").css("display","block");
        $("#slide2").animate({opacity:1.0},2000);
        $("#slide2").animate({opacity:0.0},2000);
        setTimeout(showSlide3,4000);
        }
var showSlide3 = function(){

        $("#slide2").css("display","none");
        $("#slide3").css("display","block");
        $("#slide3").animate({opacity:1.0},2000);
        $("#slide3").animate({opacity:0.0},2000);
        setTimeout(showSlide1,4000);

        }
        $("document").ready(function(){
                $("#btnLogin").bind("click",function(){
                        window.location.href = "login";});
                $("#btnDemo").bind("click", function(){
                        window.location.href = "demo";});
                $("#btnAbout").bind("click", function(){
                        window.location.href = "about";});
                showSlide1();
                });

</script>
</head>
<body>
<div id="main_container">
        <div id="header">
                        <img id="logo" src="images/logo.png" alt="logo"/>
                        <ul id="links">
                                <li class="button" id="btnLogin"> LetMeIn</li>
                                <li class="button" id="btnDemo"> Demo </li>
                                <li class="button" id="btnAbout"> About</li>
                        </ul>
        </div>
        <div id="content">
        <div class="slideshow">
                <img id="slide1" src="images/slide_1.png" width="1024" height="520" alt="slide1">
                <img id="slide2" src="images/slide_2.png" width="1024" height="520" alt="slide2">
                <img id="slide3" src="images/slide_3.png" width="1024" height="520" alt="slide3">
        </div>
        </div>


</div>
</body>
</html>

