import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/theme/colors.dart';

class FabItem extends StatelessWidget {
  final String text;
  final Function onpress;
  final IconData icon;
  
  const FabItem({Key key, this.text, this.onpress, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RawMaterialButton(
            onPressed: onpress,
            child: Row(
              children: <Widget>[
                Icon(icon, color: Colors.grey[600],size: 18,),
                SizedBox(width: 10,),
                Text(text, style: GoogleFonts.archivoNarrow(color: Colors.grey[600], fontWeight: FontWeight.w300),)
              ],
            ),),
      ),
    );
  }
}
