import processing.serial.*;
Serial myPort;
String inBuffer;
float var;

void setup() {
  size(600, 700);
  printArray(Serial.list());

  //open the port you're using
  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.bufferUntil ( '\n' );
}

// Receiving the data from the Arduino IDE
void serialEvent  (Serial myPort) {
  inBuffer = myPort.readStringUntil('\n'); //translate the data from arduino to a String
  if (inBuffer !=null) {
    var = float(trim(inBuffer));
    print("inBuffer=", trim(inBuffer));
    println();
    print("value=", var);
    println();
    delay(1);
  }
}

void draw() {
  //background(0);

  //user intact and send data to arduino
  if ( mousePressed  &&  ( mouseButton  ==  LEFT ) ) {
    background(#84BE6A);
    myPort.write ( '1' ) ; // send a '1' to the Arduino IDE
  } else {
    background(80);
    myPort.write ( '0' ) ; // Send a '0' to the Arduino IDE
  }

  //define font style and draw text "Simone"
  float radius = map(var, 0, 700, 10, 55);
  println("radius = ", radius);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(radius);
  text("Simone", width/2, height/2);
}
