import 'package:flutter/material.dart';
import 'package:generatedynamicroute/app_title.dart';
import 'package:generatedynamicroute/image_desing.dart';
import 'package:generatedynamicroute/modal/image_class.dart';

import 'package:generatedynamicroute/route.dart';
import 'package:generatedynamicroute/route_name.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => ImageList()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RouteName.home,
        onGenerateRoute: RouteDynamic.generateRoute,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color col = Colors.green;
  double h = 700.0;
  double w = 300.0;
  double ops = 0.2;
  double pva = 1;
  double sc = 0;
  Offset of = Offset(0.0, 15.0);
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ImageList>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const AppTitle(),
      ),
      body: AnimatedContainer(
        height: h,
        width: w,
        color: col,
        duration: const Duration(seconds: 5),
        //  color: Colors.red,
        child: Column(
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10),
            //   child: const Image(
            //     height: 200,
            //     fit: BoxFit.cover,
            //     image: AssetImage("assets/images/1.jpg"),
            //   ),
            // ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: list.item.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChangeNotifierProvider.value(
                    value: list.item[index],
                    child: const ImageDesign(),
                  );
                },
              ),
            ),
            AnimatedOpacity(
              opacity: ops,
              duration: const Duration(seconds: 5),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    ops = 1;
                    pva = 10;
                    col = Colors.purple;
                    sc = 5;
                    of = const Offset(0.1, 150.0);
                    h = 1000;
                    w = 500;
                  });
                },
                child: const Text("Click"),
              ),
            ),
            ClipPath(
              clipper: Chip(),
              child: Container(
                height: 200,
                width: 200,
                color: Colors.red,
              ),
            )

            // Transform.scale(
            //   scale: sc,
            //   child: Container(
            //     height: 50,
            //     width: 50,
            //     color: Colors.red,
            //   ),
            // ),
            // Transform.translate(
            //   offset: of,
            //   child: Container(
            //     height: 50,
            //     width: 50,
            //     color: Colors.red,
            //   ),
            // ),
            // Transform.rotate(
            //   angle: pva,
            //   child: Container(
            //     height: 50,
            //     width: 50,
            //     color: Colors.red,
            //   ),
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            col = Colors.green;
            h = 700.0;
            sc = 0;
            pva = 1;
            w = 300.0;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Chip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // path.moveTo(0, size.height * 1);
    // path.lineTo(0, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
