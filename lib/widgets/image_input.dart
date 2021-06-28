import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({Key key}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No image selected',
                  textAlign: TextAlign.center, // horizontal alignment
                ),
          alignment: Alignment.center,
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            label: Text('Take Picture'),
            icon: Icon(Icons.camera),
            onPressed: _takePicture,
          ),
        ),
      ],
    );
  }
}
