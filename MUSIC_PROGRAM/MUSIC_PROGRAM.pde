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
color black=0, purple=#2C08FF;
PFont titleFont;
//
void setup() 
{
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
  background (black);
  rect(width*1/4, height*0, width*1/2, height*1/10);
  fill(purple);
  textAlign (CENTER, CENTER);
  textFont(titleFont, 8);
  text(songMetaData[currentSong].title(), width*1/4, height*0, width*1/2, height*1/10);
   fill(255);
  
}//End draw
//
void keyPressed() {
  if ( key=='p' || key=='P') {
    if (song[currentSong].isPlaying() ) {
      song[currentSong].pause(); 
    } else if (song[currentSong].position() >= song[currentSong].length()-song[currentSong].length()*1/5 ) {
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
  if ( key=='2' || key=='9') println("I do not loop that much press infinite looping");
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
  //
  if ( key =='b' || key =='B') {
  if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - numberOfSongs ) {
        currentSong = numberOfSongs - 1;
      } else {
        currentSong -= 1; // Equivalent code: currentSong = currentSong - 1
      }
      println(currentSong);
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - numberOfSongs ) {
        currentSong = numberOfSongs - 1;
      } else {
        currentSong -= 1;
      }
      println(currentSong);
    }
  }
    
}//End keyPressed
//
void mousePressed() {}//End mousePressed
//
//End MAIN
