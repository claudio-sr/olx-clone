import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xlo_clone/screens/create/components/image_modal.dart';

class ImagesFields extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File image){
      Navigator.of(context).pop();
    }

    return Container(
      color: Colors.grey[200],
      height: 110,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
              child: GestureDetector(
                onTap: () {
                  if (Platform.isAndroid) {
                    showBottomSheet(
                      context: context,
                      builder: (_) => ImageModal(onImageSelected),
                    );
                  } else {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (_) => ImageModal(onImageSelected),
                    );
                  }
                },
                child: CircleAvatar(
                  radius: 44,
                  backgroundColor: Colors.grey[300],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        size: 35,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
