import 'package:flutter/cupertino.dart';

class ImageClass with ChangeNotifier {
  int id;
  String title;
  String description;
  String img;
  ImageClass({
    required this.id,
    required this.title,
    required this.description,
    required this.img,
  });
}

class ImageList with ChangeNotifier {
  List<ImageClass> item = [
    ImageClass(
        id: 1,
        title: "1",
        description: "description",
        img: "assets/images/1.jpg"),
    ImageClass(
        id: 2,
        title: "2",
        description: "description",
        img: "assets/images/2.jpg"),
    ImageClass(
        id: 3,
        title: "3",
        description: "description",
        img: "assets/images/3.jpg"),
    ImageClass(
        id: 4,
        title: "4",
        description: "description",
        img: "assets/images/4.jpg"),
    ImageClass(
        id: 5,
        title: "5",
        description: "description",
        img: "assets/images/5.jpg"),
    ImageClass(
        id: 6,
        title: "6",
        description: "description",
        img: "assets/images/6.jpg"),
  ];
}
