import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/theme/colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:toast/toast.dart';

class LoadingScreen extends StatelessWidget {
  final String text;
  final String sub;

  const LoadingScreen({Key key, this.text, this.sub}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: SizedBox()),
          SleekCircularSlider(
          appearance: CircularSliderAppearance(
            spinnerMode: true,
            customWidths: CustomSliderWidths(
              progressBarWidth: 2,
            ),
            customColors: CustomSliderColors(
              progressBarColor: blue,
              dotColor: Colors.white,
              trackColor: Colors.white
            )
          )),
        Padding(
          padding: const EdgeInsets.only(top :30.0,bottom:  10),
          child: Text(text,style: GoogleFonts.josefinSans(fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
        ),
        Text(sub,style: GoogleFonts.josefinSans(fontWeight: FontWeight.w600,fontSize: 10, color: Colors.grey),textAlign: TextAlign.center,),
        Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
              backgroundColor: blue,
              elevation: 0,
              child: Icon(FeatherIcons.x,),
              onPressed: (){
                Toast.show("You have cancelled the process", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                 Navigator.of(context).pop();
              },
        ))
        ],
      ),
      
    );
  }
}
