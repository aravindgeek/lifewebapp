<!doctype html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="css/form.css">
<script src="js/jquery-1.11.1.js" > </script>
<script>
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
                        <img id="logo" src="images/logo.png"/>
                        <ul id="links">
                                <li class="button" id="btnLogin"> LetMeIn</li>
                                <li class="button" id="btnDemo"> Demo </li>
                                <li class="button" id="btnAbout"> About</li>
                        </ul>
        </div>
        <div id="content">
                <form action="/changepwd" method="post">
                        <p> Userid </p> <input type="text" name="userhandle"
                        value={{handle}} readonly><br>
                        <p> Cryptcode </p> <input type="text"
                        name="cryptcode" value={{cc}} readonly><br>
                        <p>New Password </p><input type="text"
                        name="new_pwd"> <br>
                        <p>Repeat passwod</> <input type="text"
                        name="new_pwd2"><br>
                        <input type="submit" value="reset">
                </form>
        </div>
</div>
</body>
</html>
