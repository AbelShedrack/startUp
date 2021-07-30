import 'package:flutter/material.dart';
import 'package:startup/widgets/screens/random_words.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black26,
        body: RandomWords(),
      ),
    );
  }
}
