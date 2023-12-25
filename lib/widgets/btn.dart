import 'package:demo/core/color.dart';
import 'package:demo/core/imgs.dart';
import 'package:flutter/material.dart';

customButton(
    {required title, required context, onTap, color = kMainColor, width}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 64,
      width: width ?? MediaQuery.of(context).size.width,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 20, color: kWhiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

customButton2({onTap, title}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      // width: width??300,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: kMainColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: kWhiteColor),
        ),
      ),
    ),
  );
}

borderButton({onTap, title}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 300,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: kMainColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: kMainColor),
        ),
      ),
    ),
  );
}

deleteButton({onTap, title}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.redAccent.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(pngName('delete')),
          const SizedBox(width: 5),
          Text(
            title,
            style: const TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
