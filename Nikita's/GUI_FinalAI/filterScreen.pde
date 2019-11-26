class filterScreen {

  PImage filterScreen;
  PImage layer;
  filterScreen()
  {
  }

  void screenDisplay() {
    filterScreen = loadImage("filterScreen.png");
    filterScreen.resize(width, height);
    image(filterScreen, 0, 0);

    //layer = loadImage("group.JPEG");
    //layer.resize(width, 585);
    //image(layer, 0, 0);
  }

  void displayRect()
  {
    noStroke();
    fill(#1E0A3B, 100);
    rect(10, 610, 120, 80);
    rect(150, 610, 120, 80);
    rect(290, 610, 120, 80);
    rect(430, 610, 120, 80);
    rect(570, 610, 120, 80);
    //rect(660,620, 120, 120);

    fill(#DBD3E8);
    textSize(20);
    text("a b c d e", 25, 640);
    text("f g h i j", 180, 640);
    text("k", 345, 640);
    text("m", 485, 640);
    text("n", 625, 640);
    fill(#DBD3E8);
    textSize(20);
    text("Face", 45, 670);
    text("Eye", 195, 670);
    text("Paint", 330, 670);
    text("Static", 465, 670);
    text("B & W", 605, 670);
    textSize(10);
    text("Press 1 for instructions, press x to exit", 230, height -5);

    //rectangles -black
  }
  //press key to try out the filters - start screen 
  //on rectangle have the case numbers
}
