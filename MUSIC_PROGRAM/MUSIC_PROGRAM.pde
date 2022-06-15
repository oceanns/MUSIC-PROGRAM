import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;
int numberOfSongs = 3;
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;
color black=0, purple=#2C08FF, white=#FFFFFF;
PFont titleFont;
//
//
float buttonX1, buttonY1, buttonWidth1, buttonHeight1;
float buttonX2, buttonY2, buttonWidth2, buttonHeight2;
float buttonX3, buttonY3, buttonWidth3, buttonHeight3;
float buttonX4, buttonY4, buttonWidth4, buttonHeight4;
float buttonX5, buttonY5, buttonWidth5, buttonHeight5;
float buttonX6, buttonY6, buttonWidth6, buttonHeight6;
float buttonX7, buttonY7, buttonWidth7, buttonHeight7;

void setup() 
{
  //fullScreen();
  //
  //play pause
  buttonX1 = displayWidth*1/4;
  buttonY1 = displayHeight*2/8;
  buttonWidth1 = displayWidth*1/9;
  buttonHeight1 = displayHeight*1/9;
  //
  //forward
  buttonX2 = displayWidth*1.5/4;
  buttonY2 = displayHeight*2/8;
  buttonWidth2 = displayWidth*1/9;
  buttonHeight2 = displayHeight*1/9;
  //
  //rewind
  buttonX3 = displayWidth*2.0/4;
  buttonY3 = displayHeight*2/8;
  buttonWidth3 = displayWidth*1/9;
  buttonHeight3 = displayHeight*1/9;
  //
  //next
  buttonX4 = displayWidth*2.5/4;
  buttonY4 = displayHeight*2/8;
  buttonWidth4 = displayWidth*1/9;
  buttonHeight4 = displayHeight*1/9;
  //
  //back
  buttonX5 = displayWidth*3.0/4;
  buttonY5 = displayHeight*2/8;
  buttonWidth5 = displayWidth*1/9;
  buttonHeight5 = displayHeight*1/9;
  //
  //mute
  buttonX6 = displayWidth*3.5/4;
  buttonY6 = displayHeight*2/8;
  buttonWidth6 = displayWidth*1/9;
  buttonHeight6 = displayHeight*1/9;
  //
  //loop
  buttonX7 = displayWidth*4/4;
  buttonY7 = displayHeight*2/8;
  buttonWidth7 = displayWidth*1/9;
  buttonHeight7 = displayHeight*1/9;
  //
  minim = new Minim(this);
  song[currentSong] = minim.loadFile("data/groove.mp3");
  song[currentSong+=1] = minim.loadFile("data/jingle.mp3");
  song[currentSong+=1] = minim.loadFile("data/marcus_kellis_theme.mp3");
  currentSong-=currentSong;
  //
  for (int i=currentSong ; i<song.length ; i++) {
    songMetaData[i] = song[i].getMetaData();
  }
  //
  songMetaData[0] = song[0].getMetaData();
  songMetaData[1] = song[1].getMetaData();
  songMetaData[2] = song[2].getMetaData();
  titleFont = createFont ("Harrington", 55);
  //
  println("start of console");
  println("click the console to finish starting the program");
  println("title", songMetaData[currentSong].title() );
}//End setup
//
void draw() {
  if ( song[currentSong].isLooping() && song[currentSong].loopCount()!=-1 ) println("There are", song[currentSong].loopCount(), "loops left.");
  if ( song[currentSong].isLooping() && song[currentSong].loopCount()==-1) println("looping infinite");
  if ( song[currentSong].isPlaying() && !song[currentSong].isLooping() ) println("Play Once");
  //
  println("current song", currentSong);
  println("song position", song[currentSong].position(), "song length", song[currentSong].length() );
  //
  //
  background (black); //Reminder of OS-Level Button
  rect(width*1/4, height*0, width*1/2, height*1/10);
  fill(purple); //Ink, hexidecimal copied from Color Selector
  textAlign (CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  //Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
  textFont(titleFont, 40); //Change the number until it fits, largest font size
  text(songMetaData[currentSong].title(), displayWidth*1/4, displayHeight*0, displayWidth*1/2, displayHeight*1/10);
  fill(255); //Reset to white for rest of the program
  //
  { fill(white);
    rect(buttonX1, buttonY1, buttonWidth1, buttonHeight1); }
  //
  { fill(white);
    rect(buttonX2, buttonY2, buttonWidth2, buttonHeight2); }
    //
   { fill(white);
   rect(buttonX3, buttonY3, buttonWidth3, buttonHeight3); }
    //
   { fill(white);
   rect(buttonX4, buttonY4, buttonWidth4, buttonHeight4); }
    //
   { fill(white);
   rect(buttonX5, buttonY5, buttonWidth5, buttonHeight5); }
   //
   { fill(white);
   rect(buttonX6, buttonY6, buttonWidth6, buttonHeight6); }
    //
   { fill(white);
   rect(buttonX7, buttonY7, buttonWidth7, buttonHeight7); }
  
}//End draw
//
void keyPressed() {
  if ( key=='p' || key=='P') {
    if ( song[currentSong].isPlaying() ) { 
      song[currentSong].pause();
    } else if ( song[currentSong].position() >= song[currentSong].length()-song[currentSong].length()*1/5 ) {//Special Situation: at the end of the song, rewind (built-in stop button)
      //End of Song Calculation: hardcode "ending of song" within 1 second of End-Of-File, song1.length()-1000
      //Alternate End of Song Calculation: listen to 80% of the song, last 20% is "The End"
      song[currentSong].rewind();
      song[currentSong].play();
    } else { 
      song[currentSong].play();
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
    song[currentSong].loop(loopNum); //Parameter is number of loops
    
    // if ( key=='l' || key=='L' ) song1.loop(loopNum); //Parameter is number of loops
  }

  if ( key=='i' || key=='I') song[currentSong].loop();
  if ( key>='2' || key!='9') println("I do not loop that much press infinite looping");
  //if ( key >= '2' && key!'9' ) println("I donot loop that much, press infinite loop.");
  //
  //mute is similar to pause button
  if (key=='m' || key=='M') {
    if (song[currentSong].isMuted() ) {
      song[currentSong].unmute();
    } else { 
      song[currentSong].mute();
    }
  }
  //
  if (key=='f' || key=='F') song[currentSong].skip(1000);
  if (key=='r' || key=='R') song[currentSong].skip(-1000);
  //
  if (key=='s' || key=='S') {
    if (song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
    } else {
      song[currentSong].rewind();
    }
  }
  //
  if (key=='n' || key=='N'); {
     if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      playListArrayError();
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      playListArrayError();
      song[currentSong].play();
  } }
  //
  /*if ( key =='b' || key =='B') {
  if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong >= numberOfSongs -1 ) {
        currentSong = numberOfSongs - numberOfSongs;
    } else { 
      currentSong++;
      }
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      if (currentSong == numberOfSongs - 1) {
        currentSong = numberOfSongs - numberOfSongs;
      } else {
        currentSong++;
      }
     song[currentSong].play();
    }
  }
  */
}//End keyPressed
//
void mousePressed() {

if (mouseX>=buttonX1 && mouseX<=buttonX1 + buttonWidth1 && mouseY>=buttonY1 && mouseY<=buttonY1 + buttonHeight1);
  if ( song[currentSong].isPlaying() ) { 
      song[currentSong].pause();
    } else if ( song[currentSong].position() >= song[currentSong].length()-song[currentSong].length()*1/5 ) {//Special Situation: at the end of the song, rewind (built-in stop button)
      song[currentSong].rewind();
      song[currentSong].play();
    } else { 
      song[currentSong].play();}
 if (mouseX>=buttonX2 && mouseX<=buttonX2 + buttonWidth2 && mouseY>=buttonY2 && mouseY<=buttonY2 + buttonHeight2);
    song[currentSong].skip(1000);
    //   
 if (mouseX>=buttonX3 && mouseX<=buttonX3 + buttonWidth3 && mouseY>=buttonY3 && mouseY<=buttonY3 + buttonHeight3);
    song[currentSong].skip(-1000);
    //
 if (mouseX>=buttonX4 && mouseX<=buttonX4 + buttonWidth4 && mouseY>=buttonY4 && mouseY<=buttonY4 + buttonHeight4);
    
    //
if (mouseX>=buttonX5 && mouseX<=buttonX5 + buttonWidth5 && mouseY>=buttonY5 && mouseY<=buttonY5 + buttonHeight5);
     
 if (mouseX>=buttonX6 && mouseX<=buttonX6 + buttonWidth6 && mouseY>=buttonY6 && mouseY<=buttonY6 + buttonHeight6);
 
 if (mouseX>=buttonX7 && mouseX<=buttonX7 + buttonWidth7 && mouseY>=buttonY7 && mouseY<=buttonY7 + buttonHeight7);


}//End mousePressed
//
//End MAIN
