import 'package:cloud_firestore/cloud_firestore.dart';

class SentenceModel {
  Future<void> saveSentence(String englishText, String japaneseText, String difficulty) async {
    var collection = FirebaseFirestore.instance.collection('sentences');
    await collection.add({
      'english': englishText,
      'japanese': japaneseText,
      'difficulty': difficulty,
    });
  }
}
