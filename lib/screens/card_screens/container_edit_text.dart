import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerEditText extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool center;
  final bool number;
  const ContainerEditText({Key key, this.hint, this.controller, this.center, this.number}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[200])
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlign: center == null ? TextAlign.start:TextAlign.center,
              style: GoogleFonts.archivoNarrow(fontSize: 15,color: Colors.grey[600]),
               controller: controller,
               keyboardType: number == null ? TextInputType.text :TextInputType.number,
               decoration: InputDecoration(
                 hintText: hint,
                 hintStyle: GoogleFonts.archivoNarrow(fontSize: 15,color: Colors.grey[600]),
                 border: InputBorder.none
               ),
            ),
          ),
        ),
      ),
    );
  }
}
