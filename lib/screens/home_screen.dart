import 'package:flutter/material.dart';
import 'package:youtube_trip_advisor_app/data/data.dart';
import 'package:youtube_trip_advisor_app/models/city.dart';
import 'package:youtube_trip_advisor_app/screens/city_screen.dart';
import 'package:youtube_trip_advisor_app/widgets/service_unit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _heading() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Hi',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500],
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                currentUser.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          Text('Lets Discover a New Adventure'),
        ],
      ),
    );
  }

  Widget _searchArea() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.deepPurple,
          ),
          hintText: 'Search Hotels, Taxi etc...',
          suffixIcon: Icon(
            Icons.arrow_drop_down,
            color: Colors.deepPurple,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _services() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ServiceUnit(
          color: Colors.blue,
          icon: Icons.airplanemode_active,
          title: 'Fights',
        ),
        ServiceUnit(
          color: Colors.orange,
          icon: Icons.hotel,
          title: 'Hotels',
        ),
        ServiceUnit(
          color: Colors.purple,
          icon: Icons.location_on,
          title: 'Places',
        ),
        ServiceUnit(
          color: Colors.red,
          icon: Icons.add_circle_outline,
          title: 'More',
        ),
      ],
    );
  }

  Widget _yourTrip() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Your',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Trip',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Future',
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                    Icon(
                      Icons.fiber_manual_record,
                      size: 10.0,
                      color: Colors.deepPurple,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Past',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'All',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 500.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: travelCities.length,
              itemBuilder: (BuildContext context, int index){
                City city = travelCities[index];

                return Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 10.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CityScreen(city: city),
                      ),
                    ),

                    child: Stack(
                      children: <Widget>[
                        Hero(
                          tag: city.imageUrl,
                          child: Container(
                            height: 350.0,
                            width: 350.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              image: DecorationImage(
                                image: AssetImage(
                                  city.imageUrl,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10.0,
                          left: 20.0,
                          child: Text(
                            city.cityName,
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.deepPurple
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50.0,
                          left: 20.0,
                          child: Text(
                            city.countryName,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          currentUser.location,
          style: TextStyle(color: Colors.black),
        ),
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(currentUser.profileUrl),
            ),
          ),
        ],
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              _heading(),
              _searchArea(),
              _services(),
              _yourTrip(),
            ],
          ),
        ),
      ),
    );
  }
}
