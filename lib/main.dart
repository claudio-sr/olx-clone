import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/generated/i18n.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'screens/base/base_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  runApp(MyApp());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    '5NEtQl5p4vZHP448HVLOwKVKiqq96152E1yL2HwX',
    'https://parseapi.back4app.com/',
    clientKey: '4wAAXMxkmQDJVgLuqXR4UiXz5eiNOPguC97QwQLi',
    autoSendSessionId: true,
    debug: true,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xlo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: BaseScreen(),
    );
  }
}