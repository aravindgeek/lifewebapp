 $("document").ready(function(){
    paper.setup('myCanvas');
    with(paper) 
    {
        var GRID_SIZE = 200;
        var CENTER = new Point(GRID_SIZE * 10 + 10, GRID_SIZE * 10 - 10);
        var C_WIDTH = $("#myCanvas").attr("width");
        var C_HEIGHT = $("#myCanvas").attr("height");
        var CELL_SIZE = 20;
        //alert(C_WIDTH + "" + C_HEIGHT);
        
        var pause_flag = true;
        var forward_count = 0;
        var time_line = [];
        var iter_count=0;

        var currentState = [];
        var seedStates = [];
        var nextState = [];
        var newCenter = new Point(0,0);

        //variables that store edges of current Life
        //this values are updated in PlaceLife()
        //used in updateView()
        var top = CENTER.y;
        var bottom = CENTER.y;
        var left = CENTER.x;
        var right = CENTER.x;
        //alert(top);        
        //this paperjs Group holds the circles that represent current life cells
        //this variable is cleared each time updateGrid function called
        var currentCells = new Group();
        
        //draw_grid function creates a grid by drawing horizontal 
        //and vertical lines, 
        function draw_grid() 
        {
            var hLines = new Path();
            for(var i=0; i<GRID_SIZE; i = i+2)
            {
                hLines.add(new Point(0, i*CELL_SIZE));
                hLines.add(new Point(GRID_SIZE*CELL_SIZE, i*CELL_SIZE));
                hLines.add(new Point(GRID_SIZE*CELL_SIZE, i*CELL_SIZE+CELL_SIZE));
                hLines.add(new Point(0, i*CELL_SIZE+CELL_SIZE));
            }
            hLines.style = {
                strokeColor: 'black'
            };

            var vLines = new Path();
            for(var i=0; i<GRID_SIZE; i = i+2)
            {
                vLines.add(new Point(i*CELL_SIZE, 0));
                vLines.add(new Point(i*CELL_SIZE, GRID_SIZE*CELL_SIZE));
                vLines.add(new Point(i*CELL_SIZE+CELL_SIZE, GRID_SIZE*CELL_SIZE));
                vLines.add(new Point(i*CELL_SIZE+CELL_SIZE, 0));
            }
            vLines.style = {
                strokeColor: 'black'
            };
            
        }
        
        // updateView function updates the center of the canvas
        // and scaling of the canvas based on the current Life.
        var updateView = function(){
            
            //console.log("t:" + top/20 + " b:" + bottom/20 + " l:" + left/20 + " r:" + right/20 +" " + view.center.x/20 + " " + view.center.y/20);
            if(bottom - view.center.y> C_HEIGHT/2)
            {
                newCenter = new Point(view.center.x,top + (bottom - top)/2);
            }
            if(view.center.y - top > C_HEIGHT/2)
            {
                //view.center = new Point(view.center.x, top + 250);
                newCenter = new Point(view.center.x,top + (bottom - top)/2);
            }
            if(right - view.center.x> C_WIDTH/2)
            {
                newCenter = new Point(left + (right-left)/2, view.center.y);
            }
            if(view.center.x - left > C_WIDTH/2)
            {
                newCenter = new Point(left + (right-left)/2, view.center.y);
            }
            if(bottom - top > C_HEIGHT || right - left > C_WIDTH)
            {
                // +20 are correction values
                var temp = (bottom-top - C_HEIGHT)/C_HEIGHT > (right-left - C_WIDTH)/C_WIDTH ? (bottom -top +20 )/C_HEIGHT : (right-left +20)/C_WIDTH;
                view.zoom = 1.0 / temp ;
            }
            else
            {
                view.zoom = 1.0;
            }
                        
        }
        
        
        //Adds the given cell circle to currentCells and calls updateView()
        function placeLife(p) 
        {
            var circle = new Path.Circle(CENTER.add(new Point(p.x*CELL_SIZE, p.y*CELL_SIZE)),9);
            circle.fillColor = 'green';
            currentCells.addChild(circle);
            //+40 -40 are just for safety
            
            //alert("placing x : " + p.x + " y:" + p.y + " t:" + top + " b:" + bottom +  " l:" + left + " r:" + right);
            if(p.x*CELL_SIZE +CENTER.x > right)
            {
                right = p.x*CELL_SIZE + CENTER.x + 40;   
            }
            else if(p.x*CELL_SIZE +CENTER.x < left)
            {
                left = p.x*CELL_SIZE + CENTER.x - 40;   
            }
            if(p.y*CELL_SIZE + CENTER.y < top)
            {
                top = p.y*CELL_SIZE + CENTER.y - 40;
            }
            else if(p.y*CELL_SIZE + CENTER.y > bottom)
            {
                bottom = p.y*CELL_SIZE + CENTER.y + 40;
                //alert( p.y + " " + top + " " + bottom);
            }
            updateView();
            
        }

        // returns a boolean value whether cell at x,y is alive or not
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
        
        // returns no of alive cells nearby
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

        //find the nextgeneration alive cells from currentState
        //and generated cells are stored in nextState
        var findNextGen = function() {
            left_limit = Math.round((left - CENTER.x)/CELL_SIZE - 2); // 2 is for just for some safety.
            right_limit = Math.round((right - CENTER.x)/CELL_SIZE + 2);
            top_limit = Math.round((top - CENTER.y)/CELL_SIZE - 2);
            bottom_limit = Math.round((bottom - CENTER.y)/CELL_SIZE + 2);
            iter_count++;
            
            //alert(left_limit + " " + right_limit +" " + top_limit + " " + bottom_limit );
            $("#iter_count").text("iter_count : " + iter_count.toString());
            for(var i = left_limit; i < right_limit; i++)
            {
                for(var j= top_limit; j < bottom_limit; j++)
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
        
        //clears last generation from screen
        //draws the nextGeneation to screen
        var updateGrid = function(cellState) {
            //remove older cells
            currentCells.removeChildren();
/*            top = CENTER.x;
            bottom = CENTER.x;
            left = CENTER.y;
            right = CENTER.y; */
            if(time_line.length > 30)
            {
                time_line.shift();
            }
            //add new cells
            
            for(var i=0; i<cellState.length; i++)
            
            {
                if(i==0)
                {
                    top = cellState[i].y * CELL_SIZE + CENTER.y - 40;
                    bottom = cellState[i].y * CELL_SIZE + CENTER.y + 40;
                    left = cellState[i].x * CELL_SIZE + CENTER.x - 40;
                    right = cellState[i].x * CELL_SIZE + CENTER.x + 40;
                 }
                 
                placeLife(cellState[i]);
            }
            if (view.center.x == newCenter.x && view.center.y == newCenter.y)
            {
                view.draw();
            }
            else
            {
                //alert("This is being called");
                RATE = 10;
                var diffX = (newCenter.x - view.center.x)/RATE;
                var diffY = (newCenter.y - view.center.y)/RATE;
                for(var i=0; i< RATE; i++){
                    view.center = new Point(view.center.x + diffX, view.center.y + diffY);
                    setTimeout(view.draw(), 500/RATE);
                }
            }
        }
        
        

        var init_seed = function(seed){
            currentState = seed;
            seedStates = currentState;
            nextState = [];        
            time_line.push(currentState);
            updateGrid(currentState);
            view.center = CENTER;
            //console.log(CENTER)
            view.zoom = 1.0;
            view.draw()
        }
   
        
        
        var tool = new Tool();
        tool.onMouseMove = function(event){
            var x = Math.round((event.point.x - CENTER.x)/CELL_SIZE);
            var y = Math.round((event.point.y - CENTER.y)/CELL_SIZE);
            $("#cooridanates").text("x: " + x + " y:" + y ); 
        };
        /*
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
        
        */

        
        setInterval(function(){
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
        }, 500);
        
        // main code
        draw_grid();
        init_seed([new Point(1,2), new Point(2,1), new Point(2,3), new Point(3,2), new Point(2,4), new Point(2,5)]);
        //console.log(JSON.stringify([new Point(1,2), new Point(2,1), new Point(2,3), new Point(3,2), new Point(2,4), new Point(2,5), new Point(30,30), new Point(31,31), new Point(-20, -20)]));        
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
            $("#iter_count").text("iter_count : " + iter_count.toString());
            pause_flag = true;
            time_line.push(seedStates);
            updateGrid(seedStates);
            currentState = seedStates;
            nextState = [];
            console.log(CENTER);
        });
        // reading demo lifes from database using a AJAX request
        $.ajax(
            {url: "/demo-lifes?req_item=list", 
            async: false,
            success: function(result){
                $("#demo_menu").html(result);
        }});
        
        $(".demo-life-link").click( function(){
                $.ajax(
                    {url: "/demo-lifes?req_item=" + $(this).text(), 
                    success : function(result){
                        var intial_seed = [];
                        var intial_points = ((JSON.parse(result)).points);
                        for( var i =0; i < intial_points.length;i++){
                             intial_seed.push(new Point(intial_points[i]));
                        }
                        //alert(intial_seed);
                        init_seed(intial_seed);
                    }});
        });
        


    }
});
