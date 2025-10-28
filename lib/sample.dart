import 'package:flutter/material.dart'; // Unnecessary import if we don't use Material widgets
import 'dart:math'; // Unused import — sonar should flag this

class myClass {
  // Class name should be PascalCase
  int counter = 0;

  void add(int value) {
    // Magic number
    counter += value + 42;
  }

  void unusedMethod() {
    print("This method is never called"); // Dead code
  }

  // Duplicated method (same as add)
  void increase(int value) {
    counter += value + 42;
  }

  void riskyDivision(int a, int b) {
    // No null or zero check — possible divide-by-zero issue
    print(a / b);
  }

  void longMethod() {
    // Function too long — Sonar may flag "Cognitive Complexity"
    for (int i = 0; i < 10; i++) {
      print("Loop $i");
      if (i == 5) {
        print("Halfway");
      } else if (i > 5 && i < 8) {
        print("Almost done");
      } else if (i == 9) {
        print("Done");
      }
    }
  }

  Future<void> initState() async {
    await Future.delayed(Duration(seconds: 1)); // Missing const
    print("Initialized");
  }
}

void main() {
  final obj = myClass();
  obj.add(5);
  obj.increase(5); // Duplicate behavior
  obj.riskyDivision(10, 0); // Possible runtime error
}
