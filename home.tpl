<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> Welcome to Web portal for Conway's game of LIFE by {{name}}</title>
<link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Russo+One' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="css/pure-min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
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
                showSlide1();
                });

</script>
</head>
<body>
<div id="main_container">
        <div id="header">
                        <img id="logo" src="images/logo.gif" alt="logo"/>
                        <p id="title"> CONWAY'S GAME OF LIFE </p>
                        <div class="pure-menu pure-menu-horizontal">
                        <ul class="pure-menu-list" id="menu">
                                <li class="pure-menu-item" id="btnHome"> <a href="/" class="pure-menu-link">Home </a></li>
                                <li class="pure-menu-item" id="btnLogin"> <a href="/login" class="pure-menu-link">Login </a></li>
                                <li class="pure-menu-item" id="btnDemo"> <a href="/demo" class="pure-menu-link">Demo</a></li>
                                <li class="pure-menu-item" id="btnAbout"> <a href="/about" class="pure-menu-link">About </a></li>
                        </ul>
                        </div>
        </div>
        <br> <br>
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

