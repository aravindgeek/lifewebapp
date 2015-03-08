<!doctype html>
<html>
<head>
	<title> About page</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="css/about.css">
<link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Russo+One' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery-1.11.1.js" > </script>
<script type="text/javascript" >
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
                        <img id="logo" src="images/logo.gif" alt="logo"/>
                        <p id="title"> CONWAY'S GAME OF LIFE </p>
                        <ul id="menu">
                                <li class="button" id="btnLogin"> LetMeIn</li>
                                <li class="button" id="btnDemo"> Demo </li>
                                <li class="button" id="btnAbout"> About</li>
                        </ul>
        </div>
        <div id="content">
                <p>This is lifeweb application </p>
        </div>


</div>
</body>
</html>
