import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Names',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}
CollectionReference baby = FirebaseFirestore.instance.collection('baby');
Future<void> deleteBaby(Record record){
  return baby
      .doc(record.name)
      .delete()
      .then((value) => print("User Deleted"))
      .catchError((error) => print("Failed to delete user: $error"));
}


showAlertDialog(BuildContext context) {
  TextEditingController _textController = new TextEditingController();

  // set up the button
  Widget addButton = FlatButton(
    child: Text("ADD"),
    onPressed: () {
      return baby.doc(_textController.text).set({
        'dislike' : 0,
        'name' : _textController.text,
        'votes' : 0
      })    .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Add a baby name"),
    content: TextField(
      controller: _textController,
    ),    actions: [
      addButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Baby Name Votes')),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>showAlertDialog(context),
        child: Icon(Icons.add),

      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    Firebase.initializeApp();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return StreamBuilder<QuerySnapshot>(

      stream: firestore.collection('baby').snapshots(),
      builder: (context , snapshot){
        if(!snapshot.hasData)
          return LinearProgressIndicator();

        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          leading: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              deleteBaby(record);
            },
          ),
          title: Text(record.name),
          trailing:
          Wrap(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children:<Widget>[
                  Wrap(
                    children:<Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children:<Widget>[
                          IconButton(
                              icon: Icon(Icons.thumb_up),
                              padding: EdgeInsets.all(0.0),
                              onPressed:() => record.reference.update({'votes' : record.votes +1})),
                          Text(record.votes.toString()),
                        ],
                      ),
                    ],
                  ),

                  Wrap(
                    children:<Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children:<Widget>[
                          IconButton(
                              icon: Icon(Icons.thumb_down),
                              padding: EdgeInsets.all(0.0),
                              onPressed:() => record.reference.update({'dislike' : record.dislike +1})),
                          Text(record.dislike.toString()),
                        ],
                      ),
                    ],
                  ),

                ],

              ),
            ],
          ),
        ),

      ),

    );
  }
}

class Record {
  final String name;
  final int votes;
  final int dislike;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),

        name = map['name'],
        votes = map['votes'],
        dislike = map['dislike'];


  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$dislike>";
}


