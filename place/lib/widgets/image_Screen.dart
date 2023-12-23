import 'dart:io';

//packages
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;

class ImageSetScreen extends StatefulWidget {
  final Function imageSelector;
  const ImageSetScreen({
    super.key,
    required this.imageSelector,
  });

  @override
  State<ImageSetScreen> createState() => _ImageSetScreenState();
}

class _ImageSetScreenState extends State<ImageSetScreen> {
  File? _selectedImages;

  Future<void> _selectAnImage() async {
    final pickImage = ImagePicker();
    final imageIs = await pickImage.pickImage(source: ImageSource.camera);
    if (imageIs == null) {
      return;
    } else {
      setState(
        () {
          _selectedImages = File(imageIs.path);
        },
      );
      final dicPath = await syspath.getApplicationDocumentsDirectory();
      final pathIs = path.basename(dicPath.path);
      final saveImages = await _selectedImages?.copy('${dicPath.path}/$pathIs');
      print(saveImages!.path);
      widget.imageSelector(saveImages);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          // margin: const EdgeInsets.all(10),
          height: 150,
          width: 150,
          decoration: BoxDecoration(border: Border.all()),
          child: _selectedImages == null
              ? const Text('No image Selected ')
              : Image.file(_selectedImages!),
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: _selectAnImage,
            icon: const Icon(Icons.camera),
            label: const Text('Click Picture'),
          ),
        ),
      ],
    );
  }
}
