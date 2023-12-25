import 'package:demo/core/color.dart';
import 'package:flutter/material.dart';

class ProgressContainer extends StatelessWidget {
  final double progress;
  const ProgressContainer({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: kMainColor.withOpacity(.5),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          FractionallySizedBox(
            widthFactor: progress, // For 100% progress
            child: Container(
              decoration: BoxDecoration(
                color: kMainColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
