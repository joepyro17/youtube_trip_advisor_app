import 'package:youtube_trip_advisor_app/models/user.dart';

import '../models/city.dart';

final currentUser = User(
  name: 'Joe',
  profileUrl: 'images/profile_pic.png',
  location: 'Vientiane, Lao PDR',
);

final List<City> travelCities =[
  City(cityName: 'Vientiane', countryName: 'Lao PDR', imageUrl: 'images/vientiane.png', rating: 5, ticket: 2, hotel: 90, places: 16, temperature: 35),
  City(cityName: 'New York', countryName: 'USA', imageUrl: 'images/newyork.jpg',rating: 4, ticket: 3, hotel: 150, places: 30, temperature: 15),
  City(cityName: 'Tokyo', countryName: 'Japan', imageUrl: 'images/tokyo.png',rating: 3, ticket: 5, hotel: 210, places: 20, temperature: 24),
];