import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;
AudioPlayer song1;
//
void setup() 
{
  minim = new Minim(this);
  song1 = minim.loadFile("MusicDownload/groove.mp3");
}//End setup
//
void draw() {
  if ( song1.isLooping() ) println("There are", song1.loopCount(), "loops left.");
  if ( song1.isPlaying() && !song1.isLooping() ) println("Play Once");
}//End draw
//
void keyPressed() {
  String keystr = String.valueOf(key); //Must press a number
  println("Number of Repeats is", keystr); 
  int loopNum = int(keystr); //Local Variable plays once and loops loopNum of times
  if ( key=='l' || key=='L' ) song1.loop(loopNum); //Parameter is number of loops
}//End keyPressed
//
void mousePressed() {}//End mousePressed
//
//End MAIN
