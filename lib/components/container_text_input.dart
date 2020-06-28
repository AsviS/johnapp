import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerTextInput extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final bool number_keyboard;
  final bool obcure_text;

  const ContainerTextInput({Key key, this.height, this.width, this.radius, this.hint, this.icon, this.controller, this.obcure_text, this.number_keyboard}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height == null ? 50 : height,
        width: width == null ? 100 : width,
        decoration: BoxDecoration(
            borderRadius: radius == null ? BorderRadius.all(Radius.circular(30)) :BorderRadius.all(Radius.circular(radius)),
            color:Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300].withOpacity(0.5),
                  blurRadius: 20
              )
            ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:8.0,right: 8),
          child: Center(
            child: TextField(
              controller: controller,
              style: GoogleFonts.archivoNarrow(
                  color: Colors.black
              ),
              obscureText: obcure_text == null ? false : true,
              keyboardType: number_keyboard == true ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(
                icon: Icon(icon),
                hintText: hint,
                border: InputBorder.none
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class ContainerPrefixInput extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final String hint;
  final TextEditingController controller;
  final Widget child;
   ContainerPrefixInput({Key key, this.height, this.width, this.radius, this.hint, this.controller,this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height == null ? 50 : height,
        width: width == null ? 100 : width,
        decoration: BoxDecoration(
            borderRadius: radius == null ? BorderRadius.all(Radius.circular(30)) :BorderRadius.all(Radius.circular(radius)),
            color:Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300].withOpacity(0.5),
                  blurRadius: 20
              )
            ],
        ),
        child:  Row(
          children: <Widget>[
            child,
            Expanded(
              child: TextField(
                controller: controller,
                style: GoogleFonts.archivoNarrow(
                    color: Colors.black,

                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextInputType getType(String type){
  if(type == "email"){
    return TextInputType.emailAddress;
  }else if(type == "number"){
    return TextInputType.number;

  }
}