<!doctype html>
<html>
<head>
	<title> Login page </title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="css/form.css">
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
        <form action="login" method="post">
        <p> Username : </p><input name="username" type="text"/> <br>
        <p> Password : </p><input name="password" type="text"/> <br>
        <input type="submit" id="login" value="Login"/>
        <input type="button" id="cancel" value="Cancel"/> <br>
        <a href="newuser"> New User</a>
        <a href="resetpwd"> Forget Password </a>

        </form>
        {{!msg}}
        </div>


</div>
</body>
</html>

