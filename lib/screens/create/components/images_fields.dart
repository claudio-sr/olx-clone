import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_clone/screens/create/components/image_modal.dart';
import 'package:xlo_clone/stores/create_store.dart';

class ImagesFields extends StatelessWidget {
  final CreateStore createStore;

  ImagesFields(this.createStore);

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File image) {
      createStore.images.add(image);
      Navigator.of(context).pop();
    }

    return Container(
      color: Colors.grey[200],
      height: 110,
      child: Observer(builder: (_){
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: createStore.images.length < 5 ? createStore.images.length + 1 : 5,
            itemBuilder: (_, index) {
              if(index == createStore.images.length)
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
              else
                return Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, index == 4 ? 8 : 0, 8),
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: CircleAvatar(
                      radius: 44,
                      backgroundImage: FileImage(createStore.images[index]),
                    ),
                  ),
                );
            });
      }),
    );
  }
}
