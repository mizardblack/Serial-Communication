int knobPin = A0;
int ledPin = 13;

void setup() {
  Serial.begin(9600);
  pinMode(knobPin, INPUT);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  //sensing knob value
  int sensorState = analogRead(knobPin);
  Serial.println(sensorState);

  //reading values from processing
  if (Serial.available ( ) > 0) { // Checking if the Processing IDE has send a value or not
    char state = Serial.read ( ); // Reading the data received and saving in the state variable
    if (state == '1') { // If received data is '1', then turn on LED
      digitalWrite (ledPin, HIGH);
    }
    if (state == '0') { // If received data is '0', then turn off led
      digitalWrite (ledPin, LOW);
    }

  }
  delay(10);
}
