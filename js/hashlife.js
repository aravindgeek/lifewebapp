var TreeNodeBase = function() {
        // Data
        /*var nw = new TreeNode();
        var ne = new TreeNode();
        var sw = new TreeNode();
        var se = new TreeNode(); */
        var nw, ne, sw, se;
        var level;
        var alive;
        var population;
};

//construct a leaf cell
TreeNodeBase.prototype.leaf = function(living){
        this.nw = this.ne = this.sw = this.se = null;
        this.level = 0;
        this.alive = living;
        this.population = alive ? 1 : 0;
}

//construct a node given four children
TreeNodeBase.prototype.nonleaf = function(nw_, ne_, sw_, se_) {
        this.nw = nw_;
        this.ne = ne_;
        this.sw = sw_;
        this.se = se_;
        this.level = nw_.level + 1;
        this.population = nw.population + ne.population +
                sw.population + se.population;
        this.alive = this.population > 0 ;
}

//factory methods
TreeNodeBase.prototype.createLeaf = function(living) {
      return new TreeNode.prototype.leaf(living) ;
}

TreeNodeBase.prototype.createNode = function(nw, ne, sw, se) {
      return new TreeNode.protype.node(nw, ne, sw, se) ;
}

TreeNodeBase.prototype.create() {
      return new TreeNode(false).emptyTree(3) ;
}

/**
    *   Set a bit in this node in its relative coordinate system;
    *   returns a whole new node since our nodes are immutable.    
    *
    *   In the recursive call, we simply adjust the coordinate system
    *   and call down a level.
*/
TreeNodeType.prototype.setBit(x, y) {
      if (this.level == 0)
         return new TreeNode.prototype.leaf(true) ; // returns a leaf node
      // distance from center of this node to center of subnode is
      // one fourth the size of this node.
      // actually at level the offset value is not important right, because we
      // have already navigated alway down.   
           
      var offset = 1 << (level - 2) ;
      if (x < 0)
         if (y < 0)
            return this.createNode(nw.setBit(x+offset, y+offset), ne, sw, se) ;
         else
            return this.createNode(nw, ne, sw.setBit(x+offset, y-offset), se) ;
      else
         if (y < 0)
            return this.createNode(nw, ne.setBit(x-offset, y+offset), sw, se) ;
         else
            return this.createNode(nw, ne, sw, se.setBit(x-offset, y-offset)) ;
   }
   
