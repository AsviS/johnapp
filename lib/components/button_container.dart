import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:repay/theme/colors.dart';

class ButtonContainer extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final Color color;
  final Function onPress;
  final String text;
  final Color tColor;
  bool borders = false;

   ButtonContainer({Key key, this.height, this.width, this.color, this.onPress, this.text, this.tColor, this.radius, this.borders}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height == null ? 50 : height,
          width: width == null ? 100 : width,
          decoration: BoxDecoration(
            borderRadius: radius == null ? BorderRadius.all(Radius.circular(30)) :BorderRadius.all(Radius.circular(radius)),
            color: color == null ? blue : color,
            border: borders == true ? Border.all(color: blue) : Border.all(color: Colors.transparent, width: 0)
          ),
          child: Center(
            child: Text(text,style: TextStyle(color: tColor == null ?Colors.white : tColor),),
          ),
        ),
      ),
    );
  }
}
