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
AudioMetaData songMetaData1;
//
color black=0, purple=#2C08FF;
PFont titleFont;
//
void setup() 
{
  minim = new Minim(this);
  song1 = minim.loadFile("data/groove.mp3");
  songMetaData1 = song1.getMetaData();
  titleFont = createFont ("Harrington", 55);
  
  //
  println("start of console");
  println("click the console to finish starting the program");
  println("title", songMetaData1.title() );
}//End setup
//
void draw() {
  if ( song1.isLooping() && song1.loopCount()!=-1 ) println("There are", song1.loopCount(), "loops left.");
  if ( song1.loopCount()==-1) println("looping infinite");
  if ( song1.isPlaying() && !song1.isLooping() ) println("Play Once");
  //
  println("song position", song1.position(), "song length", song1.length() );
  //
  background (black);
  rect(width*1/4, height*0, width*1/2, height*1/10);
  fill(purple);
  textAlign (CENTER, CENTER);
  textFont(titleFont, 8);
  text(songMetaData1.title(), width*1/4, height*0, width*1/2, height*1/10);
   fill(255);
  
}//End draw
//
void keyPressed() {
  if ( key=='p' || key=='P') {
    if (song1.isPlaying() ) {
      song1.pause(); 
    } else if (song1.position() >= song1.length()-song1.length()*1/5 ) {
      song1.rewind();
      song1.play();
    } else { 
      song1.play(); 
    }
  }
  //
  println(key);
  if ( key=='1' || key=='9') { 
    if (key=='1') println("Looping Once");
    if (key=='9') println("Looping 9 times");
    String keystr = String.valueOf(key); //Must press a number
    println("Number of Repeats is", keystr); 
    int loopNum = int(keystr); //Local Variable plays once and loops loopNum of times
    song1.loop(loopNum); //Parameter is number of loops

    // if ( key=='l' || key=='L' ) song1.loop(loopNum); //Parameter is number of loops
}
  if ( key=='i' || key=='I') song1.loop();
  if ( key=='2' || key=='9') println("I do not loop that much press infinite looping");
  //if ( key >= '2' && key!'9' ) println("I donot loop that much, press infinite loop.");
  //
  //mute is similar to pause button
  if (key=='m' || key=='M') {
    if (song1.isMuted() ) {
      song1.unmute();
    } else { 
      song1.mute();
    }
  }
  //
  if (key=='f' || key=='F') song1.skip(1000);
  if (key=='r' || key=='R') song1.skip(-1000);
  //
  if (key=='s' || key=='S') {
    if (song1.isPlaying() ) {
      song1.pause();
      song1.rewind();
    } else {
      song1.rewind();
    }
  }
}//End keyPressed
//
void mousePressed() {}//End mousePressed
//
//End MAIN
