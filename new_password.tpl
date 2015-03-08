<!doctype html>
<html>
<head>
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
                <form class="pure-form pure-form-aligned" action="/changepwd" method="post">
                <fieldset>
                <div class="pure-control-group">
                        <label for="userhandle"> Userid </label> 
                        <input type="text" id="userhandle" value={{handle}} readonly>
                </div>
                <div class="pure-control-group">
                        <label for="cryptcode"> Cryptcode </label>
                        <input type="text" id="cryptcode" value={{cc}} readonly>
                </div>
                <div class="pure-control-group">
                        <label for="new_pwd">New Password </label>
                        <input type="password" id="new_pwd">
                </div>
                <div class="pure-control-group">
                        <label for="new_pwd2">Repeat passwod </label> 
                        <input type="password" id="new_pwd2">
                </div>
                <div class="pure-controls">
                        <button type="submit" id="changePwd" class= "pure-button pure-button-primary" /> <i class="fa fa-check">&nbsp</i>Change Password</button>
                </div> 
                </fieldset>
                </form>
        </div>
</div>
</body>
</html>
