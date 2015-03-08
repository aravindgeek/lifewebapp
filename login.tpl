<!doctype html>
<html>
<head>
	<title> Login page </title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="css/form.css">
<link rel="stylesheet" type="text/css" href="css/pure-min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Russo+One' rel='stylesheet' type='text/css'>
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
                        <img id="logo" src="images/logo.gif" alt="logo"/>
                        <p id="title"> CONWAY'S GAME OF LIFE </p>
                        <ul id="menu">
                                <li class="button" id="btnLogin"> LetMeIn</li>
                                <li class="button" id="btnDemo"> Demo </li>
                                <li class="button" id="btnAbout"> About</li>
                        </ul>
        </div>
        <div id="content">
        
        <form class="pure-form pure-form-aligned" action="login" method="post">
        <fieldset>
        <div class="pure-control-group">
                <label for="username"> Username : </label>
                <input id="username" type="text" placeholder="">
        </div>
        <div class="pure-control-group">
                <label for="password"> Password : </label>
                <input id="password" type="password" placeholder="">
        </div>
        <div class="pure-controls">
        <button type="submit" id="login" class= "pure-button pure-button-primary" /> <i class="fa fa-sign-in">&nbsp</i>Login </button>
        <button type="reset" id="cancel" class="pure-button pure-button-primary"/><i class="fa fa-remove">&nbsp</i> Cancel</button>
        </div>
        
        </fieldset>
        </form>
        {{!msg}}
        </div>
        <div id="links">
        <a class="pure-menu-link" href="newuser"> New User</a>
        <a class="pure-menu-link" href="resetpwd"> Forget Password </a>
        </div>

</div>
</body>
</html>

