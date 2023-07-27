import 'package:flutter/material.dart';

// just graphic elements
final List<Widget> decorations = [
  Image.asset('assets/curve_2_1.png', width: 180),
  Container(
    margin: const EdgeInsets.fromLTRB(14, 8, 0, 0),
    child: Image.asset('assets/curve_2_1b.png', width: 191),
  ),
  Container(
    margin: const EdgeInsets.fromLTRB(0, 30, 84, 0),
    child: Align(
      alignment: Alignment.topRight,
      child: Image.asset('assets/curve_2_2a.png', width: 67),
    ),
  ),
  Container(
    margin: const EdgeInsets.fromLTRB(0, 30, 84, 0),
    child: Align(
      alignment: Alignment.topRight,
      child: Image.asset('assets/curve_2_2a.png'),
    ),
  ),
  Container(
    margin: const EdgeInsets.fromLTRB(0, 64, 80, 0),
    child: Align(
      alignment: Alignment.topRight,
      child: Image.asset('assets/curve_2_2b.png', width: 43),
    ),
  ),
  Container(
    margin: const EdgeInsets.fromLTRB(0, 0, 0, 290),
    child: Align(
      alignment: Alignment.bottomRight,
      child: Image.asset('assets/curve_2_3.png', width: 21),
    ),
  ),
  Align(
    alignment: Alignment.bottomRight,
    child: Image.asset('assets/curve_2_4.png', width: 180),
  ),
  Container(
    margin: const EdgeInsets.fromLTRB(20, 0, 0, 80),
    child: Align(
      alignment: Alignment.bottomLeft,
      child: Image.asset('assets/curve_2_5.png', width: 69),
    ),
  ),
];
