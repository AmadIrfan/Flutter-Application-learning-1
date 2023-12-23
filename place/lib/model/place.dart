import 'dart:io';

class LocationHolder {
  String latitude;
  String langitude;
  String adress;
  LocationHolder(
      {required this.latitude, required this.langitude, required this.adress});
}

class Place {
  String id;
  String title;
  final LocationHolder? location;
  final File image;
  Place(
      {required this.id,
      required this.title,
      required this.location,
      required this.image});
}
