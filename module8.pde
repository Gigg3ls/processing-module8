PImage picture;
int pictureX = 0;
int pictureY = 0;
int bitshiftOffsetR = 16;
int bitshiftOffsetG = 8;
int bitshiftOffsetO = 24;
int colorFilter = 0xff;

void settings(){
  picture = loadImage("mountain.jpg");
  size(picture.width, picture.height);
}
void setup() {
}

void draw() {
  image(picture, pictureX, pictureY);
  filters();
}

void filters(){
  loadPixels();
 for (int y = 0; y < picture.height; y++) {
   for(int x = 0; x < picture.width; x++) {
     int pixel = pixels[y * picture.width + x];
    int r = (pixel >> bitshiftOffsetR) & colorFilter;
    int g = (pixel >> bitshiftOffsetG) & colorFilter;
    int b = pixel & colorFilter;
    
    int gray = (max(r, g, b) + min(r, g, b)) / 2;
    pixel = gray << bitshiftOffsetR | gray << bitshiftOffsetG | gray;
    pixel = colorFilter << bitshiftOffsetO | pixel;
    pixels[y * picture.width + x] = pixel;    
   }   
 }
 updatePixels();
}
    //if (r >= g && r >= b) {
    //    pixel = r << 16;
    //  } else if (g >= r && g >= b){
    //    pixel = g << 8;
    //  } else {
    //    pixel = b;
    //  } 
