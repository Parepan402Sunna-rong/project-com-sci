import 'package:flutter/gestures.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:weatherlora/modelHour/scopmodel.dart';
// import 'package:weatherlora/modelHour/uvHour.dart';
import 'package:weatherlora/pages/uv.dart';
import 'package:weatherlora/pages/dustpm.dart';
import 'package:weatherlora/pages/co2.dart';
import 'package:weatherlora/pages/tem.dart';
import 'package:weatherlora/pages/humidity.dart';
import 'package:weatherlora/widgets/common.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
// import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

// class ServiceUvHour {
//   static const String url = 'http://202.28.34.197/db/uv_Date/2020-09-04';
//   static Future<List<UvHour>> getData() async {
//     try {
//       final response = await http.get(url);
//       if (200 == response.statusCode) {
//         final List<UvHour> data = uvHourFromJson(response.body);
//         return data;
//       } else {
//         return List<UvHour>();
//       }
//     } catch (e) {
//       return List<UvHour>();
//     }
//   }
// }

class _HomeState extends State<home> {
  // ignore: unused_field
  // static double valueHour;
  // double _uv;

  var items = [];
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    // ignore: non_constant_identifier_names
    // ServiceUvHour.getData().then((DataUv) {
    setState(() {
      //     UvHour data = DataUv[5];
      //     _uv = data.value;
      //     print(_uv);
      items = [
        PlaceInfo('วัดค่าฝุ่น', Colors.indigo[300], Colors.indigo[900], 4.4,
            'เซนเซอร์วัดค่าฝุ่น'),
        PlaceInfo('วัดแสง', Colors.yellow[300], Colors.orange[900], 4.4,
            'เซนเซอร์วัดแสง'),
        PlaceInfo('คาร์บอนไดออกไซด์', Colors.lightGreen[300], Colors.green[900],
            4.4, 'เซนเซอร์ตรวจวัดก๊าซคาร์บอนไดออกไซด์'),
        PlaceInfo('ความชื้นในอากาศ', Colors.lightBlue[300], Colors.blue[900],
            4.4, 'เซนเซอร์วัดความชื้นในอากาศ'),
        PlaceInfo('อุณหภูมิ', Colors.pink[300], Colors.red[900], 4.4,
            'เซนเซอร์วัดอุณหภูมิ'),
      ];
    });
    // });
  }

  final double _borderRadius = 24;

  var images = [
    "images/pm.png",
    "images/light.png",
    "images/co.png",
    "images/pres.png",
    "images/thermometer.png"
  ];

  // ignore: non_constant_identifier_names
  var Pages = [dustpm(), uv(), co2(), humidity(), temperature()];

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => Scaffold(
              body: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Pages[index]),
                              ).then((value) => null);
                            },
                          ),
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(_borderRadius),
                            gradient: LinearGradient(
                                colors: [
                                  items[index].startColor,
                                  items[index].entColor
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                color: items[index].entColor,
                                blurRadius: 12,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          top: 0,
                          child: CustomPaint(
                            size: Size(100, 150),
                            painter: CustomCardShapePainter(_borderRadius,
                                items[index].startColor, items[index].entColor),
                          ),
                        ),
                        Positioned.fill(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: InkWell(
                                  enableFeedback: true,
                                  onTap: () {
                                    if (index == 0) {
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) => Pages[0]),
                                      );
                                    } else if (index == 1) {
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) => Pages[1]),
                                      );
                                    } else if (index == 2) {
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) => Pages[2]),
                                      );
                                    } else if (index == 3) {
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) => Pages[3]),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) => Pages[4]),
                                      );
                                    }
                                  },
                                  child: Image.asset(
                                    images[index],
                                    height: 64,
                                    width: 64,
                                  ),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        if (index == 0) {
                                          Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) => Pages[0]),
                                          );
                                        } else if (index == 1) {
                                          Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) => Pages[1]),
                                          );
                                        } else if (index == 2) {
                                          Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) => Pages[2]),
                                          );
                                        } else if (index == 3) {
                                          Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) => Pages[3]),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) => Pages[4]),
                                          );
                                        }
                                      },
                                      child: Text(
                                        items[index].name,
                                        style: GoogleFonts.mali(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                              onTap: () {
                                                if (index == 0) {
                                                  Navigator.push(
                                                    context,
                                                    new MaterialPageRoute(
                                                        builder: (context) =>
                                                            Pages[0]),
                                                  );
                                                } else if (index == 1) {
                                                  Navigator.push(
                                                    context,
                                                    new MaterialPageRoute(
                                                        builder: (context) =>
                                                            Pages[1]),
                                                  );
                                                } else if (index == 2) {
                                                  Navigator.push(
                                                    context,
                                                    new MaterialPageRoute(
                                                        builder: (context) =>
                                                            Pages[2]),
                                                  );
                                                } else if (index == 3) {
                                                  Navigator.push(
                                                    context,
                                                    new MaterialPageRoute(
                                                        builder: (context) =>
                                                            Pages[3]),
                                                  );
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    new MaterialPageRoute(
                                                        builder: (context) =>
                                                            Pages[4]),
                                                  );
                                                }
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.brightness_4,
                                                    color: Colors.white,
                                                    size: 16,
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          items[index].location,
                                                          style:
                                                              GoogleFonts.mali(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (index == 0) {
                                          Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) => Pages[0]),
                                          );
                                        } else if (index == 1) {
                                          Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) => Pages[1]),
                                          );
                                        } else if (index == 2) {
                                          Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) => Pages[2]),
                                          );
                                        } else if (index == 3) {
                                          Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) => Pages[3]),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) => Pages[4]),
                                          );
                                        }
                                      },
                                      child: Column(
                                        children: [
                                          Text(
                                            items[index].rating.toString(),
                                            style: GoogleFonts.mali(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          RatingBar(
                                            Rating: items[index].rating,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              appBar: AppBar(
                title: Text(
                  'Weather Station 1',
                  style: GoogleFonts.mali(),
                ),
              ),
            ));
  }
}

class PlaceInfo {
  final String name;
  // final String category;
  final String location;
  final double rating;
  final Color startColor;
  final Color entColor;

  PlaceInfo(
      this.name, this.startColor, this.entColor, this.rating, this.location);
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);
    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
