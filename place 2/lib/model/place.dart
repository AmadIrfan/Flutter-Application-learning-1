import 'dart:io';

class LocationSelect {
  final String lonigtude;
  final String latitude;
  final String adress;
  LocationSelect({
    required this.latitude,
    required this.lonigtude,
    required this.adress,
  });
}

class Place {
  final String title;
  final String id;
  final File image;
  final LocationSelect? location;
  Place(
      {required this.id,
      required this.title,
      required this.location,
      required this.image});
}
