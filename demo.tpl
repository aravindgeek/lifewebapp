<!doctype html>
<html>
<head>
    <title> Demo page</title>
    <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Russo+One' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="css/home.css">
    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <link rel="stylesheet" type="text/css" href="css/pure-min.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <script type="text/javascript" src="js/jquery-1.11.1.js" > </script>
    <script type="text/javascript" src="js/paper.js"></script>
    <script type="text/javascript" src="js/demo-player.js"> </script>
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
                 <!--   <li id="debug" class="custom-menu-item pure-menu-item">Parameters</li> -->
                    <li class="custom-menu-item pure-menu-item" id="btnHome"> <a href="/" class="pure-menu-link"><i class="fa fa-home"> </i> &nbspHome </a></li>
                    <li class="custom-menu-item pure-menu-item" id="btnLogin"> <a href="/login" class="pure-menu-link"><i class="fa fa-users"> </i> &nbspLogin </a></li>
                    <li class="custom-menu-item pure-menu-item" id="btnDemo"> <a href="/demo" class="pure-menu-link"><i class="fa fa-youtube-play"> </i> &nbspDemo</a></li>
                    <li class="custom-menu-item pure-menu-item" id="btnAbout"> <a href="/about" class="pure-menu-link"><i class="fa fa-info-circle"> </i> &nbspAbout </a></li>
                    
                </ul>
            </div>
        </div>
    </div>
        
    <div id="content">
        <div id = "examples" class="pure-menu custom-restricted-width">
            <span class="pure-menu-heading">Examples</span>
            <ul id="demo_menu"class="pure-menu-list">

            </ul>
            
        </div>
        <div id="player">
            <canvas id="myCanvas"></canvas>
            <div id="player-controls"class="pure-menu pure-menu-horizontal">
                <ul class="pure-menu-list">
                    <li class="pure-menu-item"><a id="start-link" class="pure-menu-link"> <i class="fa fa-play"> </i> &nbspStart</a></li>
                    <li class="pure-menu-item"><a id="pause-link" class="pure-menu-link"> <i class="fa fa-pause"> </i> Pause</a></li>
                    <li class="pure-menu-item"><a id="forward-link" class="pure-menu-link"><i class="fa fa-step-forward"> </i> Step(+1) </a></li>
                    <li class="pure-menu-item"><a id="backward-link" class="pure-menu-link"><i class="fa fa-step-backward"> </i>Step(-1) </a></li>
                    <li class="pure-menu-item"><a id="reset-link" class="pure-menu-link"><i class="fa fa-refresh"> </i> Reset </a></li>
                    <li class="pure-menu-item"> &nbsp&nbsp&nbsp&nbsp<span id="iter_count"> iter_count : 0</span></li>                                        
                    <li class="pure-menu-item"> &nbsp&nbsp&nbsp&nbsp<span id="cooridanates"> x:0 y:0</span></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>
