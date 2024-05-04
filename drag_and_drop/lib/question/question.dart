import 'package:drag_and_drop/question/ext.dart';
import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  const Questions({super.key, required this.question});
  final String question;

  @override
  Widget build(BuildContext context) {
    List<String> text = question.strToList();
    for (var element in text) {
      print(element);
    }
    return Container(
      color: Colors.amber,
      child: Text(question),
    );
  }
}

// class WordReplacementExample extends StatelessWidget {
//   final String originalString = 'Replace this word with a Container.';

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: RichText(
//         text: _buildTextSpan(),
//       ),
//     );
//   }

//   TextSpan _buildTextSpan() {
//     List<TextSpan> textSpans = [];
//     final List<String> words = originalString.split(' ');

//     for (int i = 0; i < words.length; i++) {
//       if (words[i] == 'word') {
//         // Replace 'word' with a Container widget
//         textSpans.add(
//           TextSpan(
//             text: '',
//             style: DefaultTextStyle.of(context).style,
//             children: [
//               WidgetSpan(
//                 child: Container(
//                   padding: EdgeInsets.all(4.0),
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: Text(
//                     'Replacement',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               TextSpan(text: ' '), // Add a space after the Container
//             ],
//           ),
//         );
//       } else {
//         textSpans.add(
//           TextSpan(
//             text: words[i],
//             style: DefaultTextStyle.of(context).style,
//           ),
//         );
//         textSpans.add(TextSpan(text: ' ')); // Add a space after each word
//       }
//     }

//     return TextSpan(children: textSpans);
//   }
// }
