import 'package:flutter/material.dart';
import 'package:xlo_clone/screens/home/home_screen.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          Container(color: Colors.grey,),
          Container(color: Colors.green,),
          Container(color: Colors.amber,),
          Container(color: Colors.pink,),
        ],
      ),
    );
  }
}
