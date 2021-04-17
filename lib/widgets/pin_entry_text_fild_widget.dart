import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class PinEntryTextField extends StatefulWidget {
  final String lastPin;
  final int fields;
  final onSubmit;
  final fontSize;
  final isTextObscure;
  final showFieldAsBox;

  PinEntryTextField({
    this.lastPin,
    this.fields: 4,
    this.onSubmit,
    this.fontSize: 36.0,
    this.isTextObscure: false,
    this.showFieldAsBox: false,
  }) : assert(fields > 0);

  @override
  State createState() {
    return PinEntryTextFieldState();
  }
}

class PinEntryTextFieldState extends State<PinEntryTextField> {
  List<String> _pin;
  List<FocusNode> _focusNodes;
  List<TextEditingController> _textControllers;

  Widget textfields = Container();

  @override
  void initState() {
    super.initState();
    _pin = List<String>(widget.fields);
    _focusNodes = List<FocusNode>(widget.fields);
    _textControllers = List<TextEditingController>(widget.fields);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (widget.lastPin != null) {
          for (var i = 0; i < widget.lastPin.length; i++) {
            _pin[i] = widget.lastPin[i];
          }
        }
        textfields = generateTextFields(context);
      });
    });
  }

  @override
  void dispose() {
    _textControllers.forEach((TextEditingController t) => t.dispose());
    super.dispose();
  }

  Widget generateTextFields(BuildContext context) {
    List<Widget> textFields = List.generate(widget.fields, (int i) {
      return buildTextField(i, context);
    });

    if (_pin.first != null) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: textFields);
  }

  void clearTextFields() {
    _textControllers.forEach(
        (TextEditingController tEditController) => tEditController.clear());
    _pin.clear();
  }

  Widget buildTextField(int i, BuildContext context) {
    if (_focusNodes[i] == null) {
      _focusNodes[i] = FocusNode();
    }
    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
      if (widget.lastPin != null) {
        _textControllers[i].text = widget.lastPin[i];
      }
    }

    _focusNodes[i].addListener(() {
      if (_focusNodes[i].hasFocus) {}
    });

    final String lastDigit = _textControllers[i].text;

    return Container(
        width: 68,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0XFFF1F3F7),
        ),
        margin: const EdgeInsets.all(8),
        child: TextField(
          showCursor: false,
          controller: _textControllers[i],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          obscureText: true,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: widget.fontSize,
          ),
          focusNode: _focusNodes[i],
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: "",
            hintText: "•",
            hintStyle: TextStyle(
              fontSize: widget.fontSize,
            ),
          ),
          onChanged: (String str) {
            setState(() {
              _pin[i] = str;
            });
            if (i + 1 != widget.fields) {
              _focusNodes[i].unfocus();
              if (lastDigit != null && _pin[i] == '') {
                FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
              } else {
                FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
              }
            } else {
              _focusNodes[i].unfocus();
              if (lastDigit != null && _pin[i] == '') {
                FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
              }
            }
            if (_pin.every((String digit) => digit != null && digit != '')) {
              widget.onSubmit(_pin.join());
            }
          },
          onSubmitted: (String str) {
            if (_pin.every((String digit) => digit != null && digit != '')) {
              widget.onSubmit(_pin.join());
            }
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return textfields;
  }
}
