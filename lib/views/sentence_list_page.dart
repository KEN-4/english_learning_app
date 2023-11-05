import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SentenceListPage extends StatefulWidget {
  @override
  _SentenceListPageState createState() => _SentenceListPageState();
}

class _SentenceListPageState extends State<SentenceListPage> {
  String selectedDifficulty = 'All';
  List<Map<String, dynamic>> sentences = [];

  @override
  void initState() {
    super.initState();
    fetchSentences(selectedDifficulty);
  }

  void fetchSentences(String difficulty) async {
    Query query = FirebaseFirestore.instance.collection('sentences');
    if (difficulty != 'All') {
      query = query.where('difficulty', isEqualTo: difficulty);
    }
    
    final querySnapshot = await query.get();
    final List<Map<String, dynamic>> documents = querySnapshot.docs
      .map((doc) => doc.data() as Map<String, dynamic>)
      .toList();
    
    if (mounted) {
      setState(() {
        sentences = documents;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sentences List'),
        actions: <Widget>[
          DropdownButton<String>(
            value: selectedDifficulty,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  selectedDifficulty = newValue;
                  fetchSentences(newValue);
                });
              }
            },
            items: <String>['All', 'Easy', 'Medium', 'Hard']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: sentences.length,
        itemBuilder: (context, index) {
          final sentence = sentences[index];
          return ListTile(
            title: Text(sentence['english']),
            subtitle: Text('Difficulty: ${sentence['difficulty']}'),
          );
        },
      ),
    );
  }
}
