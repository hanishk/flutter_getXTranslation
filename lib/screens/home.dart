import 'package:CWCFlutter/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../language_translations.dart';

class Home extends StatelessWidget {
  //hardcoreded or api
  final locales = [
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'Hindi', 'locale': Locale('hi', 'IN')},
    {'name': 'German', 'locale': Locale('de', 'DE')},
    {'name': 'Vietnamese', 'locale': Locale('vi', 'VN')},
  ];

  showLocaleDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(
                'Choose your Language',
              ),
              content: Container(
                width: double.maxFinite,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        locales[index]['name'],
                      ),
                    ),
                    onTap: () {
                      updateLocale(locales[index]['locale'], context);
                    },
                  ),
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                  ),
                  itemCount: 4,
                ),
              ),
            ));
  }

  updateLocale(Locale locale, BuildContext context) {
    Navigator.of(context).pop();
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText('appbar1'),
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                height: 200,
              ),
              SizedBox(height: 24),
              CustomText(
                'title'.tr,
              ),
              SizedBox(height: 24),
              CustomText(
                'subtitle'.tr,
              ),
              SizedBox(height: 24),
              FlatButton(
                child: Text(
                  "button1".tr,
                  style: TextStyle(fontSize: 18),
                ),
                color: Colors.indigo,
                textColor: Colors.white,
                onPressed: () => showLocaleDialog(context),
              ),
              SizedBox(height: 24),
              FlatButton(
                child: Text(
                  "button2".tr,
                  style: TextStyle(fontSize: 18),
                ),
                color: Colors.indigo,
                textColor: Colors.white,
                onPressed: () => Navigator.pushNamed(context, 'test'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
