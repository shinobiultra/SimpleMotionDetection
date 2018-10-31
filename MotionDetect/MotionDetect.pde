import processing.video.*;

float threshold = 50;

Capture video;
PImage prevFrame;

void setup(){
  size(640,480);
  video = new Capture(this, 640, 480);
  prevFrame = createImage(width, height, RGB);
  
  video.start();
}

void captureEvent(Capture cam){
  prevFrame = cam.get(0,0,cam.width, cam.height);
  cam.read(); 
}

void draw(){
  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      int loc = x + y*width;
      if(dist(red(video.pixels[loc]),green(video.pixels[loc]),blue(video.pixels[loc]),red(prevFrame.pixels[loc]),green(prevFrame.pixels[loc]),blue(prevFrame.pixels[loc])) >= threshold){
         pixels[loc] = color(0);
      }else{
        pixels[loc] = color(255); 
      }
    }
  }
  updatePixels();
}
