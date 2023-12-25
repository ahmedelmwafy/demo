// ignore_for_file: deprecated_member_use

import 'package:flutter_svg/flutter_svg.dart';

SvgPicture customSvg({String? name, color,height}) {
  return SvgPicture.asset(
    'assets/images/$name.svg',
    height: height,
    color: color,
  );
}
