class paintFilter {
  
  PImage filterScreen;
  PImage layer;
  paintFilter()
  {
  
  }
  
  void paintDisplay() {
      filterScreen = loadImage("filterScreen.jpg");
  filterScreen.resize(width, height);
  image(filterScreen, 0, 0);
  
  layer = loadImage("group.JPEG");
  layer.resize(width, 585);
  image(layer, 0, 0);
  
  fill(#DBD3E8);
  textSize(40);
  text("Paint Filter", 250, 650);
  }
    
  
  //press key to try out the filters - start screen 
  //on rectangle have the case numbers 
  
}
