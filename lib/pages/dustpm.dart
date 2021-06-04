import 'package:flutter/material.dart';
// import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:rich_alert/rich_alert.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weatherlora/modelHour/pm10Hour.dart';
import 'package:weatherlora/modelHour/pm1Hour.dart';
import 'package:http/http.dart' as http;
import 'package:weatherlora/modelHour/pm25Hour.dart';
import 'package:intl/intl.dart';
import 'package:weatherlora/modelDate/pm10Date.dart';
import 'package:weatherlora/modelDate/pm1Date.dart';
import 'package:weatherlora/modelDate/pm25Date.dart';
import 'package:weatherlora/modelMonth/pm10Month.dart';
import 'package:weatherlora/modelMonth/pm1Month.dart';
import 'package:weatherlora/modelMonth/pm25Month.dart';

import 'package:month_picker_dialog/month_picker_dialog.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:fl_animated_linechart/fl_animated_linechart.dart';

// ignore: camel_case_types
class dustpm extends StatefulWidget {
  // final DateTime initialDate;

  // const dustpm({Key key, @required this.initialDate}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _dustpm();
  }
}

class Constants {
  static const String Hour = 'ชั่วโมง';
  static const String Day = 'วัน';
  static const String Month = 'เดือน';

  static const List<String> choices = <String>[Hour, Day, Month];
}

// ignore: camel_case_types
class _dustpm extends State<dustpm> {
  double valuepm1;
  double valuepm10; //
  double valuepm25;
  DateTime daypm1;
  DateTime daypm10; //
  DateTime daypm25;
  String mounthpm25;
  String mounthpm10; //
  String mounthpm1;
  String timepm1; //
  String timepm10;
  String timepm25;

  DateTime _datepm1;
  DateTime _datepm10; //
  DateTime _datepm25;
  DateTime selectedDate;

  static List<Pm1Hour> pm1Hour;
  static List<Pm10Hour> pm10Hour;
  static List<Pm25Hour> pm25Hour;

  static List<Pm25Month> pm25month;
  static List<Pm10Month> pm10month;
  static List<Pm1Month> pm1month; //

  static List<Pm1Date> pm1date;
  static List<Pm25Date> pm25date;
  static List<Pm10Date> pm10date;

  Pm1Hour hourpm1;
  Pm10Hour hourpm10;
  Pm25Hour hourpm25; //

  Pm25Month mounth25;
  Pm10Month mounth10; //
  Pm1Month mounth1;

  Pm25Date datepm25;
  Pm10Date datepm10; //
  Pm1Date datepm1;

  List<String> strdaypm1 = [];
  List<String> strdaypm10 = []; //
  List<String> strdaypm25 = [];
  static List<double> datavaluepm1 = []; //
  static List<double> datavaluepm10 = [];
  static List<double> datavaluepm25 = [];

  List<Feature> features = [];
  DateTime _dateTime; //
  // int checkHour = 0;

  String strDate = new DateFormat("yyyy-MM-dd")
      .format(DateTime.now())
      .toString()
      .substring(0, 10);
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    setState(() {
      var dd = DateTime.now().millisecondsSinceEpoch;
      print('date now $dd');
      _Hour();
    });
  }

  // ignore: non_constant_identifier_names
  _Hour() {
    datavaluepm1 = [];
    features = [];
    strdaypm1 = [];
    String urlpm1 = 'http://202.28.34.197/db/pm1_Date/' + strDate;
    // print("111111111");
    http.get(urlpm1).then((response) {
      // print("22222222");
      if (response.statusCode == 200) {
        // print("333333333");
        pm1Hour = pm1HourFromJson(response.body);
        // print("4444444444");
        if (Pm1Hour != null) {
          // print("5555555555");
          // print("pm1Hour.length - " + pm1Hour.length.toString());
          for (int i = 0; i < pm1Hour.length; i++) {
            hourpm1 = pm1Hour[i];
            valuepm1 = hourpm1.value;
            daypm1 = hourpm1.day;
            timepm1 = hourpm1.time;
            strdaypm1.add(timepm1.toString().substring(0, 2));
            datavaluepm1.add(valuepm1);
            // if (pm1Hour[i].value != 0.0) {
            //   checkHour = 1;
            // }
          }
          // print(datavaluepm1.length);
          // print(strdaypm1.length);
          if (datavaluepm1.length == 0 /*|| checkHour == 0*/) {
            _popupDialog();
          }
          features.add(Feature(
            title: "PM1.0",
            color: Colors.blue,
            data: datavaluepm1,
          ));
          // print(features[0].data);
          setState(() {});
        }
      }
    });
    datavaluepm10 = [];
    features = [];
    strdaypm10 = [];
    // ignore: unused_local_variable
    String urlpm10 = 'http://202.28.34.197/db/pm10_Date/' + strDate;
    http.get(urlpm1).then((response) {
      if (response.statusCode == 200) {
        pm10Hour = pm10HourFromJson(response.body);
        if (pm10Hour != null) {
          for (int i = 0; i < pm10Hour.length; i++) {
            hourpm10 = pm10Hour[i];
            valuepm10 = hourpm10.value;
            daypm10 = hourpm10.day;
            timepm10 = hourpm10.time;
            strdaypm10.add(timepm10.toString().substring(0, 2));
            datavaluepm10.add(valuepm10);
          }
          // print(datavaluepm10.length);
          // print(strdaypm10.length);

          features.add(Feature(
            title: "PM10",
            color: Colors.lightGreen,
            data: datavaluepm10,
          ));
          // print(features[0].data);
          setState(() {});
        }
      }
    });
    datavaluepm25 = [];
    features = [];
    strdaypm25 = [];
    String urlpm25 = 'http://202.28.34.197/db/pm25_Date/' + strDate;
    http.get(urlpm25).then((response) {
      if (response.statusCode == 200) {
        pm25Hour = pm25HourFromJson(response.body);
        if (pm25Hour != null) {
          for (int i = 0; i < pm25Hour.length; i++) {
            hourpm25 = pm25Hour[i];
            valuepm25 = hourpm25.value;
            daypm25 = hourpm25.day;
            timepm25 = hourpm25.time;
            strdaypm25.add(timepm25.toString().substring(0, 2));
            datavaluepm25.add(valuepm25);
          }
          // print(datavaluepm25.length);
          // print(strdaypm25.length);

          features.add(Feature(
            title: "PM2.5",
            color: Colors.purpleAccent,
            data: datavaluepm25,
          ));
          print(features[0].data);
          setState(() {});
        }
      }
    });
  }

  // ignore: non_constant_identifier_names
  _Date() {
    datavaluepm1 = [];
    features = [];
    strdaypm1 = [];
    String urlpm1 = 'http://202.28.34.197/db/pm1_month/' + strDate;
    print(strDate);
    print(urlpm1);
    http.get(urlpm1).then((response) {
      if (response.statusCode == 200) {
        pm1date = pm1DateFromJson(response.body);
        if (pm1date != null) {
          for (int i = 0; i < pm1date.length; i++) {
            datepm1 = pm1date[i];
            valuepm1 = datepm1.value;
            _datepm1 = datepm1.day;

            strdaypm1.add(_datepm1.toString().substring(5, 7));
            datavaluepm1.add(valuepm1);
          }
          // print(datavaluepm1.length);
          // print(strdaypm1.length);
          int sum = 0;
          for (int i = 0; i < datavaluepm1.length; i++) {
            if (datavaluepm1[i] != 0.0) {
              sum = 1;
            }
          }

          if (sum == 0) {
            _popupDialog();
          }
          features.add(Feature(
            title: "PM1",
            color: Colors.deepOrangeAccent,
            data: datavaluepm1,
          ));
          print(features[0].data);
          setState(() {});
        }
      }
    });

    datavaluepm10 = [];
    features = [];
    strdaypm10 = [];
    String urlpm10 = 'http://202.28.34.197/db/pm10_month/' + strDate;
    http.get(urlpm10).then((response) {
      if (response.statusCode == 200) {
        pm10date = pm10DateFromJson(response.body);
        if (pm10date != null) {
          for (int i = 0; i < pm10date.length; i++) {
            datepm10 = pm10date[i];
            valuepm10 = datepm10.value;
            _datepm10 = datepm10.day;

            strdaypm10.add(_datepm10.toString().substring(5, 7));
            datavaluepm10.add(valuepm10);
          }
          print(datavaluepm10.length);
          print(strdaypm10.length);

          features.add(Feature(
            title: "PM10",
            color: Colors.amberAccent,
            data: datavaluepm10,
          ));
          print(features[0].data);
          setState(() {});
        }
      }
    });

    datavaluepm25 = [];
    features = [];
    strdaypm25 = [];
    String urlpm25 = 'http://202.28.34.197/db/pm25_month/' + strDate;

    http.get(urlpm25).then((response) {
      if (response.statusCode == 200) {
        pm25date = pm25DateFromJson(response.body);
        if (pm25date != null) {
          for (int i = 0; i < pm25date.length; i++) {
            datepm25 = pm25date[i];
            valuepm25 = datepm10.value;
            _datepm25 = datepm10.day;

            strdaypm25.add(_datepm25.toString().substring(5, 7));
            datavaluepm25.add(valuepm25);
          }
          // print(datavaluepm25.length);
          // print(strdaypm25.length);

          features.add(Feature(
            title: "PM2.5",
            color: Colors.blue,
            data: datavaluepm25,
          ));
          print(features[0].data);
          setState(() {});
        }
      }
    });
  }

  // ignore: non_constant_identifier_names
  _Month() {
    datavaluepm1 = [];
    features = [];
    strdaypm1 = [];
    String urlpm1 = 'http://202.28.34.197/db/pm1_month';
    http.get(urlpm1).then((response) {
      if (response.statusCode == 200) {
        pm1month = pm1MonthFromJson(response.body);
        if (pm1month != null) {
          for (int i = 0; i < pm1month.length; i++) {
            mounth1 = pm1month[i];
            valuepm1 = mounth1.value;
            mounthpm1 = mounth1.date;

            strdaypm1.add(mounthpm1.toString().substring(5, 7));
            datavaluepm1.add(valuepm1);
          }

          // for (int i = 0; i < strdaypm1.length; i++)
          //   SalesData((i + 1).toString(), datavaluepm1[i])
          // for (int i = 0; i < strdaypm1.length; i++)
          //   SalesData((i + 1).toString(), datavaluepm10[i])
          // for (int i = 0; i < strdaypm1.length; i++)
          //   SalesData((i + 1).toString(), datavaluepm25[i])

          // print(datavaluepm1.length);
          // print(strdaypm1.length);
          features.add(Feature(
            title: "PM1",
            color: Colors.deepOrangeAccent,
            data: datavaluepm1,
          ));
          print(features[0].data);
          setState(() {});
        }
      }
    });

    datavaluepm10 = [];
    features = [];
    strdaypm10 = [];
    String urlpm10 = 'http://202.28.34.197/db/pm10_month';
    http.get(urlpm10).then((response) {
      if (response.statusCode == 200) {
        pm10month = pm10MonthFromJson(response.body);
        if (pm10month != null) {
          for (int i = 0; i < pm10month.length; i++) {
            mounth10 = pm10month[i];
            valuepm10 = mounth10.value;
            mounthpm10 = mounth10.date;

            strdaypm10.add(mounthpm10.toString().substring(5, 7));
            datavaluepm10.add(valuepm10);
          }
          // print(datavaluepm10.length);
          // print(strdaypm10.length);
          features.add(Feature(
            title: "PM10",
            color: Colors.amberAccent,
            data: datavaluepm10,
          ));
          print(features[0].data);
          setState(() {});
        }
      }
    });

    datavaluepm25 = [];
    features = [];
    strdaypm25 = [];
    String urlpm25 = 'http://202.28.34.197/db/pm25_month';
    http.get(urlpm25).then((response) {
      if (response.statusCode == 200) {
        pm25month = pm25MonthFromJson(response.body);
        if (pm25month != null) {
          for (int i = 0; i < pm25month.length; i++) {
            mounth25 = pm25month[i];
            valuepm25 = mounth25.value;
            mounthpm25 = mounth25.date;

            strdaypm25.add(mounthpm25.toString().substring(5, 7));
            datavaluepm25.add(valuepm25);
          }
          // print(datavaluepm25.length);
          // print(strdaypm25.length);
          features.add(Feature(
            title: "PM2.5",
            color: Colors.indigoAccent[700],
            data: datavaluepm25,
          ));
          print(features[0].data);
          setState(() {});
        }
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              }),
        ],
        title: Text(
          'เซนเซอร์วัดค่าฝุ่น',
          style: GoogleFonts.mali(),
        ),
        backgroundColor: Colors.indigoAccent[700],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/pm.png'),
                    radius: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'เซนเซอร์วัดค่าฝุ่น',
                    style: GoogleFonts.mali(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),

          SizedBox(
            height: 50,
          ),
          SfCartesianChart(
              primaryXAxis: CategoryAxis(
                  title: AxisTitle(
                      text: 'วันที่',
                      // ignore: deprecated_member_use
                      textStyle: ChartTextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300))),
              // Chart title
              title: ChartTitle(
                  text: _dateTime == null
                      ? DateFormat("วันที่ dd-MM-yyyy")
                          .format(dateTime)
                          .toString()
                      : new DateFormat("วันที่ dd-MM-yyyy")
                          .format(_dateTime)
                          .toString()
                          .substring(0, 15)),
              // Enable legend
              legend: Legend(isVisible: false),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(
                  enable: true,
                  borderColor: Colors.red,
                  borderWidth: 5,
                  color: Colors.lightBlue),
              series: <ChartSeries<SalesData, String>>[
                LineSeries<SalesData, String>(
                    dataSource: <SalesData>[
                      for (int i = 0; i < strdaypm1.length; i++)
                        SalesData((i + 1).toString(), datavaluepm1[i]),
                      // for (int i = 0; i < strdaypm1.length; i++)
                      //   SalesData((i + 1).toString(), datavaluepm10[i]),
                      // for (int i = 0; i < strdaypm1.length; i++)
                      //   SalesData((i + 1).toString(), datavaluepm25[i])
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: false))
              ]),
          // SizedBox(
          //   height: 50,
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 10.0),
            child: Image(
              image: AssetImage('images/pm2.jpg'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(
              'ระดับที่ 1 : 0 - 25 คุณภาพอากาศดีมาก',
              style: GoogleFonts.mali(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(
              'ระดับที่ 2 : 26 - 50 คุณภาพอากาศดี',
              style: GoogleFonts.mali(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(
              'ระดับที่ 3 : 51 - 100  ปานกลาง',
              style: GoogleFonts.mali(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(
              'ระดับที่ 4 : 101 - 200 เริ่มมีผลกระทบต่อสุขภาพ	',
              style: GoogleFonts.mali(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(
              'ระดับที่ 5 : 201 ขึ้นไป มีผลกระทบต่อสุขภาพ	',
              style: GoogleFonts.mali(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          )
        ],
      ),
    );
  }

  void choiceAction(String choice) {
    if (choice == Constants.Hour) {
      calHour();
    } else if (choice == Constants.Day) {
      calDate();
    } else if (choice == Constants.Month) {
      _Month();
    }
  }

  void calHour() {
    showDatePicker(
            context: context,
            locale: const Locale('th', 'TH'),
            initialDate: _dateTime == null ? DateTime.now() : _dateTime,
            firstDate: DateTime(2001),
            lastDate: DateTime(2030))
        .then((date) {
      _dateTime = date;
      setState(() {
        strDate = _dateTime.toString().substring(0, 10);
        _Hour();
      });
    });
  }

  void calDate() {
    showMonthPicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1, 5),
      lastDate: DateTime(DateTime.now().year + 1, 9),
      initialDate: selectedDate ?? DateTime.now(),
      locale: Locale('th', 'TH'),
    ).then((date) {
      if (date != null) {
        setState(() {
          selectedDate = date;
          strDate = selectedDate.toString().substring(0, 7);
          _Date();
        });
      }
    });
  }

  void _popupDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return RichAlertDialog(
            //uses the custom alert dialog
            alertTitle: richTitle("แจ้งเตือน"),
            alertSubtitle: richSubtitle("วันที่คุณต้องการไม่มีข้อมูล!!!"),
            alertType: RichAlertType.WARNING,
          );
        });
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
