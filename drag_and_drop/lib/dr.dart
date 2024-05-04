// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Drag and Drop Example'),
//         ),
//         body: const DragAndDropExample(),
//       ),
//     );
//   }
// }

// class DragAndDropExample extends StatefulWidget {
//   const DragAndDropExample({super.key});

//   @override
//   _DragAndDropExampleState createState() => _DragAndDropExampleState();
// }

// class _DragAndDropExampleState extends State<DragAndDropExample> {
//   List<String> draggableItems = ['Item 1', 'Item 2', 'Item 3'];
//   Color clr = Colors.green;
//   bool drop = false;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Draggable<String>(
//               data: 'Item 1',
//               feedback: DraggableItem('Item 1', isBeingDragged: true),
//               childWhenDragging: DraggableItem('Item 1', isBeingDragged: true),
//               child: DraggableItem('Item 1'),
//             ),
//             Draggable<String>(
//               data: 'Item 2',
//               feedback: DraggableItem('Item 2', isBeingDragged: true),
//               childWhenDragging: DraggableItem('Item 2', isBeingDragged: true),
//               child: DraggableItem('Item 2'),
//             ),
//             Draggable<String>(
//               data: 'Item 3',
//               feedback: DraggableItem('Item 3', isBeingDragged: true),
//               childWhenDragging: DraggableItem('Item 3', isBeingDragged: true),
//               child: DraggableItem('Item 3'),
//             ),
//           ],
//         ),
//         const SizedBox(height: 50),
//         DragTarget(
//           builder: (
//             BuildContext context,
//             List<String?> acceptedData,
//             List<dynamic> rejectedData,
//           ) {
//             return Container(
//               width: 200,
//               height: 200,
//               decoration: BoxDecoration(
//                 color: clr,
//                 shape: BoxShape.circle,
//               ),
//               alignment: Alignment.center,
//               child: Text(
//                 !drop ? 'Drop here' : 'Dropped',
//                 style: const TextStyle(color: Colors.white),
//               ),
//             );
//           },
//           onWillAccept: (data) {
//             setState(() {
//               clr = Colors.red;
//               drop = false;
//             });
//             return true;
//           },
//           onAccept: (data) {
//             setState(() {
//               clr = Colors.blue;
//               drop = true;
//             });

//             // print(data);
//           },
//           onLeave: (data) {
//             setState(() {
//               clr = Colors.green;
//               drop = false;
//             });
//           },
//         ),
//         const SizedBox(height: 50),
//         // Text('Draggable Items: $draggableItems'),
//         const Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Draggable<String>(
//               data: 'Item 4',
//               feedback: DraggableItem('Item 4', isBeingDragged: true),
//               childWhenDragging: DraggableItem('Item 4', isBeingDragged: true),
//               child: DraggableItem('Item 4'),
//             ),
//             Draggable<String>(
//               data: 'Item 5',
//               feedback: DraggableItem('Item 5', isBeingDragged: true),
//               childWhenDragging: DraggableItem('Item 5', isBeingDragged: true),
//               child: DraggableItem('Item 5'),
//             ),
//             Draggable<String>(
//               data: 'Item 6',
//               feedback: DraggableItem('Item 6', isBeingDragged: true),
//               childWhenDragging: DraggableItem('Item 6', isBeingDragged: true),
//               child: DraggableItem('Item 6'),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class DraggableItem extends StatelessWidget {
//   final String text;
//   final bool isBeingDragged;

//   const DraggableItem(this.text, {super.key, this.isBeingDragged = false});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 60,
//       height: 60,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         color: isBeingDragged ? Colors.blue : Colors.grey,
//         shape: BoxShape.circle,
//       ),
//       padding: const EdgeInsets.all(10),
//       child: Text(
//         text,
//         textAlign: TextAlign.center,
//         style: const TextStyle(color: Colors.white),
//       ),
//     );
//   }
// }





// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api

// import 'package:drag_and_drop/question/question.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Drag and Drop Quiz App'),
//         ),
//         body: const QuizDragAndDrop(),
//       ),
//     );
//   }
// }

// class QuizDragAndDrop extends StatefulWidget {
//   const QuizDragAndDrop({super.key});

//   @override
//   _QuizDragAndDropState createState() => _QuizDragAndDropState();
// }

// class _QuizDragAndDropState extends State<QuizDragAndDrop> {
//   int qNo = 0;
//   final List<Map<String, dynamic>> questions = [
//     {
//       'question': 'Flutter is a framework developed by ______________.',
//       'options': ['Google', 'Facebook', 'Microsoft', 'Apple'],
//       'correctAnswer': 'Google',
//     },
//     {
//       'question':
//           'In Flutter, the primary language used for development is ______________.',
//       'options': ['Java', 'Dart', 'Swift', 'Kotlin'],
//       'correctAnswer': 'Dart',
//     },
//     {
//       'question': 'Widgets in Flutter are ______________.',
//       'options': [
//         'Only visual elements',
//         'Only functional elements',
//         'Visual and functional elements',
//         'None of the above'
//       ],
//       'correctAnswer': 'Visual and functional elements',
//     },
//     {
//       'question':
//           'The hot reload feature in Flutter allows developers to ______________.',
//       'options': [
//         'Reheat their lunch',
//         'Quickly see the effects of code changes without restarting the app',
//         'Turn off the app',
//         'Update the Flutter framework'
//       ],
//       'correctAnswer':
//           'Quickly see the effects of code changes without restarting the app',
//     },
//   ];

//   List<String> userAnswers = [];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 20),
//         Questions(question: questions[qNo]['question']),
//         const SizedBox(height: 20),
//         ...(questions[qNo]['options'] as List)
//             .map(
//               (e) => Container(
//                 margin: const EdgeInsets.all(5),
//                 padding: const EdgeInsets.all(5),
//                 width: double.infinity,
//                 color: Colors.red,
//                 child: Text(
//                   e,
//                   textAlign: TextAlign.left,
//                 ),
//               ),
//             )
//             .toList(),
//         // DraggableOption(
//         //   userAnswers: userAnswers,
//         //   questionIndex: i,
//         //   option: questions[i]['options'][0],
//         //   onDragEnd: (value) {
//         //     setState(() {
//         //       userAnswers[i] = value;
//         //     });
//         //   },
//         // ),
//         const SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               if (kDebugMode) {
//                 print('$qNo ===> ${questions.length}');
//               }
//               if (qNo < questions.length - 1) {
//                 qNo++;
//               } else {
//                 qNo = 0;
//               }
//             });
//           },
//           child: const Text('Next Question'),
//         ),
//       ],
//     );
//   }
// }

// class DraggableOption extends StatelessWidget {
//   final int questionIndex;
//   final String option;
//   final ValueChanged<String> onDragEnd;
//   final List<String> userAnswers;
//   const DraggableOption({
//     super.key,
//     required this.questionIndex,
//     required this.option,
//     required this.onDragEnd,
//     required this.userAnswers,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Draggable<String>(
//       data: option,
//       feedback: Material(
//         child: Container(
//           width: 200,
//           height: 50,
//           color: Colors.blue,
//           alignment: Alignment.center,
//           child: Text(
//             option,
//             style: const TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//       child: DragTarget<String>(
//         builder: (BuildContext context, List<String?> candidateData,
//             List<dynamic> rejectedData) {
//           return Container(
//             width: 200,
//             height: 50,
//             color: Colors.grey,
//             alignment: Alignment.center,
//             child: Text(
//               userAnswers.length > questionIndex
//                   ? userAnswers[questionIndex]
//                   : 'Drag here',
//               style: const TextStyle(color: Colors.white),
//             ),
//           );
//         },
//         onWillAccept: (data) {
//           return true;
//         },
//         onAccept: (data) {
//           onDragEnd(data);
//         },
//       ),
//     );
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(DiagnosticsProperty('userAnswers', userAnswers));
//   }
// }
