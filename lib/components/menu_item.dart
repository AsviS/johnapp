import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatelessWidget {
  final String unread;
  final Function onTap;
  final String text;
  final IconData icon;
  final Color icon_color;
  final bool bell;
  const MenuItem({Key key, this.onTap, this.text, this.icon, this.bell, this.icon_color, this.unread}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
            onTap: onTap,
             child: Ink(
               child: Container(
                height:40,
                
                width: double.infinity,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.only(left:20),
                     child: Icon(icon,size: 20,color:icon_color == null ? Colors.grey[700] : icon_color,),
                   ),
                    Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(text,style: GoogleFonts.archivoNarrow(fontSize:13,color: icon_color == null ? Colors.grey[700] : icon_color,fontWeight: FontWeight.w400),),
                  ),
                  Expanded(child: SizedBox()),
                  Visibility(
                    visible: bell == null ? false : true,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height:30,
                        width:30,
                        decoration:BoxDecoration(
                          shape:BoxShape.circle,
                          color:Colors.red
                        ),
                        child: Center(
                           child: Text(unread == null ? "0" : unread,style:TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 10)),
                        ),
                      ),
                    ),
                  )
                ],
                ), 

             ),
          ),
    ));
  }
}


class NavItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color icon_color;
  final Function  onPress;
  const NavItem({Key key, this.text, this.icon, this.onPress, this.icon_color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
              height: double.infinity,
              width: 50,
              child: Column(
                children: <Widget>[
                  Expanded(child: SizedBox()),
                  Icon(icon,size: 18,color: icon_color),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(text,style: GoogleFonts.archivoNarrow(fontSize:12, color:icon_color, fontWeight: FontWeight.w400),),
                  ),
                  Expanded(child: SizedBox()),

                ],
              ),
            ),
    );
  }
}