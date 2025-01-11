import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BookAnimation extends StatelessWidget {
  const BookAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset("assets/rive/books_drop.riv");
  }
}