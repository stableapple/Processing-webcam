import g4p_controls.*;

import processing.video.*;
boolean clicked = false;
Capture cam;
GButton btnSave;
int n=1;
void setup() {
  size(640, 480);

  String[] cameras = Capture.list();
  btnSave = new GButton(this, width-60, height-70, 38, 24);
  btnSave.setText("Capture");
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);

  if (mouseX>250 && mouseY>150 && mouseX<350 && mouseY<200) { //if hoover
    if (clicked) {// and  clicked
      fill( 101, 131, 101);// dark green
    }
    else {// not clicked
      fill(131);//darker gray
    }

    if (mousePressed) {// if hover and clicked... change flag
      clicked = !clicked; // toogle boolean state
    }
  }
}
public void handleButtonEvents(GButton button, GEvent event) {
  if (button == btnSave) {
    saveFrame("frame_" + n + ".jpg");
    n++;
  }
}
