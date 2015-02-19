var p = function(x, y ){
    this.x = x;
    this.y = y;
    };

var max = 5;
var currentState = [new p(1,2), new p(2,1), new p(2,3), new p(3,2), new p(2,4)];
var nextState = [];
var exists = function(x, y){
//if(x>= 0 && x<max && y>=0 && y<max)
 for(var i=0; i<currentState.length; i++)
    {
        if(x === currentState[i].x && y === currentState[i].y)
        {
            return true;
        }
    }
return false;
};

var findnearbycount = function(i, j){
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
var findNextGen = function(){
for(var i = 0;i < max; i++)
{
    for(var j=0; j < max; j++)
        {
            var count = findnearbycount(i,j);
            if (exists(i,j))
            {
                if (count > 1 && count < 4)
                {
                    nextState.push( new p(i, j) );
                }
            }
            else
            {
                if (count == 3)
                {
                    nextState.push( new p(i, j) );
                }
            }
        }
}
};
var printCurrentState = function(){
for(var i=0;i<currentState.length; i++)
    print(currentState[i].x, currentState[i].y)
};
var iterCount = 5;
for(var i=0; i<iterCount; i++){
    print("---------(",i,")----------");
    printCurrentState();
    findNextGen();
    currentState = nextState;
    nextState = [];
}
