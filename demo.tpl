<!doctype html>
<html>
<head>
	<title> Demo page</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<script type="text/javascript" src="js/jquery-1.11.1.js" > </script>
<script type="text/javascript">
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
                <p> This is the demo page </p>
        </div>


</div>
</body>
</html>
