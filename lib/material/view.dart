import 'package:demo/core/color.dart';
import 'package:demo/helpers/navigation.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class HyaElassaf extends StatelessWidget {
  const HyaElassaf({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'هيا العساف',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      localizationsDelegates: translator.delegates,
      locale: translator.activeLocale,
      supportedLocales: translator.locals(),
      theme: ThemeData(
          fontFamily: 'arabic',
          scaffoldBackgroundColor: kWhiteColor,
          bottomNavigationBarTheme:
              const BottomNavigationBarThemeData(selectedItemColor: kMainColor),
          appBarTheme: const AppBarTheme(
              centerTitle: false,
              backgroundColor: kWhiteColor,
              iconTheme: IconThemeData(color: kBlackColor),
              titleTextStyle: TextStyle(
                fontFamily: 'arabic',
                color: kBlackColor,
                fontWeight: FontWeight.bold,
              ),
              elevation: 0)),
      // home: const SplashScreen(),
    );
  }
}
