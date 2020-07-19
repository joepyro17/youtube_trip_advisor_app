import 'package:flutter/material.dart';
import 'package:youtube_trip_advisor_app/models/city.dart';
import 'package:youtube_trip_advisor_app/widgets/city_category.dart';
import 'package:youtube_trip_advisor_app/widgets/rating_stars.dart';

class CityScreen extends StatefulWidget {
  final City city;


  CityScreen({this.city});

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.city.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Image(
                    height: 400.0,
                    width: MediaQuery.of(context).size.width,
                    image: AssetImage(widget.city.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:40.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.deepPurple,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top:10.0),
            child: Row(
              children: <Widget>[
                Text(
                  widget.city.cityName,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                Text(
                  ',' +  widget.city.countryName,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
              child: RatingStars(widget.city.rating),
          ),
          GridView.count(
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            shrinkWrap: true,
            crossAxisCount: 2,
            children: <Widget>[
              CityCategory(imageUrl: 'images/ticket.jpg',value: widget.city.ticket, title: 'Tickets',),
              CityCategory(imageUrl: 'images/hotel.png',value: widget.city.hotel, title: 'Hotels',),
              CityCategory(imageUrl: 'images/place.jpg',value: widget.city.places, title: 'Places',),
              CityCategory(imageUrl: 'images/temperature.jpg',value: widget.city.temperature, title: 'Temperature',),
            ],
          ),
        ],
      ),
    );
  }
}
