import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final double border;
  final Color color;
  final Color t_color;

  const CustomButton({Key key, this.onTap, this.text, this.border, this.color, this.t_color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height:50,
          width:double.infinity,
          decoration: BoxDecoration(
            color:color == null ?Colors.white:color,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color:color == null ?Colors.grey[400].withOpacity(0.5) : color ,width: border == null ? 0 :border)
          ),
          child: Center(
            child:Text(text,style:GoogleFonts.archivoNarrow(
             color:t_color == null ?Colors.black : t_color, 
             fontSize:15,
             fontWeight:FontWeight.w400))
          ),
          ),
      ),
    );
}
}