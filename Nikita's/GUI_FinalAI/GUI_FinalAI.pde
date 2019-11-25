import gab.opencv.*;
 
// We need Java rectangles
import java.awt.Rectangle;
 
// Library object
OpenCV opencv;
 
// An image
PImage img;
PImage hat;
PImage halo;
PImage topHat;


// Array of faces found
Rectangle[] faces;
Rectangle[] eyes;
 
 int xPos;
 int yPos;
 int headW;
 int headH;


//GUI stuff
PImage startScreen;
int gameState = 0;
filterScreen two;
paintFilter three;

void setup()
{
  size(700, 700);
  two = new filterScreen();
  three = new paintFilter();

  //fullScreen();
}
void draw()
{
  //switch(gameState) {
    if(keyPressed){
      if(key == '1')
      {
        startScreen();
      }
      if(key == 'a')
      {
        faceSetup(1);
        //filterScreen();
      }
    }
    //switch case to change game state
  //case 0: 
  //  startScreen();
  //  break;
    
  //case 1:
  //  faceDraw(); 
  //  //filterScreen();
  //  break;
  
  //case 2: 
  //  paintFilter();
  //  break;
  //}
  ////case 3: 
  ////  Instructions();
  ////  break;
  ////default: 
  //  splashScreen();
  
}
void keyPressed() {

}

void startScreen() {
  startScreen = loadImage("startScreen.jpg");
  image(startScreen, 0, 0);
  startScreen.resize(width, height);
  image(startScreen, 0, 0);
}
void filterScreen() {
  two.screenDisplay();
  two.displayRect();
}

void paintFilter() {
  three.paintDisplay();
}

void faceSetup(int input)
{
  //size(1000, 1000);
  // Load the image
  img = loadImage("group.JPEG");
  img.resize(width, height);
   
  // Create the OpenCV object
  opencv = new OpenCV(this, img.width, img.height);
  // Put image into OpenCV
  opencv.loadImage(img);
 
  // Which "cascade" are we going to use?
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  //opencv.loadCascade(OpenCV.CASCADE_EYE); 
 
  // Detect!
  faces = opencv.detect();
//}

//  void faceDraw()
//  {
  //background(0);
  // Draw the image
  image(img, 0, 0);
 
 
  // If we found faces
  if (faces != null) {
    // Draw them all
    for (int i = 0; i < faces.length; i++) {
      strokeWeight(2);
      stroke(255, 0, 0);
      noFill();
      int xPos = faces[i].x;
      int yPos = faces[i].y;
      int headW = faces[i].width;
      int headH = faces[i].height;
      //rect(xPos, yPos, headW, headH);
     
     
      if (keyPressed) {
   // if (key == 'a' ) {
     if(input == 1) {
     hat = loadImage("laHat.png" );
      hat.resize(headW*2,headH*2 );
      image(hat, xPos, yPos-headH, headW, headH);
      }
     if (key == 'b' ) {
       halo = loadImage("halo.png" );
      halo.resize(headW*2,headH*2 );
      image(halo, xPos, yPos-headH, headW, headH);
     } 
     if (key == 'c' ) {
       topHat = loadImage("topHat.png" );
      topHat.resize(headW*2,headH*2 );
      image(topHat, xPos, yPos-headH, headW, headH);
     }
     if (key == 'd' ) {
       topHat = loadImage("mouse.png" );
      topHat.resize(headW*2,headH*2 );
      image(topHat, xPos, yPos-headH, headW, headH);
     }
     else {
       println("Error");
      }
    }
    }
  }
}
