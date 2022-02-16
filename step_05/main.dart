import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter intro',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const RandomWords(),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final pairs = generateWordPairs().take(100).toList();
  // final savedPairs = <WordPair>{};

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: pairs.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, int index) {
        final pair = pairs[index];
        // final saved = savedPairs.contains(pair);
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
          trailing: const Icon(Icons.favorite_border),
          // trailing: Icon(saved ? Icons.favorite : Icons.favorite_border),
          onTap: () {
            // setState(() {
            //   if (saved) {
            //     savedPairs.remove(pair);
            //   } else {
            //     savedPairs.add(pair);
            //   }
            // });
          },
        );
      },
    );
  }
}
