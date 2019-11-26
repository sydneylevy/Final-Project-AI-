import gab.opencv.*;

// We need Java rectangles
import java.awt.Rectangle;

// Library object
OpenCV opencv;
OpenCV opencv2;


//// We need Java rectangles
//import java.awt.Rectangle;

//// Library object
//OpenCV opencv;
//OpenCV opencv2;



//GUI stuff
PImage startScreen;
int gameState = 0;
filterScreen two;
paintFilter three;
colorSwitch four;
BandW five;
void setup()
{
  size(700, 700);
  two = new filterScreen();
  three = new paintFilter();
  four = new colorSwitch();
  five = new BandW();
  startScreen();
}

void draw()
{
}

void keyPressed() { //TOGETHER
  if (key == ' ') //press space to go to filters
  {
    filterScreen();
  }
  if (key == '1') //press 1 for instructions 
  {
    instructions();
  }
  if (key == '2') //press 2 for home page 
  {
    startScreen();
  }
  if (key == 'a') //press a for face detection 1
  {
    faceSetup(1);
  }
  if (key == 'b') //press b for face detection 2
  {
    faceSetup(2);
  }
  if (key == 'c') //press c for face detection 3
  {
    faceSetup(3);
  }
  if (key == 'd') //press d for face detection 4
  {
    faceSetup(4);
  }
  if (key == 'e') //press e for face detection 5
  {
    faceSetup(5);
  }
  if (key == 'f')
  {
    eyeDetect(1);
  }
  if (key == 'g')
  {
    eyeDetect(2);
  }
  if (key == 'h')
  {
    eyeDetect(3);
  }
  if (key == 'i')
  {
    eyeDetect(4);
  }
  if (key == 'j')
  {
    eyeDetect(5);
  }
  if (key == 'k')
  {
    paintFilter();
  }
  if (key == 'm')
  {
    colorSwitch();
  }
  if (key == 'n')
  {
    BWdraw();
  }
  if (key == 'x') 
  {
    exit();
  }
}

void startScreen() { //NIKITA 
  startScreen = loadImage("startScreen.jpg");
  image(startScreen, 0, 0);
  startScreen.resize(width, height);
  image(startScreen, 0, 0);
  textSize(20);
  text("Press spacebar to go to start", 220, height - 40);
  text("Press 1 for instructions", 240, height -10);
}
void filterScreen() { //TOGETHER 
  two.screenDisplay();
  two.displayRect();
}

void paintFilter() { //NIKITA 
  filterScreen();
  three.paintSetup();
  three.keyPaint();
}

void BWdraw() //TOGETHER
{
  filterScreen();
  five.BWdraw();
}

void colorSwitch()  //SYDNEY 
{
  filterScreen();
  four.colorSetup();
}

void instructions() { //SYDNEY 
  background(#1E0A3B); 
  textSize(20);
  text("Press any key in the boxes to toggle between filters", 100, 200); 
  text("Press the space bar to start using filters", 100, 300); 
  text("Press 2 to go back to the home screen", 100, 400); 
  text("Press x to exit", 100, 500);
}


void faceSetup(int input) //SYDNEY 
{
  // An image
  PImage img;
  PImage hat;
  PImage halo;
  PImage topHat;
  PImage mouse; 
  PImage devil; 


  // Array of faces found
  Rectangle[] faces;
  Rectangle[] eyes;

  int xPos;
  int yPos;
  int headW;
  int headH;

  filterScreen();
  img = loadImage("kardashians.jpg");
  

  img.resize(width, height);

  opencv = new OpenCV(this, img.width, img.height);   // Create the OpenCV object
  opencv.loadImage(img); //load image into openCV
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); //load face detection cascade

  faces = opencv.detect(); //detect faces 

  img.resize(width, 585);
  image(img, 0, 0);

  if (faces != null) {
    // find faces
    for (int i = 0; i < faces.length; i++) {
      strokeWeight(2);
      stroke(255, 0, 0);
      noFill();
      xPos = faces[i].x; //top left x coordinate 
      yPos = faces[i].y; //top left y coordinate
      headW = faces[i].width; //width of rectangle/face
      headH = faces[i].height; //height of rectangle/face 
      //rect(xPos, yPos, headW, headH); ..line to draw rectangles around face 

      if (input == 1) { //dodgers hat 
        hat = loadImage("laHat.png" );
        hat.resize(headW*2, headH*2 );
        image(hat, xPos, yPos-(1.5*headH) + 10, headW, headH);
      }
      if (input == 2) { //halo
        halo = loadImage("halo.png" );
        halo.resize(headW*2, headH*2 );
        image(halo, xPos, yPos-(2*headH) + 10, headW, headH);
      }
      if (input == 3) { //top hat
        topHat = loadImage("topHat.png" );
        topHat.resize(headW*2, headH*2 );
        image(topHat, xPos, yPos-(1.5*headH) + 10, headW, headH);
      }
      if (input == 4) { //minnie ears 
        mouse = loadImage("mouse.png" );
        mouse.resize(headW*2, headH*2 );
        image(mouse, xPos, yPos-(1.5*headH) + 10, headW, headH);
      }
      if (input == 5) { //devil horns 
        devil = loadImage("devil1.png" );
        devil.resize(headW*2, headH*2 );
        image(devil, xPos, yPos-(1.5*headH)+ 10, headW, headH);
      }
    }
  }
}

void eyeSetup() //NIKITA
{
  PImage img;

  Rectangle[] faces;
  Rectangle[] eyes;

  img = loadImage("hpCrew.jpg");
  img.resize(width, 585);

  opencv = new OpenCV(this, img.width, img.height);
  opencv2 = new OpenCV(this, img.width, img.height);

  opencv.loadImage(img);
  opencv2.loadImage(img);

  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  opencv2.loadCascade(OpenCV.CASCADE_EYE); 

  faces = opencv.detect();
  eyes = opencv2.detect();
  
  filterScreen();

  image(img, 0, 0);

  if (faces != null) {
    for (int i = 0; (i < faces.length); i++) {
      strokeWeight(2);
      stroke(255, 0, 0);
      noFill();
      int faceX1 = faces[i].x;
      int faceY1 = faces[i].y ;
      int faceX2 = faceX1 + faces[i].width;
      int faceY2 = faceY1 + faces[i].height;
      int faceW = faces[i].width;
      int faceH = faces[i].height;
      int halfFace = (faceY2 - faceY1)/2;
      rect(faceX1, faceY1, faceW, faceH);

      for (int j = 0; j < eyes.length; j++) {
        int eyeX1 = eyes[j].x;
        int eyeY1 = eyes[j].y;
        int eyeX2 = eyeX1 + eyes[j].width;
        int eyeY2 = eyeY1 + eyes[j].height;
        int eyeW = eyes[j].width;
        int eyeH = eyes[j].height;

        if (eyeY1 < (faceY1 + halfFace) && eyeY1 > faceY1 && eyeH < (faceH - halfFace) && (eyeX1 > faceX1 && eyeX2 < faceX2)) {
          //eye top left < half face line && eye top lefft > face top left && eye height < half face height && (eye x top left > face x top left && eye x bottom right < face x bottom right
          rect(eyeX1, eyeY1, eyeW, eyeH);
        }
      }
    }
  }
}

void eyeDetect(int input) //NIKITA 
{
  filterScreen();

  PImage img;
  PImage harryPotter;
  PImage kanye;
  PImage red;
  PImage watermelon; 
  PImage diamond; 
  int faceW;
  int faceH;
  int faceX; 
  int faceY;
  Rectangle[] faces;

  img = loadImage("hpCrew.jpg");
  img.resize(width, 585);

  opencv = new OpenCV(this, img.width, img.height);
  opencv.loadImage(img);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  faces = opencv.detect();

  image(img, 0, 0);


  // If we found faces
  if (faces != null) {
    // Draw them all
    for (int i = 0; (i < faces.length); i++) {
      strokeWeight(2);
      stroke(255, 0, 0);
      noFill();
      faceX = faces[i].x;
      faceY = faces[i].y + (faces[0].height/5);
      faceW = faces[i].width;
      faceH = faces[i].height/2;
      //rect(faceX, faceY, faceW, faceH);

      if (input == 1) { //harry potter glasses 
        harryPotter = loadImage("harryPotter.png" );
        harryPotter.resize(faceW*2, faceH*2 );
        image(harryPotter, faceX, faceY-10, faceW, faceH);
      }

      if (input == 2) { //kanye glasses 
        kanye = loadImage("kanye.png" );
        kanye.resize(faceW*2, faceH*2 );
        image(kanye, faceX, faceY-10, faceW, faceH);
      }

      if (input == 3) { //red sunglasses 
        red = loadImage("redSunglasses.png" );
        red.resize(faceW*2, faceH*2 );
        image(red, faceX, faceY-10, faceW, faceH);
      }

      if (input == 4) { //watermelon glasses 
        watermelon = loadImage("watermelon.png" );
        watermelon.resize(faceW*2, faceH*2 );
        image(watermelon, faceX, faceY-10, faceW, faceH);
      }

      if (input == 5) { //diamond glasses 
        diamond = loadImage("diamond.png" );
        diamond.resize(faceW*2, faceH*2 );
        image(diamond, faceX, faceY-10, faceW, faceH);
      }
    }
  }
}
