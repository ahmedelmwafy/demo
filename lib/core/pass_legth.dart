// ignore_for_file: deprecated_member_use

import 'package:demo/core/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

enum PasswordStrength { weak, intermediate, strong, veryStrong }

class PasswordStrengthWidget extends StatefulWidget {
  final String? password;

  const PasswordStrengthWidget(
    this.password, {
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordStrengthWidget> createState() => _PasswordStrengthWidgetState();
}

class _PasswordStrengthWidgetState extends State<PasswordStrengthWidget> {
  String? password;
  PasswordStrength passwordStrength = PasswordStrength.weak;

  @override
  Widget build(BuildContext context) {
    final passwordStrength = checkPasswordStrength(widget.password ?? '');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Your Password : '.tr(),
                style: const TextStyle(color: Color(0xFF7E8B96)),
              ),
              if (passwordStrength == PasswordStrength.weak)
                Text(
                  'Weak'.tr(),
                  style: const TextStyle(color: Colors.deepOrange),
                )
              else if (passwordStrength == PasswordStrength.intermediate)
                Text(
                  'Intermediate'.tr(),
                  style: const TextStyle(color: Colors.orange),
                )
              else if (passwordStrength == PasswordStrength.strong)
                Text(
                  'Strong'.tr(),
                  style: const TextStyle(color: Colors.green),
                )
              else
                Text(
                  'Very Strong'.tr(),
                  style: const TextStyle(color: Colors.green),
                ),
              const SizedBox(width: 5),
              if (passwordStrength == PasswordStrength.weak)
                SvgPicture.asset(
                  'assets/images/alert.svg',
                  width: 14,
                  color: Colors.deepOrange,
                )
              else if (passwordStrength == PasswordStrength.intermediate)
                SvgPicture.asset(
                  'assets/images/done.svg',
                  width: 14,
                  color: Colors.orange,
                )
              else
                SvgPicture.asset('assets/images/done.svg', width: 14)
            ],
          ),
          GestureDetector(
            onTap: () => showPasswordStrengthDialog(context),
            child: SvgPicture.asset(
              'assets/images/more_info.svg',
              color: const Color(0xFFc2c1ca),
              height: 18,
              width: 18,
            ),
          )
        ],
      ),
    );
  }
}

PasswordStrength? checkPasswordStrength(String value) {
  final password = value.trim();
  final numExp = RegExp('.*[0-9].*');
  final letterExp = RegExp('.*[A-Za-z].*');
  final symbolsExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  int passwordStrength = 0;
  if (password.length > 5) {
    if (password.length > 7) passwordStrength++;
    if (letterExp.hasMatch(password)) passwordStrength++;
    if (numExp.hasMatch(password)) passwordStrength++;
    if (symbolsExp.hasMatch(password)) passwordStrength++;
  }
  if (passwordStrength == 0) {
    return null;
  } else if (passwordStrength == 1) {
    return PasswordStrength.weak;
  } else if (passwordStrength == 2) {
    return PasswordStrength.intermediate;
  } else if (passwordStrength == 3) {
    return PasswordStrength.strong;
  } else {
    return PasswordStrength.veryStrong;
  }
}

void showPasswordStrengthDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SvgPicture.asset(
                'assets/images/shield_done.svg',
                width: 81,
                height: 95,
                color: kMainColor,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Password Strength'.tr(),
                style: const TextStyle(
                  color: Color(0xFF7E8B96),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Strong password must meet these conditions:'.tr(),
              style: const TextStyle(
                color: Color(0xFFc2c1ca),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text('eightDigits'.tr()),
            Text('oneCharacter'.tr()),
            Text('oneSpecialSymbol'.tr()),
            Text('allowedSpecialCharacters'.tr()),
            const Text(
              "   ' ! @ # \$ % ^ & * ( ) , . ? : { } | \" < > ' ",
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
  );
}
