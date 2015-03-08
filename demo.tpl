<!doctype html>
<html>
<head>
	<title> Demo page</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Russo+One' rel='stylesheet' type='text/css'>
<style>
#myCanvas{
border-color:red;
border-width: 5px;
border-style:solid;
}
</style>
<script type="text/javascript" src="js/jquery-1.11.1.js" > </script>
<script type="text/javascript" src="js/paper.js"></script>
<script type="text/javascript">
 $("document").ready(function(){
                $("#btnLogin").bind("click",function(){
                        window.location.href = "login";});
                $("#btnDemo").bind("click", function(){
                        window.location.href = "demo";});
                $("#btnAbout").bind("click", function(){
                        window.location.href = "about";});

    paper.setup('myCanvas');
    with(paper) {

        function draw_grid() {
            var hLines = new Path();
            for(var i=0; i<100; i = i+2)
            {
                hLines.add(new Point(0, i*20));
                hLines.add(new Point(100*20, i*20));
                hLines.add(new Point(100*20, i*20+20));
                hLines.add(new Point(0, i*20+20));
            }
            hLines.style = {
strokeColor: 'black'
            };

            var vLines = new Path();
            for(var i=0; i<100; i = i+2)
            {
                vLines.add(new Point(i*20, 0));
                vLines.add(new Point(i*20, 100*20));
                vLines.add(new Point(i*20+20, 100*20));
                vLines.add(new Point(i*20+20, 0));
            }
            vLines.style = {
strokeColor: 'black'
            };
        }

        var currentCells = new Group();
        function placeLife(p) {
            var circle = new Path.Circle(new Point(1010, 990).add(new Point(p.x*20, p.y*20)),9);
            circle.fillColor = 'green';
            currentCells.addChild(circle);
        }


        var max = 10;
        var currentState = [new Point(1,2), new Point(2,1), new Point(2,3), new Point(3,2), new Point(2,4), new Point(2,5)];
        var nextState = [];
        var exists = function(x, y) {
            for(var i=0; i<currentState.length; i++)
            {
                if(x === currentState[i].x && y === currentState[i].y)
                {
                    return true;
                }
            }
            return false;
        };

        var findnearbycount = function(i, j) {
            var count = 0;
            if (exists(i-1, j-1)) count++;
            if (exists(i, j-1)) count++;
            if (exists(i+1, j-1)) count++;
            if (exists(i-1, j)) count++;
            if (exists(i+1, j)) count++;
            if (exists(i-1, j+1)) count++;
            if (exists(i, j+1)) count++;
            if (exists(i+1, j+1)) count++;
            return count;

        };

        // the max has to be dynamically updated, limits serving both maxX and maxY
        // nextState.push() function may be replaced with other utility function
        // which could do that
        var findNextGen = function() {
            for(var i = (0-max); i < max; i++)
            {
                for(var j= (0-max); j < max; j++)
                {
                    var count = findnearbycount(i,j);
                    if (exists(i,j))
                    {
                        if (count > 1 && count < 4)
                        {
                            nextState.push( new Point(i, j) );
                        }
                    }
                    else
                    {
                        if (count == 3)
                        {
                            nextState.push( new Point(i, j) );
                        }
                    }
                }
            }
        };
        var updateGrid = function(cellState) {
            //remove older cells
            currentCells.removeChildren();
            //add new cells
            for(var i=0; i<cellState.length; i++)
            {
                placeLife(cellState[i]);
            }
            view.draw();
        }
        // main code
        draw_grid();
        view.center = new Point(1000,1000);
        view.zoom = 1.0;
        var iterationCount = 100;
        updateGrid(currentState);
        view.onFrame = function(){
                findNextGen();
                updateGrid(nextState);
                currentState = nextState;
                nextState = [];
        }

    }
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
                <p> This is the demo page </p>
                <canvas id="myCanvas" width=800px height=500px></canvas>
        </div>


</div>
</body>
</html>
