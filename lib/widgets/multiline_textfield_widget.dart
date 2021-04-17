import 'package:flutter/material.dart';

class MultilineTextField extends StatefulWidget {
  final String hintText;


  MultilineTextField({this.hintText});

  @override
  _MultilineTextFieldState createState() => _MultilineTextFieldState();
}

class _MultilineTextFieldState extends State<MultilineTextField> {
  TextEditingController mycontroler = TextEditingController();
  var remianText = 500;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xFFF1F3F7),
            )),
        Container(
          padding: const EdgeInsets.only(left: 15, top: 2),
          child: TextField(
            maxLines: 7,
            controller: mycontroler,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
            ),
            onChanged: (String text) {
              print(text.length);
              setState(() {
                remianText = 500 - text.length;
              });
            },
          ),
        ),
        Positioned(
          bottom: 5,
          right: 15,
          child: Text(
            "$remianText",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
