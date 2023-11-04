import 'package:flutter/material.dart';
import 'sentence_input_page.dart';

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English Learning App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SentenceInputPage()),
            );
          },
          child: Text('Register Sentences'),
        ),
      ),
    );
  }
}
