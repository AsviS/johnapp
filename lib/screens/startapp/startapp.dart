import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/components/container_text.dart';
import 'package:repay/components/custom_button.dart';
import 'package:repay/screens/startapp/login.dart';
import 'package:repay/screens/startapp/sign_up.dart';
import 'package:repay/theme/colors.dart';
import 'package:repay/utils/settings_helper.dart';

class StartApp extends StatefulWidget {
  final MyAppSettings settings;
  StartApp({Key key, this.settings}) : super(key: key);

  @override
  _StartAppState createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
 String page_index = "0";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.white),
        title:     DotsIndicator(
          dotsCount: 3,
          position: double.parse(page_index),
          decorator: DotsDecorator(
            size: const Size.square(3.0),
            activeSize: const Size(15.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            activeColor: blue
          ),
        ),
        centerTitle: true,
      ),
      body:Column(
        children: <Widget>[
          Container(
            height: height/1.8,
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300].withOpacity(0.5),
                    blurRadius: 20
                )
              ],
            ),
            child: PageView(

              onPageChanged: (value){
                setState(() {
                  page_index = value.toString();
                });
              },
              children: <Widget>[
              StartUpShow(
                pic: 'assets/images/keep.png',
                title: 'Secure & Safe',
                des: 'Be able to save and use your money with tight security',
              ),
              StartUpShow(
                pic: 'assets/images/buy.png',
                title: 'Buy & Sell ',
                des: 'Buy goods and services more easily and secure from the comfort of your mobile phone',
              ),
              StartUpShow(
                pic: 'assets/images/ks.png',
                title: 'Send and Receive money',
                des: 'Send and Receive money easily and securely using your phone',
              ),

              ],
            ),
          ),

        Expanded(child: SizedBox()),
        StartUpButtom(
          color: Colors.white,
          text: "Log In",
          text_color: Colors.black,
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogIn(settings: widget.settings ))),
        ),
        StartUpButtom(
          color: blue,
          text: "Sign Up",
          text_color: Colors.white,
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp())),
        )
        ],
      )
    );
  }
}


class StartUpButtom extends StatelessWidget {
  Color color;
  Color text_color;
  String text;
  Function onTap;
  double height;
  double width;
  double radius;

  StartUpButtom({this.color, this.text,this.text_color, this.onTap,this.height, this.width,this.radius});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height == null ?50 : height,
          width: width == null ? double.infinity :width,
          decoration: BoxDecoration(
              color: color,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300].withOpacity(0.5),
                    blurRadius: 20
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(radius == null ? 10:radius))
          ),
          child: Center(
            child: Text(text,style: GoogleFonts.archivoNarrow(color: text_color, fontWeight: FontWeight.w400),),
          ),
        ),
      ),
    );
  }
}

class StartUpShow extends StatelessWidget {
  final String pic;
  final String title;
  final String des;

  StartUpShow({this.pic, this.title, this.des});
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Expanded(child: SizedBox(),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 180,
                width: 180,
                child: Image.asset(pic)),
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,style: GoogleFonts.archivoNarrow(fontSize: 15, fontWeight: FontWeight.w800),),
          ),
          Padding(
            padding: const EdgeInsets.only(left:18.0,right: 18,top: 8,bottom: 8),
            child: Text(des,style: GoogleFonts.archivoNarrow(fontSize: 12, fontWeight: FontWeight.w300,color: Colors.grey,),textAlign: TextAlign.center,),
          ),
          Expanded(child: SizedBox()),

        ],
      ),
    );
  }
}

