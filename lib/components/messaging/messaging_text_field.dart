import 'package:flutter/material.dart';
import 'package:repay/theme/colors.dart';

class MessagingTextField extends StatelessWidget {
  final TextEditingController controller;

  const MessagingTextField({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return  Flexible(
      child: new ConstrainedBox(
        constraints: new BoxConstraints(
          minWidth: size.width,
          maxWidth: size.width,
          minHeight: 25.0,
          maxHeight: 135.0,
        ),
        child: new Scrollbar(
          child: new TextField(
            cursorColor: blue,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                  top: 2.0,
                  left: 13.0,
                  right: 13.0,
                  bottom: 2.0),
              hintText: "Type your message",
              hintStyle: TextStyle(
                color:Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
