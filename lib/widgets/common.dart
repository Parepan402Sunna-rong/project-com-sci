import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final double Rating;
  // ignore: non_constant_identifier_names
  const RatingBar({Key key, this.Rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(Rating.floor(), (index) {
        return Icon(
          Icons.brightness_4,
          color: Colors.white,
          size: 16,
        );
      }),
    );
  }
}
