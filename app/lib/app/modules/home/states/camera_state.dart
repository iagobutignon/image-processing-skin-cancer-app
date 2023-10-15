class CameraState {
  int flash = 1;  
  double zoom = 0;


  int switchFlash() {
    flash < 4 ? flash++ : flash = 1;
    return flash;
  }
}