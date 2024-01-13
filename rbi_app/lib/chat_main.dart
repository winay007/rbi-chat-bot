import 'package:flutter/material.dart';
import 'package:rbi_app/chat_item.dart';
import 'package:rbi_app/chatting_screen.dart';


class ChattingScreen extends StatefulWidget {
  static final String routeName = ' ChattingScreen';

  const ChattingScreen({super.key});

  @override
  State <ChattingScreen> createState() =>  ChattingScreenState();
}

class  ChattingScreenState extends State<ChattingScreen> {
  // late DialogFlowtter dialogFlowtter;
  final _controller = new TextEditingController();
  var _enteredMessage = '';
  List<Chat> messages = [
    Chat(message: "hello",createdBy: false,createdAt: "19-20-23"),
  ];

  // @override
  // void initState() {
  //   DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Text('RBI chat bot',
              style: TextStyle(
                  fontSize:20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages)),
            Container(
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      autocorrect: true,
                      enableSuggestions: true,
                      textCapitalization: TextCapitalization.sentences,
                      controller: _controller,
                      decoration: InputDecoration(hintText: ' Ask query'),
                      onChanged: (value) {
                        setState(() {
                          _enteredMessage = value;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    // color: kPrimaryColor,
                    icon: Icon(Icons.send),
                    onPressed: () {
                      if (!_enteredMessage.trim().isEmpty) {
                        sendMessage(_controller.text);
                        _controller.clear();
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Empty Text!');
    } else {
      setState(() {
        addMessage(text,true);
      });

      // DetectIntentResponse response = await dialogFlowtter.detectIntent(
      //   queryInput: QueryInput(text: TextInput(text: text)),
      // );
      // if (response.message == null) return;
      // setState(() {
      //   addMessage(response.message?.text!.text?[0] ?? "can't understand",false);
      // });
    }
  }

  addMessage(String message,bool createdByUser) {
    messages.add(Chat(
        createdAt: DateTime.now().toString(),
        createdBy: createdByUser,
        message: message));
  }
}
