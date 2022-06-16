/*float buttonX1, buttonY1, buttonWidth1, buttonHeight1;
float buttonX2, buttonY2, buttonWidth2, buttonHeight2;
float buttonX3, buttonY3, buttonWidth3, buttonHeight3;
float buttonX4, buttonY4, buttonWidth4, buttonHeight4;
float buttonX5, buttonY5, buttonWidth5, buttonHeight5;
float buttonX6, buttonY6, buttonWidth6, buttonHeight6;
float buttonX7, buttonY7, buttonWidth7, buttonHeight7;
//
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
  song[currentSong] = minim.loadFile("data/groove.mp3");
  song[currentSong+=1] = minim.loadFile("data/jingle.mp3");
  song[currentSong+=1] = minim.loadFile("data/marcus_kellis_theme.mp3");
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
   //
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
 
 if (mouseX>=buttonX7 && mouseX<=buttonX7 + buttonWidth7 && mouseY>=buttonY7 && mouseY<=buttonY7 + buttonHeight7);*/
