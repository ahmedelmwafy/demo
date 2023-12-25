import 'package:demo/core/color.dart';
import 'package:flutter/material.dart';

TextStyle titleStyle = const TextStyle(
    fontWeight: FontWeight.w500, fontSize: 24, color: kBlackColor);
TextStyle miniTitleStyle = const TextStyle(
    fontWeight: FontWeight.w500, fontSize: 14, color: kBlackColor);

TextStyle subTitleStyle = const TextStyle(
    fontWeight: FontWeight.bold, fontSize: 16, color: kBlackColor);
TextStyle labelStyle = const TextStyle(fontSize: 14);
TextStyle headTitleStyle = const TextStyle(
    fontWeight: FontWeight.bold, fontSize: 20, color: kBlackColor);

BoxDecoration customDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 1,
        offset: const Offset(2, 2),
        blurRadius: 4)
  ],
  borderRadius: const BorderRadius.only(
    bottomRight: Radius.circular(20),
    bottomLeft: Radius.circular(20),
  ),
  color: kSecondColor,
);

BoxDecoration alertDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
        color: kAccentColor.withOpacity(0.2),
        spreadRadius: 1,
        offset: const Offset(2, 2),
        blurRadius: 4)
  ],
  borderRadius: BorderRadius.circular(10),
  color: kSecondColor,
);

BoxDecoration walletDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 1,
        offset: const Offset(2, 2),
        blurRadius: 4)
  ],
  borderRadius: BorderRadius.circular(10),
  color: kWhiteColor,
);
