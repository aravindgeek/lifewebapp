<!doctype html>
<html>
<head>
    <title> Welcome to Web portal for Conway's game of LIFE by {{name}}</title>
    
    <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Russo+One' rel='stylesheet' type='text/css'>
    
    <link rel="stylesheet" type="text/css" href="css/home.css">
    <link rel="stylesheet" type="text/css" href="css/pure-min.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    
    <script type="text/javascript" src="js/jquery-1.11.1.js" > </script>
    <script type="text/javascript" src="js/home_slideshow.js" > </script>
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
            <div id="slideshow">
                <img id="slide1" src="images/slide_1.png" width="1024" height="520" alt="slide1">
                <img id="slide2" src="images/slide_2.png" width="1024" height="520" alt="slide2">
                <img id="slide3" src="images/slide_3.png" width="1024" height="520" alt="slide3">
            </div>
        </div>
    </div>
</body>
</html>

