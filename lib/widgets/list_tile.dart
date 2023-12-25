import 'package:demo/core/color.dart';
import 'package:demo/core/imgs.dart';
import 'package:flutter/material.dart';

Widget customLisTTile({
    void Function()? onTap,
    String? title,
    String? image,
  }) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title ?? '',
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey.withOpacity(0.5),
      ),
      leading: Container(
        width: 40,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: kMainColor.withOpacity(0.2)),
        child: Image.asset(pngName(image ?? '')),
      ),
    );
  }