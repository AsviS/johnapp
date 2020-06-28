import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                image:DecorationImage(image: AssetImage("assets/images/not_found.png"))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("No data found.", style: GoogleFonts.archivoNarrow(),),
          ),
        ],
      ),
    );
  }
}
