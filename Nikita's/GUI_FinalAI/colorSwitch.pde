class colorSwitch
{
  PImage picture1;
  colorSwitch()
  {
  }


  void colorSetup()
  {
    picture1 = loadImage("vintage.JPG");
    picture1.resize(width, 585);
    image(picture1, 0, 0);
    colorDraw();
  }
  void colorDraw()
  {
    
    loadPixels();
    for (int i = 0; i < pixels.length; i++) {
      float r = red(pixels[i]);
      float g = green(pixels[i]);
      float b = blue(pixels[i]);

      pixels[i] = color(random(r), random(g), random(b));
    }
    updatePixels();
  }
}
