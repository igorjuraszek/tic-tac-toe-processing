Grid grid;

boolean isPlayer1Playing = true;
int[] moves = new int [9];



void setup(){
  
  size(300 ,330);
  
  grid = new Grid ();
  
}

void draw (){
    background(#333333);

    grid.display();

  drawPlayerLabel();
drawGameElements();
}
void mousePressed(){

int column = mouseX / 100;
int row = mouseY / 100;

int indexInArray = column + (row * 3);

if(moves[indexInArray] == 0){
  if(isPlayer1Playing) {
  moves[indexInArray] = 1;
  }
  else
  {
    moves[indexInArray] = 2;

  }
}
isPlayer1Playing = !isPlayer1Playing;

}
void drawPlayerLabel(){
String label = "Player 1";
if(isPlayer1Playing == false){
label = "Player 2";
}
  
  
  fill(#ffffff);
  textSize(16);
  textAlign(CENTER, BOTTOM);
  text(label ,width/2 ,height - 8);
}

void drawGameElements(){

  for(int i = 0; i<moves.length; i++){
  int column = i % 3;
  int row = i / 3;
   
   switch(moves[i]){
   case 1:
   new Cross(column, row);
   break;
   
   case 2:
   new Circle(column, row);

   break;
   }
  }
  
}
