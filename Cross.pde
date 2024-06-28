class Cross {
  int column;
  int row;

  Cross(int column, int row) {
    this.column = column;
    this.row = row;
    this.display();
  }

  void display() {
    strokeWeight(10);
    stroke(#f5e084);
    pushMatrix();
    translate(50 + column * 100, 50 + row * 100);
    line(-20, -20, 20, 20);
    line(-20, 20, 20, -20);
    popMatrix();
  }
}
