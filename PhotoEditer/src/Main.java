import org.opencv.core.Core; 
import org.opencv.core.Mat; 
import org.opencv.core.MatOfRect; 
import org.opencv.core.Point;
import org.opencv.core.Rect;
import org.opencv.core.Scalar; 
import org.opencv.imgcodecs.Imgcodecs; 
import org.opencv.imgproc.Imgproc; 
import org.opencv.objdetect.CascadeClassifier; 

import processing.core.*;
import java.awt.Rectangle;

public class Main extends PApplet {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		PApplet.main("Main"); // change this to match above class & file name
		//must have this line to call any openCV functions 
		System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
//	}
	
	 // this class has a trained set of faces in order to be able to detect faces in images  
	CascadeClassifier faceDetector = new CascadeClassifier(); 
	Rectangle[] faces;
	PImage img;

//	public void settings() {
		//fullScreen();
//	}

//	public void setup() {
//		background(255);
//		img = loadImage("IMG_5225.JPG");
//		img.resize(width, height);
        faceDetector.load("haarcascade_frontalface_alt.xml"); 
//        noLoop();
//	}

//	public void draw() {
		//image(img, 0, 0);
		
		Mat pic = Imgcodecs.imread("data/IMG_5225.JPG"); //setting mat image
		MatOfRect faceDetect = new MatOfRect();  //create mat of rect object to store rectangles 
		faceDetector.detectMultiScale(pic, faceDetect);  //detects faces and creates rectangles 
		
        for (Rect rect : faceDetect.toArray()) { //draw rect over faces in image 
        	Imgproc.rectangle(pic, new Point(rect.x, rect.y), 
                    new Point(rect.x + rect.width, rect.y + rect.height), 
                    new Scalar(0, 255, 0));
        }
	}
	 
}

