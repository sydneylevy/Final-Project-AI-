class filterScreen {
  
  PImage filterScreen;
  PImage layer;
  filterScreen()
  {
  
  }
  
  void screenDisplay() {
      filterScreen = loadImage("filterScreen.jpg");
  filterScreen.resize(width, height);
  image(filterScreen, 0, 0);
  
  layer = loadImage("group.JPEG");
  layer.resize(width, 585);
  image(layer, 0, 0);
  }
    
  void displayRect()
  {
    fill(0);
    rect(75, 620, 60, 60);
    rect(175,620, 60, 60);
    rect(275,620, 60, 60);
    rect(375,620, 60, 60);
    rect(475,620, 60, 60);
    rect(575,620, 60, 60);
    
    fill(#DBD3E8);
    textSize(20);
    text("2", 100, 655);
    text("3", 200, 655);
    text("4", 300, 655);
    text("5", 400, 655);
    text("6", 500, 655);
    text("7", 600, 655);
    fill(#DBD3E8);
    textSize(15);
    text("Face", 80, 675);
    text("Eye", 180, 675);
    text("Paint", 280, 675);
    text("Outline", 380, 675);
    text("BW", 480, 675);
    text("Filter", 580, 675);
    //rectangles -black
  }
  //press key to try out the filters - start screen 
  //on rectangle have the case numbers 
  
}
