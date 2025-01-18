import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  File? image;
  Future<void> _pickImageFromGallery() async {
    final pickerFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      image = File(pickerFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: image == null
            ?
            // ? Container(
            //     child: Column(
            //       children: [Icon(Icons.photo_library),
            //         Text("Select an Image")
            //       ],
            //     ),
            //
            ElevatedButton(
              style: ButtonStyle(
                // backgroundColor: Colors.blue
              ),
                onPressed: () {
                  _pickImageFromGallery();
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.photo_library,
                      color: Colors.black,
                    ),
                    Text("Select an Image")
                  ],
                ))
            : Container(
                width: 300,
                height: 300,
                child: Image.file(
                  image!,
                  scale: 0.7,
                )));
  }
}
