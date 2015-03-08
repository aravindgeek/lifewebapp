<!doctype html>
<html>
<head>
	<title>Become a user of our webapp</title>
<link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Russo+One' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="css/newuser.css">
<link rel="stylesheet" type="text/css" href="css/pure-min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
</head>
<body>
<div id="main_container">
        <div id="header" class="pure-g">
					<div id="logodiv"class="pure-u-1-12">
													<img id="logo" src="images/logo.gif" alt="logo"/>
					</div>
					<div id="title" class="pure-u-1-3">
													<p> CONWAY'S GAME OF LIFE </p>
					</div>
					<div id="menu_container"class="pure-u-1-3">
                        <div class="pure-menu pure-menu-horizontal">
                        <ul class="pure-menu-list" id="menu">
                                <li class="custom-menu-item pure-menu-item" id="btnHome"> <a href="/" class="pure-menu-link"><i class="fa fa-home"> </i> &nbspHome </a></li>
                                <li class="custom-menu-item pure-menu-item" id="btnLogin"> <a href="/login" class="pure-menu-link"><i class="fa fa-users"> </i> &nbspLogin </a></li>
                                <li class="custom-menu-item pure-menu-item" id="btnDemo"> <a href="/demo" class="pure-menu-link"><i class="fa fa-youtube-play"> </i> &nbspDemo</a></li>
                                <li class="custom-menu-item pure-menu-item" id="btnAbout"> <a href="/about" class="pure-menu-link"><i class="fa fa-info-circle"> </i> &nbspAbout </a></li>
                        </ul>
                        </div>
        </div>
        </div>
        <div id="content">
        <i id="login_icon"class="fa fa-user-plus fa-4x"> </i>
                <form class="pure-form pure-form-aligned" action="/newuser" method="post">
                <fieldset>
                <div class="pure-control-group">
                        <label for="name" > Name: </label>
                        <input type="text" id="name" placeholder="Enter your actual name"/>
                 </div>
                 <div class="pure-control-group">
                        <label for="userid"> User Name : </label>
                        <input type="text" id="userid" placeholder="This is used to login"/>
                 </div>
                 <div class="pure-control-group">
                        <label for="email" >Email: </label>
                        <input type="text" id="email" placeholder="Enter a valid Email address"/>
                 </div>
                 <div class="pure-control-group">
                        <label for="email_2">Re-type:</label> 
                        <input type="text" id="email_2" placeholder="Retype your Email address"/>
                 </div>
                 <div class="pure-control-group">
                        <label for="passwd">Password:</label> 
                        <input type="password" id="passwd" placeholder="Min of 6 char with atleast one uppercase and digit"/>
                 </div>
                 <div class="pure-control-group">
                        <label for="passwd_2">Re-type:</label> 
                        <input type="password" id="passwd_2" placeholder="Retype the password" />
                 </div>
                 <div class="pure-controls">
                 
        <button type="submit" id="btnRegister" class= "pure-button pure-button-primary" /> <i class="fa fa-user-plus">&nbsp</i>Register </button>
        <button type="reset" id="btnCancel" class="pure-button pure-button-primary"/><i class="fa fa-remove">&nbsp</i> Cancel</button>
                 </div>
                </form>
        </div>


</div>
</body>
</html>
