import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_learning_app/models/sorting_question_model.dart';
import 'package:flutter/material.dart';

class SortingQuestionPage extends StatefulWidget {
  const SortingQuestionPage({Key? key}) : super(key: key);

  @override
  _SortingQuestionPageState createState() => _SortingQuestionPageState();
}

class _SortingQuestionPageState extends State<SortingQuestionPage> {
  List<SortingQuestion> questionList = [];
  int currentQuestionIndex = 0;
  List<String> currentWords = [];

  @override
  void initState() {
    super.initState();
    fetchQuestions('Easy');
  }

  Future<void> fetchQuestions(String difficulty) async {
    try {
      final questionCollection = await FirebaseFirestore.instance
          .collection('sentences')
          .where('difficulty', isEqualTo: difficulty)
          .get();

      List<SortingQuestion> tempList = questionCollection.docs
          .map((doc) => SortingQuestion.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      if (tempList.isNotEmpty) {
        setState(() {
          questionList = tempList;
          currentWords = tempList.first.words;
        });
      }
    } catch (e) {
      // Consider handling the error more gracefully
      // and informing the user with a message.
      debugPrint('Error fetching questions: $e');
    }
  }

  void checkAnswer() {
    String userAnswer = currentWords.join(' ');
    bool isCorrect = userAnswer.trim() == questionList[currentQuestionIndex].sentence.trim();
    // Consider displaying a message to the user or updating the UI
    debugPrint(isCorrect ? 'Correct!' : 'Try again!');
  }

  void goToNextQuestion() {
    if (currentQuestionIndex < questionList.length - 1) {
      setState(() {
        currentQuestionIndex++;
        currentWords = questionList[currentQuestionIndex].words;
      });
    } else {
      // Consider what to do when there are no more questions.
      // Maybe navigate to a result page or display a summary.
      debugPrint('No more questions.');
    }
  }

  void reorderWord(String word) {
    setState(() {
      int index = currentWords.indexOf(word);
      currentWords.removeAt(index);
      currentWords.add(word);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sorting Test')),
      body: questionList.isNotEmpty ? buildQuestionContent() : buildLoading(),
    );
  }

  Widget buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildQuestionContent() {
    SortingQuestion currentQuestion = questionList[currentQuestionIndex];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Center( // Centerウィジェットでラップ
        child: Column(
          mainAxisSize: MainAxisSize.min, // 子の高さに合わせる
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // 水平方向に中央寄せ
          children: [
            const Text(
              'Translate this sentence into English:',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center, // テキストを中央寄せ
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                currentQuestion.translation,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center, // テキストを中央寄せ
              ),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: currentWords.map((word) => ElevatedButton(
                onPressed: () => reorderWord(word),
                child: Text(word),
              )).toList(),
            ),
            const SizedBox(height: 20),
            Text('Your Answer: ${currentWords.join(' ')}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: checkAnswer,
              child: const Text('Check Answer'),
            ),
            if (currentQuestionIndex < questionList.length - 1)
              ElevatedButton(
                onPressed: goToNextQuestion,
                child: const Text('Next Question'),
              ),
          ],
        ),
      ),
    );
  }
}