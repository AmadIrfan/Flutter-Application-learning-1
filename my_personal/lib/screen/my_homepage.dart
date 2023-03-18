// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widget/picture_builder.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List _myList = [
    {'id': '123asdfq', 'image': "assets/images/1 (1).jpg"},
    {'id': '123asdfs', 'image': "assets/images/1 (2).jpg"},
    {'id': '123asdfd', 'image': "assets/images/1 (3).jpg"},
    {'id': '123asdff', 'image': "assets/images/1 (4).jpg"},
    {'id': '123asdfe', 'image': "assets/images/1 (5).jpg"},
    {'id': '123asdfx', 'image': "assets/images/1 (6).jpg"},
    {'id': '123asdft', 'image': "assets/images/1 (7).jpg"},
    {'id': '123asdfu', 'image': "assets/images/1 (8).jpg"},
  ];
  int _indicator = 0;
  @override
  Widget build(BuildContext context) {
    final hSiz = MediaQuery.of(context).size.height;
    final wSiz = MediaQuery.of(context).size.width;
    final appbars = AppBar(
      title: const Text('Picture App'),
    );
    return Scaffold(
      appBar: appbars,
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            Container(
              height: (hSiz -
                      appbars.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  1,
              color: const Color.fromARGB(255, 228, 226, 226),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      height: (hSiz - appbars.preferredSize.height) * 0.389,
                      width: wSiz * 1,
                      child: CarouselSlider(
                        items: _myList
                            .map(
                              (e) => PictureBuilder(
                                imgSrc: e['image'],
                                id: e['id'],
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            reverse: false,
                            clipBehavior: Clip.antiAlias,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            // aspectRatio: 23.4,
                            onPageChanged: ((index, reason) {
                              setState(() {
                                _indicator = index;
                              });
                            })),
                      ),
                    ),
                    AnimatedSmoothIndicator(
                      activeIndex: _indicator,
                      count: _myList.length,
                      axisDirection: Axis.horizontal,
                      effect: ScrollingDotsEffect(
                        activeDotColor: Colors.green,
                        dotHeight: hSiz * 0.01,
                        dotWidth: wSiz * 0.01,
                      ),
                    ),
                    SizedBox(
                      height: (hSiz -
                              appbars.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.01,
                    ),
                    // Container(
                    //   margin: const EdgeInsets.all(10),
                    //   width: double.infinity,
                    //   height: hSiz * 0.1,
                    //   padding: const EdgeInsets.all(10),
                    //   decoration: BoxDecoration(
                    //     color: Colors.blueAccent,
                    //     border: Border.all(),
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    // ),
                    SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        height: (hSiz -
                                appbars.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.4,
                        margin: const EdgeInsets.all(3),
                        padding: const EdgeInsets.all(3),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisExtent: wSiz * 0.2,
                            maxCrossAxisExtent: hSiz * 0.5,
                            // childAspectRatio: 3 / 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: _myList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return PictureBuilder(
                              imgSrc: _myList[index]['image'].toString(),
                              id: _myList[index]['id'].toString(),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: (hSiz -
                              appbars.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.01,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add',
        child: const FaIcon(
          FontAwesomeIcons.cartShopping,
          // color: Colors.red,
        ),
      ),
    );
  }
}
// ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: _myList.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return PictureBuilder(imgSrc: _myList[index]);
//               },
//             ),