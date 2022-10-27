import 'package:flutter/cupertino.dart';

class MyClip extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return const Rect.fromLTWH(0, 0, 100, 100);
  }
 
  bool shouldReclip(oldClipper) {
    return false;
  }
}