<!doctype html>
<html>
<head>
    <title> Main page</title>
    <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Russo+One' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="css/home.css">
    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <link rel="stylesheet" type="text/css" href="css/pure-min.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    
    <script type="text/javascript" src="js/jquery-1.11.1.js" > </script>
    <script type="text/javascript" src="js/paper.js"></script>
    <script type="text/javascript" src="js/app-player.js"> </script>
    <script type="text/javascript" src="js/jquery.awesome-cursor.min.js"> </script>
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
            <span class="pure-menu-heading"><i class="fa fa-bars"> </i>&nbsp<b>MENU</b></span>
            <ul id="demo_menu"class="pure-menu-list">
                <li class="pure-menu-item"><a id="newlife-link" class="pure-menu-link demo-life-link"><i class="fa fa-bolt"></i>&nbsp&nbspNew Life</a></li>
                <li class="pure-menu-item"><a id="openlife-link" class="pure-menu-link demo-life-link"><i class="fa fa-folder"></i>&nbspOpen Life</a></li>
                <li class="pure-menu-item"><a id="gallery-link" class="pure-menu-link demo-life-link"><i class="fa fa-gears"> </i>&nbspGallery</a></li>
                <li class="pure-menu-item"><a id="savelife-link" class="pure-menu-link demo-life-link"><i class="fa fa-save"> </i>&nbspSave Life</a></li>
                <li class="pure-menu-item"><a  id="logout-link" class="pure-menu-link demo-life-link"><i class="fa fa-sign-out"> </i>&nbspLogout</a></li>
            </ul>
            
        </div>
        <div id="player">
            <canvas id="myCanvas"></canvas>
            <div id="player-controls"class="pure-menu pure-menu-horizontal">
                <ul class="pure-menu-list">
                    <li class="pure-menu-item"><a id="addpoint-link" class="pure-menu-link"> <i class="fa fa-plus"> </i> &nbspAddCell</a></li>
                    <li class="pure-menu-item"><a id="rmpoint-link" class="pure-menu-link"> <i class="fa fa-remove"> </i> &nbspRemoveCell</a></li>
                    <li class="pure-menu-item"><a id="updateseed-link" class="pure-menu-link"> <i class="fa fa-stack-overflow"> </i> &nbspUpdateSeed</a></li>
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
    <div id="save-form">
    <p class="dialog-title"> Life Seed Save Dialog</p>
    <form class="pure-form pure-form-aligned" action="None">
        <fieldset>
            <div class="pure-control-group">
                <label for="sf-lifename"> LifeName</label>
                <input id="sf-lifename" type="text" placeholder="">
            </div>
            <div class="pure-control-group">
                <label for="sf-visibility"> Visibility </label>
                 <select id="sf-visibility">
                    <option value="private">Private</option>
                    <option value="public">Public</option>
                 </select> 
            </div>
            <div class="pure-controls">
                <button type="button" id="sf-save" class= "pure-button pure-button-primary" /> <i class="fa fa-save">&nbsp</i>Save</button>
                <button type="button" id="sf-cancel" class="pure-button pure-button-primary"/><i class="fa fa-remove">&nbsp</i> Cancel</button>
            </div>

        </fieldset>
    </form>
    </div>
    <div id="openmenu">
    <div class="pure-menu custom-restricted-width">
        <span class="pure-menu-heading">Open a Life</span>
        <ul id="open_menu_list"class="pure-menu-list">
        </ul>
    </div>
    </div>
    
    <div id="gallerymenu">
    <div class="pure-menu custom-restricted-width">
        <span class="pure-menu-heading">Open a Life</span>
        <ul id="gallery_menu_list"class="pure-menu-list">
        </ul>
    </div>
    </div>
</body>
</html>
