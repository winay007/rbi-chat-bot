import 'package:flutter/material.dart';

class PDFscreen extends StatelessWidget {
  const PDFscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: const Color.fromARGB(22, 176, 42, 37),
                  // textColor: kPrimaryColor,
                  padding: EdgeInsets.all(16),
                  shape: const CircleBorder(),
                  elevation: 0.0,
                  highlightElevation:
                      0.0, // Set highlight elevation to 0.0 to remove animation
                  splashColor: Colors
                      .transparent, // Set splash color to transparent to remove splash effect
                  child: Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 25,
                  right:80,
                  bottom: 25,
                ),
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB02925),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
