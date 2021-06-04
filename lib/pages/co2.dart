import 'package:flutter/material.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rich_alert/rich_alert.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weatherlora/modelDate/co2Date.dart';
import 'package:weatherlora/modelHour/co2Hour.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weatherlora/modelMonth/co2Month.dart';

import 'package:month_picker_dialog/month_picker_dialog.dart';

// ignore: unused_import
import 'package:flutter_localizations/flutter_localizations.dart';

// ignore: camel_case_types
class co2 extends StatefulWidget {
  // final DateTime initialDate;
  // co2({Key key, @required this.initialDate}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _co2();
  }
}

class Constants {
  static const String Hour = 'ชั่วโมง';
  static const String Day = 'วัน';
  static const String Month = 'เดือน';

  static const List<String> choices = <String>[Hour, Day, Month];
}

// ignore: camel_case_types
class _co2 extends State<co2> {
  double value;
  DateTime day;
  String time;
  static List<Co2Hour> uvhour;
  static List<Co2Date> uvdate;
  static List<Co2Month> uvMonth;

  Co2Hour datastrH;
  Co2Date datastrD;
  Co2Month datastrM;

  List<String> strday = [];
  static List<double> datavalue = [];
  DateTime _dateTime;
  DateTime date; //
  String mounth; //
  List<Feature> features = [];

  DateTime selectedDate;

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
    datavalue = [];
    features = [];
    strday = [];
    String url = 'http://202.28.34.197/db/co2_Date/' + strDate;
    print(strDate);
    print(url);
    http.get(url).then((response) {
      if (response.statusCode == 200) {
        uvhour = co2HourFromJson(response.body);
        if (uvhour != null) {
          for (int i = 0; i < uvhour.length; i++) {
            datastrH = uvhour[i];
            value = datastrH.value;
            day = datastrH.day;
            time = datastrH.time;
            strday.add(time.toString().substring(0, 2));
            datavalue.add(value);
          }
          print(datavalue.length);
          print(strday.length);

          if (datavalue.length == 0) {
            _popupDialog();
          }
          features.add(Feature(
            title: "ก๊าซคาร์บอนไดออกไซด์",
            color: Colors.green,
            data: datavalue,
          ));
          // print(features[0].data);
          setState(() {});
        }
      }
    });
  }

  // ignore: non_constant_identifier_names
  _Date() {
    datavalue = [];
    features = [];
    strday = [];
    String urlpm1 = 'http://202.28.34.197/db/co2_month/$strDate';
    print(strDate);
    print(urlpm1);
    http.get(urlpm1).then((response) {
      if (response.statusCode == 200) {
        uvdate = co2DateFromJson(response.body);
        if (uvdate != null) {
          for (int i = 0; i < uvdate.length; i++) {
            datastrD = uvdate[i];
            value = datastrD.value;
            date = datastrD.day;

            strday.add(date.toString().substring(5, 7));
            datavalue.add(value);
          }
          print(datavalue.length);
          print(strday.length);

          int sum = 0;
          for (int i = 0; i < datavalue.length; i++) {
            if (datavalue[i] != 0.0) {
              sum = 1;
            }
          }

          if (sum == 0) {
            _popupDialog();
          }
          features.add(Feature(
            title: "ก๊าซคาร์บอนไดออกไซด์",
            color: Colors.green,
            data: datavalue,
          ));
          print(features[0].data);
          setState(() {});
        }
      }
    });
  }

  // ignore: non_constant_identifier_names
  _Month() {
    datavalue = [];
    features = [];
    strday = [];
    String url = 'http://202.28.34.197/db/co2_month';
    http.get(url).then((response) {
      if (response.statusCode == 200) {
        uvMonth = co2MonthFromJson(response.body);
        if (uvMonth != null) {
          for (int i = 0; i < uvMonth.length; i++) {
            datastrM = uvMonth[i];
            value = datastrM.value;
            mounth = datastrM.date;

            strday.add(mounth.toString().substring(5, 7));
            datavalue.add(value);
          }
          // print(datavaluepm1.length);
          // print(strdaypm1.length);
          features.add(Feature(
            title: "ก๊าซคาร์บอนไดออกไซด์",
            color: Colors.green,
            data: datavalue,
          ));
          print(features[0].data);
          setState(() {});
        }
      }
    });
  }

  // List<Feature> features = [];
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
          'ก๊าซคาร์บอนไดออกไซด์',
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
                    backgroundImage: AssetImage('images/co.png'),
                    radius: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'ก๊าซคาร์บอนไดออกไซด์',
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
                      for (int i = 0; i < strday.length; i++)
                        SalesData((i + 1).toString(), datavalue[i])
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
              image: AssetImage('images/co22.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'ฟ้า : 250 ~ 350 ppm ปกติ',
              style: GoogleFonts.mali(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'เขียว : 350 ~ 1,000 ppm แลกเปลี่ยนอากาศที่ดี',
              style: GoogleFonts.mali(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'เหลือง : 1,000 ~ 2,000 ppm เริ่มง่วงและอากาศไม่ดี',
              style: GoogleFonts.mali(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'ส้ม : 2,000 ~ 5,000 ppm มีอาการคลื่นไส้',
              style: GoogleFonts.mali(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'แดง : > 5,000 ppm รุนแรงส่งผลต่อสมอง',
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
      if (date != null) {
        _dateTime = date;
        setState(() {
          strDate = _dateTime.toString().substring(0, 10);
          _Hour();
        });
      }
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
