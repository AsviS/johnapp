import 'package:country_code_picker/country_code_picker.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:repay/api/accounts/accounts.dart';
import 'package:repay/components/button_container.dart';
import 'package:repay/components/container_text_input.dart';
import 'package:repay/pages/home.dart';
import 'package:repay/screens/startapp/loading_screen.dart';
import 'package:repay/screens/startapp/sign_up.dart';
import 'package:repay/screens/startapp/startapp.dart';
import 'package:repay/theme/colors.dart';
import 'package:repay/utils/settings_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class LogIn extends StatefulWidget {
  final MyAppSettings settings;
  LogIn({Key key, this.settings}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController password_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
  String country_code;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        leading: IconButton(icon: Icon(FeatherIcons.arrowLeft,color: Colors.black,), onPressed: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> StartApp(settings: widget.settings,)))),
      ),
      body:SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
               Container(
                  width: width,
                  height: height/3.3,
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
                  child:  Column(
                    children: <Widget>[
                      Expanded(child: SizedBox(),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              image: DecorationImage(image: AssetImage('assets/images/repay_logo.png'))
                            )),
                      ),
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Welcome Back',style: GoogleFonts.archivoNarrow(fontSize: 18, fontWeight: FontWeight.w800),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:18.0,right: 18,top: 8,bottom: 8),
                        child: Text('Send and Receive money more easily.',style: GoogleFonts.archivoNarrow(fontSize: 12, fontWeight: FontWeight.w400,color: Colors.grey,),textAlign: TextAlign.center,),
                      ),

                      Expanded(child: SizedBox()),

                    ],
                  ),
                ),
              SizedBox(height: 20,),
              ContainerPrefixInput(
                radius: 5,
                hint: "phone number",
                controller: phone_controller,
                child: CountryCodePicker(
                  onChanged: (country){
                      setState(() {
                        country_code = country.dialCode;
                      });
                  },
                  initialSelection: 'IT',
                  favorite: ['+254','KE'],
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: false,
                ),
              ),
              ContainerTextInput(
                controller: password_controller,
                icon: FontAwesomeIcons.key,
                radius: 5,
                hint: "Password",
                obcure_text: true,
              ),


              StartUpButtom(
                color: Colors.white,
                text: "Log In",
                text_color: Colors.black,
                onTap: ()async {
                  String phone_number = country_code + phone_controller.text;
                  if (phone_controller.text == ""){
                      Toast.show("You have not entered your phone_number", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                  }else if (password_controller.text == ""){
                      Toast.show("You have not entered your password", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                  }else{
                       showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                          barrierColor: Colors.black45,
                          transitionDuration: const Duration(milliseconds: 200),
                          pageBuilder: (BuildContext buildContext,
                              Animation animation,
                              Animation secondaryAnimation) {
                            return LoadingScreen(
                              text: "Verifying log in credentials",
                              sub: "Welcome back we're happy to serve you",
                            );
                          });
                      String access_token = await log_in(
                          phone_number, password_controller.text
                      );
                      if (access_token == "null") {
                        Navigator.of(context).pop();
                        Toast.show("Please enter the credentials correctly", context, duration: 3, gravity:  Toast.BOTTOM);
                      } else {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setString('key', access_token);
                        print(access_token);
                        Navigator.of(context).pop();
                        Toast.show("You have logged in Successfully", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(settings: widget.settings,)));
                  }}
                },
              ),
              StartUpButtom(
                color: blue,
                text: "Sign Up",
                text_color: Colors.white,
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp())),
              ),

              SizedBox(height: 50,),

            ],
          ),
      ),
    );
  }
}