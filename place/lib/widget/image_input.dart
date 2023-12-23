import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;

class ImageInput extends StatefulWidget {
  final Function selectImg;
  const ImageInput({super.key, required this.selectImg});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;
  Future<void> _takePicture() async {
    final imagePick = ImagePicker();
    final myImage = await imagePick.pickImage(source: ImageSource.camera);
    if (myImage == null) {
      return;
    }
    setState(
      () {
        _storedImage = File(myImage.path);
      },
    );
    final sysDic = await syspath.getApplicationDocumentsDirectory();
    final pathName = path.basename(sysDic.path);
    final saveImage = await _storedImage?.copy('${sysDic.path}/ $pathName');
    widget.selectImg(saveImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                )
              : const Text(
                  'no Image Taken',
                  textAlign: TextAlign.center,
                ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: () {
              _takePicture();
            },
            icon: const Icon(Icons.camera),
            label: const Text('Take a Picture'),
          ),
        ),
      ],
    );
  }
}