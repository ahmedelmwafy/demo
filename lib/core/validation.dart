import 'package:localize_and_translate/localize_and_translate.dart';

String? validateFullName(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال اسمك الكامل.'.tr();
  }

  // يمكن إضافة قواعد التحقق الإضافية هنا

  return null; // قيمة صالحة إذا كانت القيمة صالحة
}

String? validateQuestion(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال سؤالك.'.tr();
  }

  // يمكن إضافة قواعد التحقق الإضافية هنا

  return null; // قيمة صالحة إذا كانت القيمة صالحة
}

String? validateId(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال الرمز التعريفى لولي الامر'.tr();
  }

  return null; // قيمة صالحة إذا كانت القيمة صالحة
}

String? validateJob(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال الرمز التعريفى لولي الامر'.tr();
  }

  return null; // قيمة صالحة إذا كانت القيمة صالحة
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال عنوان بريد إلكتروني'.tr();
  }

  // نمط التعبير العادي للتحقق من البريد الإلكتروني
  String pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'; // نمط أساسي

  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'الرجاء إدخال عنوان بريد إلكتروني صالح'.tr();
  }

  return null; // قيمة صالحة إذا كانت القيمة صالحة
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال كلمة مرور'.tr();
  }

  // يمكن إضافة قواعد التحقق الإضافية لكلمة المرور هنا

  return null; // قيمة صالحة إذا كانت القيمة صالحة
}

String? validateIban(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال رقم IBAN'.tr();
  }

  RegExp regex =
      RegExp(r'^[A-Z]{2}[0-9]{2}[A-Z0-9]{4}[0-9]{7}([A-Z0-9]?){0,16}$');

  if (!regex.hasMatch(value)) {
    return 'رقم IBAN غير صالح'.tr();
  }

  return null;
}

String? validateConfirmPassword(String? password, String? confirmPassword) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'الرجاء تأكيد كلمة المرور'.tr();
  }

  if (password != confirmPassword) {
    return 'كلمات المرور غير متطابقة'.tr();
  }

  return null; // قيمة صالحة إذا كانت القيمة صالحة
}

String? validateMonth(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال شهر'.tr();
  }
  final regex = RegExp(r'^\d{1,2}$');
  if (!regex.hasMatch(value)) {
    return 'الرجاء إدخال شهر صالح (MM)'.tr();
  }
  final month = int.tryParse(value);
  if (month == null || month < 1 || month > 12) {
    return 'الرجاء إدخال شهر صالح (1-12)'.tr();
  }
  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال رقم هاتفك';
  }

  // final RegExp saudiPhoneRegExp = RegExp(r'^((05)|(01))[0-9]{8}$');

  // if (!saudiPhoneRegExp.hasMatch(value)) {
  //   return 'الرجاء إدخال رقم هاتف سعودي صحيح';
  // }

  if (value.length > 10) {
    return 'يجب أن يكون طول الرقم أقل من أو يساوي 10 أحرف';
  }

  return null;
}

String? passwordValidate(String? value) {
  if (value == null || value.isEmpty) {
    return ('الرجاء إدخال كلمة مرور'.tr());
  }

  if (value.length < 8) {
    return ('يجب أن تتكون كلمة المرور من 8 أحرف على الأقل'.tr());
  }

  if (!value.contains(RegExp(r'[A-Z]'))) {
    return ('يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل'.tr());
  }

  if (!value.contains(RegExp(r'[a-z]'))) {
    return ('يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل'.tr());
  }

  if (!value.contains(RegExp(r'[0-9]'))) {
    return ('يجب أن تحتوي كلمة المرور على رقم واحد على الأقل'.tr());
  }

  return null;
}

String? validateReason(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال سببك'.tr();
  }
  return null;
}

String? validateComment(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال تعليقك.'.tr();
  }

  return null;
}
String? validateComment2(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال البيانات المطلوبة.'.tr();
  }

  return null;
}

String? validateInput(String? value) {
  final RegExp regex = RegExp(r'^[1-5]$');
  if (!regex.hasMatch(value!)) {
    return 'القيمة يجب أن تكون بين 1 و 5';
  }
  return null;
}
