import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nativedevises/provider/greatPlace.dart';
import 'package:nativedevises/widgets/image_Screen.dart';
import 'package:nativedevises/widgets/location_sereen.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/AddPlaceScreen';
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImg;

  void myPickedImage(File img) {
    _selectedImg = img;
  }

  void _saveDataIntoFile() {
    if (_titleController.text.isEmpty || _selectedImg == null) {
      return;
    } else {
      Provider.of<GreatPlace>(context, listen: false)
          .addPlace(_titleController.text, _selectedImg!);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Places'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        label: const Text('Title'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ImageSetScreen(
                      imageSelector: myPickedImage,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const MapWidget(),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: const EdgeInsets.all(10),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () => _saveDataIntoFile(),
            icon: const Icon(Icons.add),
            label: const Text('Add Place'),
          ),
        ],
      ),
    );
  }
}
