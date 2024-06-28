class Circle{

  int column;
  int row;
  
  Circle(int column, int row){
  this.column = column;
  this.row = row;
   
    this.display();
  }
  
  void display(){
    noFill();
    strokeWeight(10);
    stroke(#26a9ef);
    

    ellipse(50 + 100 * column, 50 + 100 * row, 50, 50);
  
    
    

    
    
    }
  }
