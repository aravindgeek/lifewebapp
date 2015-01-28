<!doctype html>
<html>
<head>
	<title>Become a user of our webapp</title>
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
                <form action="/newuser" method="post">
                        <p> Your Name: </p><input type="text" name="name" /> <br>
                        <p> Nick/User Name : </p><input type="text" name="userid" /> <br>
                        <p>Email: </p><input type="text" name="email" /> <br>
                        <p>Re-type:</p> <input type="text" name="email_2" /> <br>
                        <p>Password:</p> <input type="password" name="passwd" /> <br>
                        <p>Re-type:</p> <input type="password" name="passwd_2" /><br>
                        <input type="submit" id="btnRegister" value="Register">
                        <input type="reset" id="btnCancel" value="Cancel">
                </form>
        </div>


</div>
</body>
</html>
