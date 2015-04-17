<!doctype html>
<html>
<head>
    <title> About page</title>
    <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Russo+One' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="css/home.css">
    <link rel="stylesheet" type="text/css" href="css/about.css">
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
            <h2> ABOUT CONWAY'S GAME OF LIFE</h2>
            <p>The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970 </p>
            <p>The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, alive or dead. Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:<p>
    <ul>
        <li>Any live cell with fewer than two live neighbours dies, as if caused by under-population.</li>
        <li>Any live cell with two or three live neighbours lives on to the next generation. </li>
        <li>Any live cell with more than three live neighbours dies, as if by overcrowding.</li>
        <li>Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.</li>
    </ul>
        </div>
    </div>
</body>
</html>
