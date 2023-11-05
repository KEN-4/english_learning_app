import 'package:cloud_firestore/cloud_firestore.dart';

class SortingQuestion {
  final String sentence; // 英文
  final String translation; // 対応する日本語の文
  final List<String> words; // 並び替える単語のリスト

  SortingQuestion({required this.sentence, required this.translation, required this.words});

  // FirestoreのドキュメントからSortingQuestionオブジェクトを作成するためのファクトリコンストラクタ
  factory SortingQuestion.fromMap(Map<String, dynamic> map) {
    List<String> words = (map['english'] as String).split(' ');
    words.shuffle();
    return SortingQuestion(
      sentence: map['english'] as String,
      translation: map['japanese'] as String,
      words: words,
    );
  }
}


class SortingQuestionModel {
  Future<List<SortingQuestion>> fetchQuestions(String difficulty) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('sentences')
        .where('difficulty', isEqualTo: difficulty)
        .get();

    List<SortingQuestion> questions = [];
    for (var doc in querySnapshot.docs) {
      String englishSentence = doc.get('english');
      List<String> words = englishSentence.split(' ')..shuffle();
      questions.add(SortingQuestion(sentence: englishSentence, words: words, translation: ''));
    }
    return questions;
  }
}
