class paintFilter {

  PImage picture1;
  PImage picture2;
  char num = 1;
  float i = 0;

  paintFilter()
  {
  }

  void paintSetup()
  {
    //size(700, 700);
    picture1 = loadImage("flower.jpeg");
    picture1.resize(width, 585);
    noStroke();
  }

  void keyPaint()
  {
    int i = 0;
    while (i <= 55000) {
      drawPaint();
      i = i + 1 ;
    }
  }

  void drawPaint() {
    
    int x = int(random(picture1.width));
    int y = int(random(picture1.height));
    color c = picture1.get(x, y);
    fill(c, 128);
    rect(x, y, random(3, 10), random(3, 10));
    i++;

  }
}
