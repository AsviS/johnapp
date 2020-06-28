import 'package:country_code_picker/country_code_picker.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:repay/api/accounts/accounts.dart';
import 'package:repay/components/button_container.dart';
import 'package:repay/components/container_text_input.dart';
import 'package:repay/screens/startapp/login.dart';
import 'package:repay/screens/startapp/startapp.dart';
import 'package:toast/toast.dart';
import 'package:repay/theme/colors.dart';



class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //controllera
  TextEditingController user_name_controller = TextEditingController();
  TextEditingController full_name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
  TextEditingController repassword_controller = TextEditingController();

  String country_name;
  String country_code;
  TextEditingController password_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          titleSpacing: 0,
          title: Text("Sign Up",style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.w700),),
          leading: IconButton(icon: Icon(FeatherIcons.arrowLeft,color: Colors.black,),
              onPressed: ()=>Navigator.of(context).pop()),
        ),
        body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              SizedBox(height: 20,),
              ContainerTextInput(
                controller: user_name_controller,
                icon: FeatherIcons.user,
                radius: 10,
                hint: "Username",
              ),
              ContainerTextInput(
                controller: full_name_controller,
                icon: FeatherIcons.user,
                radius: 10,
                hint: "Full Name",
              ),
              ContainerTextInput(
                controller: email_controller,
                icon: FeatherIcons.mail,
                radius: 10,
                hint: "Email",
              ),

              ContainerPrefixInput(
                radius: 10,
                hint: "Phone Number",
                controller: phone_controller,
                child: CountryCodePicker(
                  onChanged: (country){
                    setState(() {
                      country_name = country.name;
                      country_code = "${country.dialCode}";
                      print(country_code);
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
                obcure_text: true,
                controller: password_controller,
                icon: FontAwesomeIcons.key,
                radius: 10,
                hint: "Password",
              ),
              ContainerTextInput(
                obcure_text: true,
                controller: repassword_controller,
                icon: FontAwesomeIcons.key,
                radius: 10,
                hint: "RePassword",
              ),
              ButtonContainer(
                radius: 10,
                height: 50,
                width: width,
                color: blue,
                tColor: Colors.white,
                text: "Sign Up",
                onPress: ()async{

                //Dialog for processing data  
                  

                  //Validator      
                  if(user_name_controller.text == ""){
                    Toast.show("Please make provide a username", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                  }else if(full_name_controller.text == ""){
                    Toast.show("Please make provide  full name", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                  } else if(email_controller.text == ""){
                    Toast.show("Please make provide username email", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                  } else if(phone_controller.text == "null"){
                    Toast.show("Please make provide a phone number", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                  }else  if (repassword_controller.text == password_controller.text){
                   Toast.show("Please make sure your Passwords are a match ", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                        barrierColor: Colors.black45,
                        transitionDuration: const Duration(milliseconds: 200),
                        pageBuilder: (BuildContext buildContext,
                            Animation animation,
                            Animation secondaryAnimation) {
                          return Material(
                            child: Container(
                              width: 200,
                              height: 200,
                              padding: EdgeInsets.all(20),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Expanded(child: SizedBox()),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(backgroundColor: Colors.white, strokeWidth: 0.5, valueColor: AlwaysStoppedAnimation<Color>(blue),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Processing data into the database", style: TextStyle(fontSize:12, fontWeight:FontWeight.w400, color: Colors.grey,)),
                                  ),
                                  IconButton(
                                    icon: Icon(FeatherIcons.x, color: blue,),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Toast.show("You cancelled the process", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                                    },
                                    color: const Color(0xFF1BC0C5),
                                  ),
                                  Expanded(child: SizedBox()),
                                ],
                              ),
                            ),
                          );
                        });

                      String message = await signup(
                          user_name_controller.text,
                          full_name_controller.text,
                          email_controller.text,
                          "$country_code${phone_controller.text}",
                          country_name,
                          password_controller.text);
                          print(message);
                      if (message == "User created"){
                            Toast.show("You have Signed Up in Successfully.", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                            Navigator.of(context).pop();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LogIn()));
                          }else{
                            Navigator.of(context).pop();
                            Toast.show(message, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                          }
                  }},
              ),

              Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Already have an account?",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey),),
              ))
            ],
          ),
        )
    );
  }
}