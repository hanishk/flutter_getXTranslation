import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
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
                      updateLocale(locales[index]['locales'], context);
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
      appBar: AppBar(title: Text('Cheetah Coding')),
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
              Text(
                'Easy Language Translations',
                style: TextStyle(fontSize: 36, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              Text(
                'This text will automatically be translated into the appropriate language',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 24),
              FlatButton(
                child: Text(
                  "Change language",
                  style: TextStyle(fontSize: 18),
                ),
                color: Colors.indigo,
                textColor: Colors.white,
                onPressed: () => showLocaleDialog(context),
              ),
              SizedBox(height: 24),
              FlatButton(
                child: Text(
                  "Go to Test",
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
