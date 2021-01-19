import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/generated/i18n.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  runApp(MyApp());

  await Parse().initialize(
      '5NEtQl5p4vZHP448HVLOwKVKiqq96152E1yL2HwX',
      'https://parseapi.back4app.com/',
      clientKey: '4wAAXMxkmQDJVgLuqXR4UiXz5eiNOPguC97QwQLi',
      autoSendSessionId: true,
      debug: true,
  );

  //Create an object
  /*final category = ParseObject('Category')
  ..set<String>('Title', 'Phone')
  ..set<int>('Position', 1);

  final response = await category.save();

  print(response.success);*/

  //Update an object
  /*final category = ParseObject('Category')
  ..objectId = 'R4RCBNFEgv'
  ..set<int>('Position', 3);

  final response = await category.save();
  print(response.success);*/

  //Remove an object
  /*final category = ParseObject('Category')
  ..objectId = 'R4RCBNFEgv';

  category.delete();*/

  //Read
  /*final response = await ParseObject('Category').getObject('GzPMMbAIWR');
  if(response.success){
    print(response.result);
  }*/

  //Read all
  /*final response = await ParseObject('Category').getAll();
  if(response.success) {
    for(final object in response.result){
      print(object);
    }
  }*/

  //Filter
  /*final query = QueryBuilder(ParseObject('Category'));

  query.whereEqualTo('Position', 3);

  final response = await query.query();

  if(response.success) {
    print(response.result);
  }*/

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: Container(),
    );
  }
}