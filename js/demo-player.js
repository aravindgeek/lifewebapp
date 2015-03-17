 $("document").ready(function(){
    var pause_flag = true;
    var forward_count = 0;
    var time_line = [];
    var iter_count=0;
        
    $("#start-link").click( function(){
        pause_flag = false;
    });
    $("#pause-link").click( function(){
        pause_flag = true;
    });
    $("#forward-link").click( function(){
        pause_flag = true;
        forward_count++;
    });

    paper.setup('myCanvas');
    with(paper) 
    {
        var top = 990;
        var bottom = 990;
        var left = 1010;
        var right = 1010;
        function draw_grid() 
        {
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
        
        var updateView = function(){
            if(bottom - view.center.y> 250)
            {
                view.center = new Point(view.center.x,top + (bottom - top) / 2);
            }
            if(view.center.y - top > 250)
            {
                view.center = new Point(view.center.x, top - (bottom - top) / 2);
            }
            if(right - view.center.x> 512)
            {
                view.center = new Point(left + (right  - left) / 2, view.center.y);
            }
            if(view.center.x - left > 512)
            {
                view.center = new Point(left - (right - left) / 2, view.center.y);
            }
            if(bottom - top > 500 || right - left > 1024)
            {
                var temp = (500-bottom-top) > (1024 - right-left) ? (bottom -top)/512 : (right-left)/1024;
                view.zoom = 1.0 / temp;
            }
                        
        }

        var currentCells = new Group();
        function placeLife(p) 
        {
            var circle = new Path.Circle(new Point(1010, 990).add(new Point(p.x*20, p.y*20)),9);
            circle.fillColor = 'green';
            currentCells.addChild(circle);
            if(p.x*20 +1010 > right)
            {
                right = p.x*20 +1050;   
            }
            else if(p.x*20 +1010 < left)
            {
                left = p.x*20 +970;   
            }
            if(p.y*20 + 990 < top)
            {
                top = p.y*20 + 940;
            }
            else if(p.y*20 + 990 > bottom)
            {
                bottom = p.y*20 + 990;
                //alert( p.y + " " + top + " " + bottom);
            }
            updateView();
            
        }

        //var max = 10;
        var currentState = [new Point(1,2), new Point(2,1), new Point(2,3), new Point(3,2), new Point(2,4), new Point(2,5), new Point(30,20)];
        var seedStates = currentState;
        var nextState = [];
        var exists = function(x, y) 
        {
            for(var i=0; i<currentState.length; i++)
            {
                if(x === currentState[i].x && y === currentState[i].y)
                {
                    return true;
                }
            }
            return false;
        };

        var findnearbycount = function(i, j) 
        {
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
            
            iter_count++;
            $("#iter_count").text("iter_count : " + iter_count.toString());
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
            top = 990;
            bottom = 990;
            left = 1010;
            right = 1010;
            if(time_line.length > 30)
            {
                time_line.shift();
            }
            //add new cells
            for(var i=0; i<cellState.length; i++)
            {
                placeLife(cellState[i]);
            }
            view.draw();
        }
        $("#backward-link").click( function(){
            pause_flag = true;
            iter_count--;
            $("#iter_count").text("iter_count : " + iter_count.toString());
            if(time_line.length == 1)
            {
                alert("TimeLine is limited to 30");
            }
            else{
                //alert(time_line.length);
                time_line.pop();
                var pastState = time_line.pop();
                updateGrid(pastState);
                currentState = pastState;
                time_line.push(currentState);
                nextState = [];
            }
        });
        
        $("#reset-link").click( function(){
            time_line = [];
            iter_count = 0;
            time_line.push(seedStates);
            updateGrid(seedStates);
            currentState = seedStates;
            nextState = [];
        });
        // main code
        view.center = new Point(1000,1000);
        view.zoom = 1.0;
        draw_grid();
        //var iterationCount = 100;
        time_line.push(currentState);
        updateGrid(currentState);
        view.onFrame = function(){
            if(pause_flag != true)
            {
                findNextGen();
                time_line.push(nextState);
                updateGrid(nextState);
                currentState = nextState;
                nextState = [];
                forward_count = 0;
            }
            else if(forward_count > 0)
            {
                findNextGen();
                time_line.push(nextState);
                updateGrid(nextState);
                currentState = nextState;
                nextState = [];
                forward_count--;
                //alert(top.toString() + " " + bottom.toString() +" "+ left.toString() + " "+ right.toString()); 
            }
        }

    }
});
