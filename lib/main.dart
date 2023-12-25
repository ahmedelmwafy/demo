import 'package:firebase_core/firebase_core.dart';
import 'package:demo/helpers/cash.dart';
import 'package:demo/helpers/notifications.dart';
import 'package:demo/material/view.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashedHelper.init();
  await Firebase.initializeApp();
  await NotificationsService.instance.init();
  await translator.init(
    language: 'ar',
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/lang/',
  );

  if (CashedHelper.getLang() == '') {
    if (translator.activeLanguageCode == 'ar') {
      CashedHelper.setLang('ar');
    } else if (translator.activeLanguageCode == 'en') {
      CashedHelper.setLang('en');
    }
  }
  runApp(LocalizedApp(child: const HyaElassaf()));
}
