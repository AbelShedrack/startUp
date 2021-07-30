import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startup/controllers/authentication.dart';
import 'package:startup/widgets/screens/profile.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final authController = Get.put(AuthController());
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFonts = TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 11.0,
        leading: IconButton(
          icon: Icon(Icons.list),
          onPressed: _mySavedStartUp,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () => Get.to(() => ProfileScreen()),
          ),
        ],
        title: Text(
          "StartUp-Name",
          style: TextStyle(
            letterSpacing: 1.6,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (_, int index) {
          if (index.isOdd)
            return const Divider(
              color: Colors.white,
            );
          final myIndex = index ~/ 2;
          if (myIndex >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[myIndex]);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: authController.signOut,
        icon: Icon(Icons.exit_to_app, color: Colors.black),
        label: Text(
          "Sign Out",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        tooltip: "SignOut",
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _buildRow(WordPair pair) {
    final mySavedStartUp = _saved.contains(pair);
    return ListTile(
      title: Text(
        "${pair.asPascalCase}",
        style: _biggerFonts,
      ),
      leading: Icon(FontAwesomeIcons.code),
      onTap: () {
        setState(() {
          if (mySavedStartUp) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
      trailing: Icon(
        mySavedStartUp ? Icons.favorite : Icons.favorite_border,
        color: mySavedStartUp ? Colors.red : null,
      ),
    );
  }

  void _mySavedStartUp() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) {
        final tiles = _saved.map(
          (WordPair pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: _biggerFonts,
              ),
            );
          },
        );
        final divided = tiles.isNotEmpty
            ? ListTile.divideTiles(context: context, tiles: tiles).toList()
            : <Widget>[];
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("My StartUp Names"),
              centerTitle: true,
              actions: [
                Icon(Icons.more_vert),
              ],
            ),
            body: ListView(children: divided),
          ),
        );
      }),
    );
  }
}
