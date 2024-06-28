class Grid {
  
  Grid(){
    
    println("[Grid] Constructor");
  }
 
  void display(){
    println("[Grid] Display");
    strokeWeight(1);
    stroke(#ffffff);
    
    line(100, 10, 100, 290);
    line(200, 10, 200, 290);
    
    line(10, 100, 290, 100);
    line(10, 200, 290, 200);
    
    
  }
}
