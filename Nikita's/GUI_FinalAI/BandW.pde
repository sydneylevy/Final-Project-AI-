class BandW {
  PImage picture1; 
  
  BandW() {
  }

  void BWdraw() {
    picture1 = loadImage("ellen.jpg");
    picture1.resize(width, 585);
    picture1.filter(GRAY);
    image(picture1, 0, 0);
  }
}
