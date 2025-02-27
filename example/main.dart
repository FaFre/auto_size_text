import 'package:flutter/material.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 200,
            height: 140,
            child: AutoSizeText(
              'This string will be automatically resized to fit in two lines.',
              style: TextStyle(fontSize: 30),
              maxLines: 2,
            ),
          ),
        ),
      ),
    );
  }
}
