import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';  // NEW
import 'package:flutter/cupertino.dart';
void main() {
  runApp(
    FriendlyChatApp(),
  );
}
final ThemeData kIOSTheme = ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);


class FriendlyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:  kDefaultTheme,
      home: ChatScreen(),
    );
  }
}

const String _name = "Your Name";

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isComposing = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FriendlyChat'),
        /*   elevation:
        Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0, // NEW*/
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
          ],
        ),
        /*   decoration: Theme.of(context).platform == TargetPlatform.iOS // NEW
              ? BoxDecoration(          // NEW
            border: Border(       // NEW
              top: BorderSide(color: Colors.grey[200]), // NEW
            ),                    // NEW
          )                       // NEW
              : null   //   MODIFIED  */
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {                             // NEW
      _isComposing = false;                   // NEW
    });                                       // NEW

    ChatMessage message = ChatMessage(
      text: text,
      animationController: AnimationController(      // NEW
        duration: const Duration(milliseconds: 3000), // NEW
        vsync: this,                                 // NEW
      ),                                             // NEW
    );                                               // NEW
    setState(() {
      _messages.insert(0, message);
    });
    _focusNode.requestFocus();
    message.animationController.forward();
  }

//텍스트 쓰고 텍스트 저장하기
  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onChanged: (String text){
                  setState(() {
                    _isComposing = text.length>0;
                  });



                },
                onSubmitted: _isComposing ? _handleSubmitted  : null,
                decoration:
                InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child:
              //     Theme.of(context).platform == TargetPlatform.iOS ? // MODIFIED
              /*     CupertinoButton(                                      // NEW
                child: Text('Send'),                                // NEW
                onPressed: _isComposing                             // NEW
                    ? () =>  _handleSubmitted(_textController.text) // NEW
                    : null,) ,  */
              IconButton(
                icon: _isComposing
                    ? const Icon(Icons.directions_run)
                    : const Icon(Icons.directions_walk),
                onPressed: _isComposing
                    ? () => _handleSubmitted(_textController.text)
                    : null,

              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }
}

//입력하고 위에 뜨는 메세지
class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController}); //constructor
  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizeTransition(
      sizeFactor:
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),

        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _name,
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: Text(text),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0),
              child: CircleAvatar(child: Text(_name[0])),
            ),

          ],
        ),

      ),
    );
  }
}
