import 'package:get/get.dart';

import './language_translations.dart';
import './screens/home.dart';
import 'package:flutter/material.dart';
import './screens/test.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LanguageTranslation(),
      locale: Get.deviceLocale,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.indigo),
      ),
      home: Home(),
      routes: {
        'test': (context) => Test(),
      },
    );
  }
}
