import 'package:flutter/material.dart';

class ContainerItem extends StatelessWidget {
  final double width;
  final Color icon_color;
  final Color stroke_color;
  final double stroke;
  final double height;
  final String text;
  final Function onpress;
  final IconData icon;
  final Function onTap;

  const ContainerItem({Key key, this.width, this.height, this.text, this.onpress, this.icon, this.icon_color, this.stroke, this.stroke_color, this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height,
              width:width,
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color:icon_color,
                  width: stroke
                )
              ),
              child: Center(
                child:Icon(icon,color: icon_color,)
              ),
            ),
          ),
    );
  }
}