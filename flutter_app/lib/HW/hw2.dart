import 'package:flutter/material.dart';
import 'package:flutter/painting.dart.';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // #docregion build
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'CHANG EUN SOO',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "21500621",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );

    Column buildButtomColumn(IconData icon, String label) {
      Color color = Colors.black;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ))
        ],
      );
    }

    Widget buttonSection = Container(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButtomColumn(Icons.call, 'call'),
            buildButtomColumn(Icons.message, 'message'),
            buildButtomColumn(Icons.email, 'email'),
            buildButtomColumn(Icons.share, 'share'),
            buildButtomColumn(Icons.description, 'ETC'),
          ],
        ));

    Widget textSection = Container(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.message, size: 40.0),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Message',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  Text(
                    'Long time no see!',
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ],
        ));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Top lakes'),
          ),
          body: ListView(
            children: [
              Image.asset(
                'images/장은수(한동).jpg',
                height: 240.0,
                width: 600.0,
                fit: BoxFit.cover,
              ),
              titleSection,
              const Divider(
                color: Colors.black,
                height: 1.0,
              ),
              buttonSection,
              const Divider(
                color: Colors.black,
                height: 1.0,
              ),
              textSection,
            ],
          )),
    );
  }
// #enddocregion build
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 12;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0.0), //4면에 여백 박기
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.yellow[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18.0,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}
