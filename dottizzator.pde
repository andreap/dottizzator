//import processing.pdf.*;

String filename = "heart.jpg";
PImage pic;

color bg = 0;
 
void setup() {
  pic = loadImage(filename); // picture
  size(pic.width,pic.height);
  //beginRecord(PDF, "pdf/pdf-####.pdf");
}

 
void draw() {
  pixelate(4, "CIRCLE", false, 1, 0);
  //drawGrid(2, #ffffff, 1, "V");
  
  //endRecord();
}


void pixelate(int pixelSize, String rectOrCircle, Boolean pixOpacity, float margin, color bg) {
  boolean type;
  
  if (rectOrCircle == "CIRCLE") {
    type = true;
  } else {
    type = false;
  }
  
  background(bg);
  
  for (int y = pixelSize; y <= height; y += pixelSize) {
    for (int x = pixelSize; x <= width; x += pixelSize) {
      smooth();
      noStroke();
      color c = color(pic.pixels[x + (y * width)]);
      fill(c);
      if (pixOpacity == true) {
        float radius = pixelSize * (brightness(pic.pixels[x + (y * width)]) / 255);
        if (type == true) {
          ellipse(x, y,radius,radius);
        } else {
          rect(x,y,radius,radius);
        }
      } else {
        if (type == true) {
          ellipse(x, y,pixelSize-margin,pixelSize-margin);
        } else {
          rect(x,y,pixelSize-margin,pixelSize-margin);
        }
      }
    }
  }
}


void drawGrid(int gridSize, color lineColor, float lineWeight, String direction) {
  boolean linesDirection;
  
  background(pic);
  
  noFill();
  strokeWeight(lineWeight);
  stroke(lineColor);
  
  for (int i=gridSize; i<pic.width; i+=gridSize) {
    if (direction == "V") {
      line(i,0,i,pic.height);
    } else if (direction == "H") {
      line(0,i,pic.width,i);
    } else {
      line(0,i,pic.width,i);
      line(i,0,i,pic.height);
    }    
  }
}


void mouseReleased() {
  saveFrame("img/image-####.png");
  println("Immagine salvata nella cartella /img");
}

