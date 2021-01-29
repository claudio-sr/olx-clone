import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:get_it/get_it.dart';

import 'screens/base/base_screen.dart';
import 'stores/page_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocators();
  await initializeParse();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
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
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        cursorColor: Colors.orange,
      ),
      home: BaseScreen(),
    );
  }
}
