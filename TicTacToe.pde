Grid grid;

boolean isPlayer1Playing = true;
int[] moves = new int[9];
boolean gameOver = false;
String winner = "";

void setup() {
  size(300, 330);
  grid = new Grid();
}

void draw() {
  background(#333333);
  grid.display();
  drawPlayerLabel();
  drawGameElements();
  checkWinner();
  drawRestartButton();
}

void mousePressed() {
  if (gameOver) {
    if (mouseX > 100 && mouseX < 200 && mouseY > height / 2 - 15 && mouseY < height / 2 + 15) {
      resetGame();
    }
    return;
  }

  int column = mouseX / 100;
  int row = mouseY / 100;

  int indexInArray = column + (row * 3);

  if (moves[indexInArray] == 0) {
    if (isPlayer1Playing) {
      moves[indexInArray] = 1;
    } else {
      moves[indexInArray] = 2;
    }
    isPlayer1Playing = !isPlayer1Playing;
  }
}

void drawPlayerLabel() {
  if (gameOver) {
    fill(#ffffff);
    textSize(16);
    textAlign(CENTER, BOTTOM);
    text(winner + " Wins!", width / 2, height - 8);
  } else {
    String label = isPlayer1Playing ? "Player 1" : "Player 2";
    fill(#ffffff);
    textSize(16);
    textAlign(CENTER, BOTTOM);
    text(label, width / 2, height - 8);
  }
}

void drawGameElements() {
  for (int i = 0; i < moves.length; i++) {
    int column = i % 3;
    int row = i / 3;
    switch (moves[i]) {
      case 1:
        new Cross(column, row);
        break;
      case 2:
        new Circle(column, row);
        break;
    }
  }
}

void checkWinner() {
  int[][] winPatterns = {
    {0, 1, 2}, {3, 4, 5}, {6, 7, 8}, // rows
    {0, 3, 6}, {1, 4, 7}, {2, 5, 8}, // columns
    {0, 4, 8}, {2, 4, 6}             // diagonals
  };

  for (int[] pattern : winPatterns) {
    if (moves[pattern[0]] != 0 && moves[pattern[0]] == moves[pattern[1]] && moves[pattern[0]] == moves[pattern[2]]) {
      gameOver = true;
      winner = moves[pattern[0]] == 1 ? "Player 1" : "Player 2";
      return;
    }
  }

  // Check for draw
  boolean draw = true;
  for (int move : moves) {
    if (move == 0) {
      draw = false;
      break;
    }
  }
  if (draw) {
    gameOver = true;
    winner = "No one";
  }
}

void drawRestartButton() {
  if (gameOver) {
    fill(#ffffff);
    rect(100, height / 2 - 15, 100, 30);
    fill(#000000);
    textSize(16);
    textAlign(CENTER, CENTER);
    text("Restart", 150, height / 2);
  }
}

void resetGame() {
  isPlayer1Playing = true;
  moves = new int[9];
  gameOver = false;
  winner = "";
}
