//import gab.opencv.*;
//import java.awt.Rectangle;

//class faceDetect {
//  // An image
//  PImage img;
//  OpenCV opencv;
//  // Array of faces found
//  Rectangle[] faces;
//  Rectangle[] eyes;

//  //opencv = new OpenCV(this, img);

//  void setup()
//  {
//    // Load the image
//    img = loadImage("dog.jpg");
//    img.resize(585, 585);
//    opencv = new OpenCV(this, img.width, img.height);

//    // Put image into OpenCV
//    opencv.loadImage(img);

//    // Which "cascade" are we going to use?
//    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
//    //opencv.loadCascade(OpenCV.CASCADE_EYE); 

//    // Detect!
//    faces = opencv.detect();
//  }


//  void display() {
//    background(0);
//    // Draw the image
//    image(img, 0, 0);



//    // If we found faces
//    if (faces != null) {
//      // Draw them all
//      for (int i = 0; i < faces.length; i++) {
//        strokeWeight(2);
//        stroke(255, 0, 0);
//        noFill();
//        int xPos = faces[i].x;
//        int yPos = faces[i].y;
//        int headW = faces[i].width;
//        int headH = faces[i].height;
//        //rect(xPos, yPos, headW, headH);


//        fill(255, 0, 0);
//        rect(xPos, yPos - headH, headW, headH);
//      }
//    }
//  }
//}
