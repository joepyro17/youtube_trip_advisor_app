import 'package:flutter/material.dart';

class CityCategory extends StatelessWidget {
  final String imageUrl;
  final int value;
  final String title;

  CityCategory({
    this.imageUrl,
    this.value,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 150.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(
                imageUrl
              ),
              fit: BoxFit.cover
            ),
          ),
        ),
        Positioned(
          top:70.0,
          left: 20.0,
          child: Text(
            value.toString(),
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.red
            ),
          ),
        ),
        Positioned(
          top:120.0,
          left: 20.0,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: Colors.black
            ),
          ),
        ),
      ],
    );
  }
}
