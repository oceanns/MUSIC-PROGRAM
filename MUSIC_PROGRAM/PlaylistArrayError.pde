void playListArrayError() {
  
if ( currentSong >= numberOfSongs - 1 ) { //Throws error: ArrayIndexOutOfBounds
    currentSong = numberOfSongs - numberOfSongs; // Alternate assignment operator: currentSong-=currentSong
  } else {
    currentSong++;
  }//End Catch "ArrayIndexOutOfBounds"
}//End PlayListArrayError
