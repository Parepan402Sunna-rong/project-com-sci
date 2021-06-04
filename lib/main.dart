import 'package:scoped_model/scoped_model.dart';
import 'package:weatherlora/modelHour/scopmodel.dart';

import 'package:flutter/material.dart';
// import 'pages/mainpage.dart';
import 'package:weatherlora/pages/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_rounded_date_picker/rounded_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final scopModel = AppModel();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
        model: scopModel,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          // locale: Locale('en', 'US'),
          supportedLocales: [
            // const Locale('en', 'US'), // English
            const Locale('th', 'TH'), // Thai
          ],
          title: 'Weather Station',
          theme: new ThemeData(
            primaryColor: Colors.indigoAccent[700],
            primaryTextTheme: TextTheme(
              headline6: TextStyle(color: Colors.white),
            ),
          ),
          home: MapSample(),
        ));
  }
}
