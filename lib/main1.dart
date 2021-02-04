import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}
class RandomWordsState extends State<RandomWords> {
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _suggestions = <WordPair>[];
  @override

  Widget build(BuildContext context) {
    void _pushSaved() {
      Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (context) {
            final tiles = _saved.map(
                  (pair) {
                return new ListTile(
                  title: new Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  ),
                );
              },
            );
            final divided = ListTile
                .divideTiles(
              context: context,
              tiles: tiles,
            )
                .toList();
            return new Scaffold(
              appBar: new AppBar(
                title: new Text('Saved Suggestions'),
              ),
              body: new ListView(children: divided),
            );
          },
        ),
      );
    }
    return new Scaffold (
      floatingActionButton: new FloatingActionButton(
          onPressed:_pushSaved,
        tooltip:'Increment',
        child: new Icon(Icons.add),
      ),
      body: _buildSuggestions(),
    );
  }
  Widget _buildSuggestions() {

    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : Colors.deepPurpleAccent,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );

  }
}