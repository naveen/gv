import processing.opengl.*;

BufferedReader reader;
String line;
int i, x;

void setup() {
  size(screen.width, screen.height, OPENGL);
  frameRate(1000);
  background(0);
  colorMode(HSB);
  smooth();
  noStroke();
  
  i = x = 0;
  reader = createReader("genome.txt");
}

void draw() {

  try {
    line = reader.readLine();
  } catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  if (line == null) {
    // Stop reading because of an error or file is empty
    noLoop();
  } else {
    String[] pieces = split(line, TAB);
    String letters = pieces[3];

    // catg
    int outputHue = 50;
//    color c = color(137, 66, 18);
    color c = #894212;
    
    if (letters.length() == 2) {
      char left = letters.charAt(0);
      switch (left) {
        case 'C':
          c = #894212;
          outputHue = 50;
          break;
        case 'A':
          c = #cc9900;
          outputHue = 125;
          break;
        case 'T':
          c = #d89e36;
          outputHue = 200;
          break;
        case 'G':
          c = #b9d7a5;
          outputHue = 250;
          break;
      }

    }
    
    fill(c);//, 255, 255);
    rect(x, i, 5, 10);
    i += random(10, 20);
    
    if (i > height) {
      x += 10;
      i = 0;
    }

//    println(outputHue);
//    println(letters);
    
//    point(x, y);
  }
}

// saveFrame - to save to a file

