import 'package:demo/core/color.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

// ignore: must_be_immutable
class CountryCodePicker extends StatelessWidget {
  final TextEditingController phoneNumberController;
  final Function(PhoneNumber)? phoneNumberOnChanged;
  String? label = 'Phone Number';
  final String initialCountryCode;
  CountryCodePicker(
      {super.key,
      this.label,
      required this.phoneNumberController,
      this.phoneNumberOnChanged,
      required this.initialCountryCode});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
        decoration: InputDecoration(
          isDense: true,
          // contentPadding: EdgeInsets.all(),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          errorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          fillColor: kWhiteColor,
          filled: true,
        ),
        initialCountryCode: initialCountryCode,
        controller: phoneNumberController,
        onChanged: phoneNumberOnChanged);
  }
}
