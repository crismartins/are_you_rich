import 'dart:ffi';

class RichAspect {
  String aspectTitle;
  String aspectText;
  Bool? aspectChecker;

  RichAspect(
      {required this.aspectTitle,
      required this.aspectText,
      this.aspectChecker});
}
