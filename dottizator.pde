import processing.pdf.*;

String filename = "heart.jpg";
PImage pic;

int cell = 9; // pixel size

color bg = 255;
 
void setup() {
  pic = loadImage(filename); // picture
  size(pic.width,pic.height);
  beginRecord(PDF, "pdf/pdf-####.pdf");
}

 
void draw() {
  background(bg);
  
  for (int y = cell; y <= height; y += cell) {
    for (int x = cell; x <= width; x += cell) {
      noStroke();
      smooth();
      
      color c = color(pic.pixels[x + (y * width)]);
      fill(c);
 
      float radius = cell * (brightness(pic.pixels[x + (y * width)]) / 255);
      ellipse(x, y, radius, radius);
    }
  }
  endRecord();
}

void mouseReleased() {
  saveFrame("img/image-####.png");
  println("Immagine salvata nella cartella /img");
}

