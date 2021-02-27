import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo_clone/componets/custom_drawer/custom_drawer.dart';
import 'package:xlo_clone/screens/create/components/images_fields.dart';
import 'package:xlo_clone/stores/create_store.dart';

class CreateScreen extends StatelessWidget {
  final CreateStore createStore = CreateStore();

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
        fontWeight: FontWeight.w600, color: Colors.grey, fontSize: 16);
    final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Anúncio'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Card(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(horizontal: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImagesFields(createStore),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Título*',
                  labelStyle: labelStyle,
                  contentPadding: contentPadding,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Descrição*',
                  labelStyle: labelStyle,
                  contentPadding: contentPadding,
                ),
                maxLines: null,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Preço*',
                  labelStyle: labelStyle,
                  contentPadding: contentPadding,
                  prefixText: 'R\$ ',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RealInputFormatter(centavos: true),
                ],
              ),
            ],
          )),
    );
  }
}
