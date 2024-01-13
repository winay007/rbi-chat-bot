import 'package:flutter/material.dart';
import 'package:rbi_app/pdf_screen.dart';

// import 'package:shop_app/size_config.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  MessageBubble(
    this.message,
    this.isMe,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: isMe
                          ? Colors.grey[300]
                          : Color.fromARGB(255, 177, 83, 80),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft:
                            !isMe ? Radius.circular(0) : Radius.circular(12),
                        bottomRight:
                            isMe ? Radius.circular(0) : Radius.circular(12),
                      )),
                  // width: isMe ? 100 : 400,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width *
                        0.7, // Adjust as needed
                  ),
                  child: Column(
                    crossAxisAlignment: isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        message,
                        style: TextStyle(
                            color: isMe ? Colors.black : Colors.white),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width *
                              0.4, // Adjust as needed
                        ),
                        child: !isMe ? InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PDFscreen()));
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.info_outline,color: Colors.white,),
                              Container(
                                margin: EdgeInsets.only(left: 6),
                                child: Text(
                                  "More details",
                                  style: TextStyle(
                                      color: isMe ? Colors.black : Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ) : Container(width: 0,),
                      ) 
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
      // overflow: Overflow.visible,
    );
  }
}
