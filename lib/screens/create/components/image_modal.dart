import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid)
      return BottomSheet(
        onClosing: () {},
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FlatButton(onPressed: getFromCamera, child: Text('Câmera')),
            FlatButton(onPressed: getFromGallery, child: Text('Galeria')),
          ],
        ),
      );
    else
      return CupertinoActionSheet(
        cancelButton: CupertinoActionSheetAction(
          child: Text('Cancelar', style: TextStyle(color: Colors.red)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          CupertinoActionSheetAction(
            child: Text('Câmera'),
            onPressed: getFromCamera,
          ),
          CupertinoActionSheetAction(
            child: Text('Galeria'),
            onPressed: getFromGallery,
          ),
        ],
      );
  }

  Future<void> getFromCamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    final image = File(pickedFile.path);
    imageSelected(image);
  }

  Future<void> getFromGallery() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    final image = File(pickedFile.path);
    imageSelected(image);
  }

  void imageSelected(File image) {
    print(image.path);
  }
}
