import 'package:english_learning_app/views/sentence_list_page.dart';
import 'package:flutter/material.dart';
import 'sentence_input_page.dart';
import 'sorting_question_page.dart'; // 並び替え問題ページもインポートする

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English Learning App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Columnのサイズを子ウィジェットのサイズに合わせる
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SentenceInputPage()),
                );
              },
              child: Text('Register Sentences'),
            ),
            SizedBox(height: 20), // ボタンの間にスペースを追加
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SortingQuestionPage()), // 並び替え問題ページへの遷移
                );
              },
              child: Text('Sorting Test'), // 並び替え問題ページへのボタンテキスト
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SentenceListPage()),
                );
              },
              child: Text('Sentences List'),
            ),
          ],
        ),
      ),
    );
  }
}

