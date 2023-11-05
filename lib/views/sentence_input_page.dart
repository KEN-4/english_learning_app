import 'package:english_learning_app/models/sentence_model.dart';
import 'package:flutter/material.dart';

class SentenceInputPage extends StatefulWidget {
  @override
  _SentenceInputPageState createState() => _SentenceInputPageState();
}

class _SentenceInputPageState extends State<SentenceInputPage> {
  final TextEditingController _englishTextController = TextEditingController();
  final TextEditingController _japaneseTextController = TextEditingController();
  String _selectedDifficulty = 'Easy';
  final SentenceModel _model = SentenceModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Sentences'),
      ),
      body: Center(
        // Centerウィジェットを追加
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Columnの内容を中央に配置
            crossAxisAlignment: CrossAxisAlignment.center, // 水平方向も中央揃え
            children: <Widget>[
              TextField(
                controller: _englishTextController,
                decoration: InputDecoration(labelText: 'English Sentence'),
                textAlign: TextAlign.center, // テキストフィールドのテキストを中央揃え
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: _japaneseTextController,
                decoration: InputDecoration(labelText: 'Japanese Sentence'),
                textAlign: TextAlign.center, // テキストフィールドのテキストを中央揃え
              ),
              SizedBox(height: 16.0),
              DropdownButton<String>(
                value: _selectedDifficulty,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDifficulty = newValue!;
                  });
                },
                items: <String>['Easy', 'Medium', 'Hard']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        textAlign: TextAlign.center), // ドロップダウンのテキストを中央揃え
                  );
                }).toList(),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  final String englishText = _englishTextController.text;
                  final String japaneseText = _japaneseTextController.text;
                  if (englishText.isNotEmpty && japaneseText.isNotEmpty) {
                    _model.saveSentence(
                        englishText, japaneseText, _selectedDifficulty);
                    _englishTextController.clear();
                    _japaneseTextController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Sentences saved successfully!')),
                    );
                  }
                },
                child: Text('Save Sentences'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
