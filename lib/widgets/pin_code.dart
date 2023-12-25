import 'package:demo/core/color.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCode extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?)? onSaved;
  const CustomPinCode({super.key, required this.controller, this.onSaved});

  @override
  Widget build(BuildContext context) {
    final unActiveColor = const Color(0xff364B53).withOpacity(0.1);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: PinCodeTextField(
          controller: controller,
          keyboardType: TextInputType.number,
          enablePinAutofill: true,
          autoFocus: true,
          length: 4,
          obscureText: false,
          animationType: AnimationType.slide,
          onSaved: onSaved,
          enableActiveFill: true,
          pinTheme: PinTheme(
            selectedFillColor: kMainColor.withOpacity(0.5),
            fieldHeight: 74.0,
            fieldWidth: 67,
            borderRadius: BorderRadius.circular(12),
            borderWidth: 1,
            inactiveColor: unActiveColor,
            inactiveFillColor: unActiveColor,
            selectedColor: kMainColor,
            shape: PinCodeFieldShape.box,
            activeFillColor: unActiveColor,
            activeColor: unActiveColor,
            disabledColor: unActiveColor,
          ),
          appContext: context,
          onChanged: (String value) {},
        ),
      ),
    );
  }
}
