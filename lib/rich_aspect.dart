import 'package:flutter/material.dart';

class RichAspect {
  String aspectTitle;
  Icon? aspectIcon;
  String aspectText;
  String aspectImg;
  bool? aspectChecker;
  String? buttonStatus;

  RichAspect(
      {required this.aspectTitle,
      this.aspectIcon,
      required this.aspectText,
      required this.aspectImg,
      this.aspectChecker,
      this.buttonStatus});

  void isYes() {
    aspectChecker = true;
  }

  void isNo() {
    aspectChecker = false;
  }
}
