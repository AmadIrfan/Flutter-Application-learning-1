import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_12/provider/grateplace.dart';
import 'package:flutter_application_12/widget/location_input.dart';
import 'package:provider/provider.dart';
import '../widget/image_input.dart';

class AddPlaceSceen extends StatefulWidget {
  const AddPlaceSceen({super.key});
  static const routename = '/addPlace';
  @override
  State<AddPlaceSceen> createState() => _AddPlaceSceenState();
}

class _AddPlaceSceenState extends State<AddPlaceSceen> {
  final _textController = TextEditingController();
  File? _imagePicked;

  void _savedImage(File imagPicked) {
    _imagePicked = imagPicked;
  }

  void _saveDataIntoFile() {
    if (_textController.text.isEmpty || _imagePicked == null) {
      return;
    } else {
      Provider.of<GreatPlace>(context, listen: false)
          .addPlace(_textController.text, _imagePicked!);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // const Text('no input...'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      label: Text('title'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ImageInput(
                    selectImg: _savedImage,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const LocationInput(),
                ],
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _saveDataIntoFile,
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            icon: const Icon(Icons.add),
            label: const Text('Add Place'),
          ),
        ],
      ),
    );
  }
}
