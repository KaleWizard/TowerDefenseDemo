// Text class from Assignment 3
// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, $, +, =, and ? have been added

// This function only displays Strings with all capital character and/or spaces
// The font style was modeled after Minecraft's font
// https://fontmeme.com/fonts/static/34773/minecraft-font-character-map.png

class Text {
  String string; // Text to display
  int stringLength;
  color c;
  // Top-left x, y position
  float x;
  float y;
  float pixelSize;

  Text(String tempString, float tempX, float tempY, float textHeight, color tempC) {
    string = tempString;
    stringLength = string.length();
    c = tempC;
    x = tempX;
    y = tempY;
    pixelSize = textHeight / 8; // Characters are 8 pixels tall
  }

  float charX; // Tracker for where to place the next character (some are larger than others)

  void render() {
    strokeWeight(1);
    stroke(c);
    fill(c);
    charX = x; // Reset charX
    for (int i = 0; i < stringLength; i++) {
      char c = string.charAt(i);
      // Sacreligeous if statement things
             if (c == 'A') { a();
      } else if (c == 'B') { b();
      } else if (c == 'C') { c();
      } else if (c == 'D') { d();
      } else if (c == 'E') { e();
      } else if (c == 'F') { f();
      } else if (c == 'G') { g();
      } else if (c == 'H') { h();
      } else if (c == 'I') { i();
      } else if (c == 'J') { j();
      } else if (c == 'K') { k();
      } else if (c == 'L') { l();
      } else if (c == 'N') { n();
      } else if (c == 'M') { m();
      } else if (c == 'O') { o();
      } else if (c == 'P') { p();
      } else if (c == 'Q') { q();
      } else if (c == 'R') { r();
      } else if (c == 'S') { s();
      } else if (c == 'T') { t();
      } else if (c == 'U') { u();
      } else if (c == 'V') { v();
      } else if (c == 'W') { w();
      } else if (c == 'X') { x();
      } else if (c == 'Y') { y();
      } else if (c == 'Z') { z();
      } else if (c == ' ') { space();
      } else if (c == '/') { slash();
      } else if (c == '.') { period();
      } else if (c == '$') { dollarSign();
      } else if (c == '0') { zero();
      } else if (c == '1') { one();
      } else if (c == '2') { two();
      } else if (c == '3') { three();
      } else if (c == '4') { four();
      } else if (c == '5') { five();
      } else if (c == '6') { six();
      } else if (c == '7') { seven();
      } else if (c == '8') { eight();
      } else if (c == '9') { nine();
      } else if (c == '+') { plus();
      } else if (c == '=') { equal();
      } else if (c == '?') { questionMark();
      }
    }
  }
  
  // Function for changing the string displayed without needing a whole other object
  void setString(String s) {
  string = s;
  stringLength = s.length();
  }
  
/////////////////////////////////////////////////////////////////////////////////////
// CHARACTERS
/////////////////////////////////////////////////////////////////////////////////////
// All characters have been created in the same format
// Check process/2.5 Text Sample.jpg for the ordering of new character segments
// All x positioning is relative to charX, the tracker variable
// All y positioning is relative to a singular height, stored in the variable y
// All character segments are calculated in terms of pixel width/height and multiplied by pixelSize
/////////////////////////////////////////////////////////////////////////////////////

  void a() {
    rect(charX + pixelSize, y, pixelSize * 3, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize * 7);
    rect(charX + pixelSize, y + pixelSize * 3, pixelSize * 3, pixelSize);
    rect(charX + pixelSize * 4, y + pixelSize, pixelSize, pixelSize * 7);
    charX += pixelSize * 6;
  }

  void b() {
    rect(charX, y, pixelSize * 4, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize * 7);
    rect(charX + pixelSize * 4, y + pixelSize, pixelSize, pixelSize * 2);
    rect(charX + pixelSize, y + pixelSize * 3, pixelSize * 3, pixelSize);
    rect(charX + pixelSize * 4, y + pixelSize * 4, pixelSize, pixelSize * 3);
    rect(charX + pixelSize, y + pixelSize * 7, pixelSize * 3, pixelSize);
    charX += pixelSize * 6;
  }

  void c() {
    rect(charX + pixelSize, y, pixelSize * 3, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize * 6);
    rect(charX + pixelSize, y + pixelSize * 7, pixelSize * 3, pixelSize);
    rect(charX + pixelSize * 4, y + pixelSize, pixelSize, pixelSize);
    rect(charX + pixelSize * 4, y + pixelSize * 6, pixelSize, pixelSize);
    charX += pixelSize * 6;
  }

  void d() {
    rect(charX, y, pixelSize * 4, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize * 7);
    rect(charX + pixelSize * 4, y + pixelSize, pixelSize, pixelSize * 6);
    rect(charX + pixelSize, y + pixelSize * 7, pixelSize * 3, pixelSize);
    charX += pixelSize * 6;
  }

  void e() {
    rect(charX, y, pixelSize * 5, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize * 7);
    rect(charX + pixelSize, y + pixelSize * 3, pixelSize * 2, pixelSize);
    rect(charX + pixelSize, y + pixelSize * 7, pixelSize * 4, pixelSize);
    charX += pixelSize * 6;
  }

  void f() {
    rect(charX, y, pixelSize * 5, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize * 7);
    rect(charX + pixelSize, y + pixelSize * 3, pixelSize * 2, pixelSize);
    charX += pixelSize * 6;
  }

  void g() {
    rect(charX + pixelSize, y, pixelSize * 4, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize * 6);
    rect(charX + pixelSize * 3, y + pixelSize * 3, pixelSize * 2, pixelSize);
    rect(charX + pixelSize * 4, y + pixelSize * 4, pixelSize, pixelSize * 3);
    rect(charX + pixelSize, y + pixelSize * 7, pixelSize * 3, pixelSize);
    charX += pixelSize * 6;
  }

  void h() {
    rect(charX, y, pixelSize, pixelSize * 8);
    rect(charX + pixelSize, y + pixelSize * 3, pixelSize * 3, pixelSize);
    rect(charX + pixelSize * 4, y, pixelSize, pixelSize * 8);
    charX += pixelSize * 6;
  }

  void i() {
    rect(charX, y, pixelSize * 3, pixelSize);
    rect(charX + pixelSize, y + pixelSize, pixelSize, pixelSize * 6);
    rect(charX, y + pixelSize * 7, pixelSize * 3, pixelSize);
    charX += pixelSize * 4;
  }

  void j() {
    rect(charX + pixelSize * 4, y, pixelSize, pixelSize * 7);
    rect(charX, y + pixelSize * 6, pixelSize, pixelSize);
    rect(charX + pixelSize, y + pixelSize * 7, pixelSize * 3, pixelSize);
    charX += pixelSize * 6;
  }

  void k() {
    rect(charX, y, pixelSize, pixelSize * 8);
    rect(charX + pixelSize * 4, y, pixelSize, pixelSize * 2);
    rect(charX + pixelSize * 3, y + pixelSize * 2, pixelSize, pixelSize);
    rect(charX + pixelSize, y + pixelSize * 3, pixelSize * 2, pixelSize);
    rect(charX + pixelSize * 3, y + pixelSize * 4, pixelSize, pixelSize);
    rect(charX + pixelSize * 4, y + pixelSize * 5, pixelSize, pixelSize * 3);
    charX += pixelSize * 6;
  }

  void l() {
    rect(charX, y, pixelSize, pixelSize * 8);
    rect(charX + pixelSize, y + pixelSize * 7, pixelSize * 4, pixelSize);
    charX += pixelSize * 6;
  }

  void m() {
    rect(charX, y, pixelSize, pixelSize * 8);
    rect(charX + pixelSize, y + pixelSize, pixelSize, pixelSize);
    rect(charX + pixelSize * 2, y + pixelSize * 2, pixelSize, pixelSize);
    rect(charX + pixelSize * 3, y + pixelSize, pixelSize, pixelSize);
    rect(charX + pixelSize * 4, y, pixelSize, pixelSize * 8);
    charX += pixelSize * 6;
  }

  void n() {
    rect(charX, y, pixelSize, pixelSize * 8);
    rect(charX + pixelSize, y + pixelSize, pixelSize, pixelSize);
    rect(charX + pixelSize * 2, y + pixelSize * 2, pixelSize, pixelSize);
    rect(charX + pixelSize * 3, y + pixelSize * 3, pixelSize, pixelSize);
    rect(charX + pixelSize * 4, y, pixelSize, pixelSize * 8);
    charX += pixelSize * 6;
  }

  void o() {
    rect(charX + pixelSize, y, pixelSize * 3, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize * 6);
    rect(charX + pixelSize * 4, y + pixelSize, pixelSize, pixelSize * 6);
    rect(charX + pixelSize, y + pixelSize * 7, pixelSize * 3, pixelSize);
    charX += pixelSize * 6;
  }

  void p() {
    rect(charX, y, pixelSize * 4, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize * 7);
    rect(charX + pixelSize * 4, y + pixelSize, pixelSize, pixelSize * 2);
    rect(charX + pixelSize, y + pixelSize * 3, pixelSize * 3, pixelSize);
    charX += pixelSize * 6;
  }

  void q() {
    rect(charX + pixelSize, y, pixelSize * 3, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize * 6);
    rect(charX + pixelSize * 4, y + pixelSize, pixelSize, pixelSize * 5);
    rect(charX + pixelSize * 3, y + pixelSize * 6, pixelSize, pixelSize);
    rect(charX + pixelSize, y + pixelSize * 7, pixelSize * 2, pixelSize);
    rect(charX + pixelSize * 4, y + pixelSize * 7, pixelSize, pixelSize);
    charX += pixelSize * 6;
  }

  void r() {
    rect(charX, y, pixelSize * 4, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize * 7);
    rect(charX + pixelSize * 4, y + pixelSize, pixelSize, pixelSize * 2);
    rect(charX + pixelSize, y + pixelSize * 3, pixelSize * 3, pixelSize);
    rect(charX + pixelSize * 4, y + pixelSize * 4, pixelSize, pixelSize * 4);
    charX += pixelSize * 6;
  }

  void s() {
    rect(charX + pixelSize, y, pixelSize * 3, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize * 2);
    rect(charX + pixelSize * 4, y + pixelSize, pixelSize, pixelSize);
    rect(charX + pixelSize, y + pixelSize * 3, pixelSize * 3, pixelSize);
    rect(charX + pixelSize * 4, y + pixelSize * 4, pixelSize, pixelSize * 3);
    rect(charX, y + pixelSize * 6, pixelSize, pixelSize);
    rect(charX + pixelSize, y + pixelSize * 7, pixelSize * 3, pixelSize);
    charX += pixelSize * 6;
  }

  void t() {
    rect(charX, y, pixelSize * 5, pixelSize);
    rect(charX + pixelSize * 2, y + pixelSize, pixelSize, pixelSize * 7);
    charX += pixelSize * 6;
  }

  void u() {
    rect(charX, y, pixelSize, pixelSize * 7);
    rect(charX + pixelSize * 4, y, pixelSize, pixelSize * 7);
    rect(charX + pixelSize, y + pixelSize * 7, pixelSize * 3, pixelSize);
    charX += pixelSize * 6;
  }

  void v() {
    rect(charX, y, pixelSize, pixelSize * 5);
    rect(charX + pixelSize * 4, y, pixelSize, pixelSize * 5);
    rect(charX + pixelSize, y + pixelSize * 5, pixelSize, pixelSize * 2);
    rect(charX + pixelSize * 3, y + pixelSize * 5, pixelSize, pixelSize * 2);
    rect(charX + pixelSize * 2, y + pixelSize * 7, pixelSize, pixelSize);
    charX += pixelSize * 6;
  }

  void w() {
    rect(charX, y, pixelSize, pixelSize * 8);
    rect(charX + pixelSize, y + pixelSize * 6, pixelSize, pixelSize);
    rect(charX + pixelSize * 2, y + pixelSize * 5, pixelSize, pixelSize);
    rect(charX + pixelSize * 3, y + pixelSize * 6, pixelSize, pixelSize);
    rect(charX + pixelSize * 4, y, pixelSize, pixelSize * 8);
    charX += pixelSize * 6;
  }

  void x() {
    rect(charX, y, pixelSize, pixelSize * 2);
    rect(charX + pixelSize * 4, y, pixelSize, pixelSize * 2);
    rect(charX + pixelSize, y + pixelSize * 2, pixelSize, pixelSize);
    rect(charX + pixelSize * 3, y + pixelSize * 2, pixelSize, pixelSize);
    rect(charX + pixelSize * 2, y + pixelSize * 3, pixelSize, pixelSize);
    rect(charX + pixelSize, y + pixelSize * 4, pixelSize, pixelSize);
    rect(charX + pixelSize * 3, y + pixelSize * 4, pixelSize, pixelSize);
    rect(charX, y + pixelSize * 5, pixelSize, pixelSize * 3);
    rect(charX + pixelSize * 4, y + pixelSize * 5, pixelSize, pixelSize * 3);
    charX += pixelSize * 6;
  }

  void y() {
    rect(charX, y, pixelSize, pixelSize * 2);
    rect(charX + pixelSize * 4, y, pixelSize, pixelSize * 2);
    rect(charX + pixelSize, y + pixelSize * 2, pixelSize, pixelSize);
    rect(charX + pixelSize * 3, y + pixelSize * 2, pixelSize, pixelSize);
    rect(charX + pixelSize * 2, y + pixelSize * 3, pixelSize, pixelSize * 5);
    charX += pixelSize * 6;
  }

  void z() {
    rect(charX, y, pixelSize * 6, pixelSize);
    rect(charX + pixelSize * 5, y + pixelSize, pixelSize, pixelSize);
    rect(charX + pixelSize * 4, y + pixelSize * 2, pixelSize, pixelSize);
    rect(charX + pixelSize * 3, y + pixelSize * 3, pixelSize, pixelSize);
    rect(charX + pixelSize * 2, y + pixelSize * 4, pixelSize, pixelSize);
    rect(charX + pixelSize, y + pixelSize * 5, pixelSize, pixelSize);
    rect(charX, y + pixelSize * 6, pixelSize, pixelSize);
    rect(charX, y + pixelSize * 7, pixelSize * 6, pixelSize);
    charX += pixelSize * 7;
  }

  void space() {
    charX += pixelSize * 6;
  }
  
  void slash() {
    rect(charX, y + pixelSize * 6, pixelSize, pixelSize * 2);
    rect(charX + pixelSize * 1, y + pixelSize * 4, pixelSize, pixelSize * 2);
    rect(charX + pixelSize * 2, y + pixelSize * 2, pixelSize, pixelSize * 2);
    rect(charX + pixelSize * 3, y, pixelSize, pixelSize * 2);
    charX += pixelSize * 5;
  }
  
  void period() {
    rect(charX, y + pixelSize * 7, pixelSize, pixelSize);
    charX += pixelSize * 3;
  }
  
  void dollarSign() {
    rect(charX + pixelSize * 2, y - pixelSize, pixelSize, pixelSize * 10);
    s();
  }
  
  void zero() {
    rect(charX + pixelSize, y, pixelSize * 3, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize * 6);
    rect(charX + pixelSize * 4, y + pixelSize, pixelSize, pixelSize * 6);
    rect(charX + pixelSize, y + pixelSize * 7, pixelSize * 3, pixelSize);
    rect(charX + pixelSize * 3, y + pixelSize * 2, pixelSize, pixelSize);
    rect(charX + pixelSize * 2, y + pixelSize * 3, pixelSize, pixelSize);
    rect(charX + pixelSize, y + pixelSize * 4, pixelSize, pixelSize);
    charX += pixelSize * 6;
  }
  
  void one() {
    rect(charX + pixelSize, y, pixelSize, pixelSize * 7);
    rect(charX, y + pixelSize, pixelSize, pixelSize);
    rect(charX, y + pixelSize * 7, pixelSize * 3, pixelSize);
    charX += pixelSize * 4;
  }
  
  void two() {
    rect(charX + pixelSize, y, pixelSize * 3, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize);
    rect(charX + pixelSize * 4, y + pixelSize, pixelSize, pixelSize * 2);
    rect(charX + pixelSize * 3, y + pixelSize * 3, pixelSize, pixelSize);
    rect(charX + pixelSize * 2, y + pixelSize * 4, pixelSize, pixelSize);
    rect(charX + pixelSize, y + pixelSize * 5, pixelSize, pixelSize);
    rect(charX, y + pixelSize * 6, pixelSize, pixelSize);
    rect(charX, y + pixelSize * 7, pixelSize * 5, pixelSize);
    charX += pixelSize * 6;
  }
  
  void three() {
    rect(charX + pixelSize, y, pixelSize * 3, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize);
    rect(charX + pixelSize * 4, y + pixelSize, pixelSize, pixelSize * 2);
    rect(charX + pixelSize * 2, y + pixelSize * 3, pixelSize * 2, pixelSize);
    rect(charX + pixelSize * 4, y + pixelSize * 4, pixelSize, pixelSize * 3);
    rect(charX, y + pixelSize * 6, pixelSize, pixelSize);
    rect(charX + pixelSize, y + pixelSize * 7, pixelSize * 3, pixelSize);
    charX += pixelSize * 6;
  } 
  
  void four() {
    rect(charX + pixelSize * 3, y, pixelSize, pixelSize * 8);
    rect(charX, y, pixelSize, pixelSize * 3);
    rect(charX, y + pixelSize * 3, pixelSize * 5, pixelSize);
    charX += pixelSize * 6;
  }
  
  void five() {
    rect(charX, y, pixelSize * 5, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize * 2);
    rect(charX + pixelSize, y + pixelSize * 3, pixelSize * 3, pixelSize);
    rect(charX + pixelSize * 4, y + pixelSize * 4, pixelSize, pixelSize * 3);
    rect(charX, y + pixelSize * 6, pixelSize, pixelSize);
    rect(charX + pixelSize, y + pixelSize * 7, pixelSize * 3, pixelSize);
    charX += pixelSize * 6;
  }
  
  void six() {
    rect(charX + pixelSize, y, pixelSize * 3, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize * 6);
    rect(charX + pixelSize * 4, y + pixelSize, pixelSize, pixelSize);
    rect(charX + pixelSize, y + pixelSize * 3, pixelSize * 3, pixelSize);
    rect(charX + pixelSize * 4, y + pixelSize * 4, pixelSize, pixelSize * 3);
    rect(charX + pixelSize, y + pixelSize * 7, pixelSize * 3, pixelSize);
    charX += pixelSize * 6;
  }
  
  void seven() {
    rect(charX, y, pixelSize * 5, pixelSize);
    rect(charX + pixelSize * 4, y + pixelSize, pixelSize, pixelSize * 2);
    rect(charX + pixelSize * 3, y + pixelSize * 3, pixelSize, pixelSize);
    rect(charX + pixelSize * 2, y + pixelSize * 4, pixelSize, pixelSize * 4);
    charX += pixelSize * 6;
  }
  
  void eight() {
    rect(charX + pixelSize, y, pixelSize * 3, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize * 2);
    rect(charX + pixelSize * 4, y + pixelSize, pixelSize, pixelSize * 2);
    rect(charX + pixelSize, y + pixelSize * 3, pixelSize * 3, pixelSize);
    rect(charX, y + pixelSize * 4, pixelSize, pixelSize * 3);
    rect(charX + pixelSize * 4, y + pixelSize * 4, pixelSize, pixelSize * 3);
    rect(charX + pixelSize, y + pixelSize * 7, pixelSize * 3, pixelSize);
    charX += pixelSize * 6;
  }
  
  void nine() {
    rect(charX + pixelSize, y, pixelSize * 3, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize * 2);
    rect(charX + pixelSize * 4, y + pixelSize, pixelSize, pixelSize * 6);
    rect(charX + pixelSize, y + pixelSize * 3, pixelSize * 3, pixelSize);
    rect(charX, y + pixelSize * 6, pixelSize, pixelSize);
    rect(charX + pixelSize, y + pixelSize * 7, pixelSize * 3, pixelSize);
    charX += pixelSize * 6;
  }
  
  void plus() {
    rect(charX, y + pixelSize * 4, pixelSize * 3, pixelSize);
    rect(charX + pixelSize, y + pixelSize * 3, pixelSize, pixelSize * 3);
    charX += pixelSize * 4;
  }
  
  void equal() {
    rect(charX, y + pixelSize * 3, pixelSize * 3, pixelSize);
    rect(charX, y + pixelSize * 5, pixelSize * 3, pixelSize);
    charX += pixelSize * 4;
  }
  
  void questionMark() {
    rect(charX + pixelSize, y, pixelSize * 3, pixelSize);
    rect(charX, y + pixelSize, pixelSize, pixelSize);
    rect(charX + pixelSize * 4, y + pixelSize, pixelSize, pixelSize * 2);
    rect(charX + pixelSize * 3, y + pixelSize * 3, pixelSize, pixelSize);
    rect(charX + pixelSize * 2, y + pixelSize * 4, pixelSize, pixelSize * 2);
    rect(charX + pixelSize * 2, y + pixelSize * 7, pixelSize, pixelSize);
    charX += pixelSize * 6;
  }
}
