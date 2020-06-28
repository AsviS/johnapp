import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:repay/screens/account_screens/screen_profile.dart';
import 'package:repay/utils/constants.dart';
import 'package:repay/components/menu_item.dart';
import 'package:repay/screens/screen_bank_cards.dart';
import 'package:repay/screens/screen_card.dart';
import 'package:repay/screens/screen_friend.dart';
import 'package:repay/screens/screen_home.dart';
import 'package:repay/screens/screen_merchants.dart';
import 'package:repay/screens/screen_notification.dart';
import 'package:repay/screens/screen_payments.dart';
import 'package:repay/screens/startapp/login.dart';
import 'package:repay/theme/colors.dart';
import 'package:repay/utils/settings_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class Home extends StatefulWidget {
   final MyAppSettings settings;

  const Home({Key key, this.settings}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final PageStorageBucket bucket = PageStorageBucket();
  int index = 0;


  nav_choices nav_choosed = nav_choices.dashboard;
  String profile_image = default_profile_image;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark
    ));

  }
  @override
  Widget build(BuildContext context) {

    List<Widget> screens = [
      ScreenHome(settings: widget.settings,),
      ScreenNotification(settings: widget.settings,),
      ScreenBankCards(),
      ScreenPayments(),
      ScreenFriend(settings: widget.settings,),
      ScreenMerchants()

    ];
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _globalKey,
      drawerScrimColor: Colors.grey.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.menu, color:Colors.black),onPressed: (){
          _globalKey.currentState.openDrawer();
          },),
        actions: <Widget>[
         PreferenceBuilder<String>(
             preference: widget.settings.profile_image,
             builder: (context, String profile_image){
              return  GestureDetector(
                onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScreenProfile(settings: widget.settings,))),
                child: Padding(
                   padding: const EdgeInsets.all(14.0),
                   child: Container(
                       height:10,
                       width:30,
                       decoration:BoxDecoration(
                           color: Colors.white,
                           image: DecorationImage(image: NetworkImage(base_url+profile_image)),
                           borderRadius: BorderRadius.all(Radius.circular(10)))
                   ),
                 ),
              );
         })
        ],
      ),
      body: PageStorage(bucket: bucket, child: screens[index]),
      drawer: Container(
        width: width/1.6,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          SizedBox(height: 30,),  
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              border:Border(bottom: BorderSide(color:Colors.grey[100]))
            ),
            child: Row(
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:10,top:4,bottom: 4,right: 10),
                child: Container(
                  height:40,
                  width:40,
                  decoration:BoxDecoration(
                    shape:BoxShape.circle
                  ),
                  child: Image.network("https://www.repay.africa/wp-content/uploads/2020/04/Repay-Logo-Full-colorw-tagline.png"),
                ),
              ) ,
             Expanded(child:PreferenceBuilder<String>(
               preference: widget.settings.full_name,
               builder: (context, String username){
                 return  Text(username, style: TextStyle(fontWeight: FontWeight.w600,fontSize:15));
               }),),
             IconButton(icon: Icon(Icons.edit), onPressed: null)
            ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 8,bottom: 10),
            child: Text("Main",style: TextStyle(fontWeight: FontWeight.w600,fontSize:16),),
          ),
          MenuItem(
            text: "Home",
            icon: Icons.dashboard,
            icon_color: nav_choosed == nav_choices.dashboard ? blue : null,
            onTap: (){
              setState(() {
                nav_choosed = nav_choices.dashboard;
                index = 0;
              });
            },
          ),
          MenuItem(
            text: "Notification",
            icon: Icons.notifications,
            unread: widget.settings.unread.getValue().toString(),
            bell: true,
            icon_color: nav_choosed == nav_choices.notifications ? blue : null,
            onTap: (){
              setState(() {
                nav_choosed = nav_choices.notifications;
                index = 1;
              });
            },
          ),
          MenuItem(
            text: "Your Cards",
            icon: Icons.credit_card,
            icon_color: nav_choosed == nav_choices.cards ? blue : null,
            onTap: (){
              setState(() {
                nav_choosed = nav_choices.cards;
                index = 2;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 20,bottom: 10),
            child: Text("User Data",style: TextStyle(fontWeight: FontWeight.w600,fontSize:16),),
          ),
          MenuItem(
            text: "Transactions",
            icon: Icons.attach_money,
            icon_color: nav_choosed == nav_choices.payments ? blue : null,
            onTap: (){
              setState(() {
                nav_choosed = nav_choices.payments;
                index = 3;
              });
            },
          ),
           MenuItem(
            text: "Chats",
            icon: FeatherIcons.messageCircle,
            icon_color: nav_choosed == nav_choices.friends ? blue : null,
            onTap: (){
              setState(() {
                nav_choosed = nav_choices.friends;
                index = 4;
              });
            },
          ),
           MenuItem(
            text: "Merchants",
            icon: Icons.business,
            icon_color: nav_choosed == nav_choices.merchants ? blue : null,
            onTap: (){
              setState(() {
                nav_choosed = nav_choices.merchants;
                index = 5;
              });
            },
          ),
           Padding(
            padding: const EdgeInsets.only(left: 20,top: 20,bottom: 10),
            child: Text("Others",style: TextStyle(fontWeight: FontWeight.w600,fontSize:16),),
          ),
          MenuItem(
            text: "Settings",
            icon: Icons.settings,
            onTap: null,
          ),
          MenuItem(
            text: "FAQ",
            icon: Icons.question_answer,
            onTap: null,
          ),
           MenuItem(
            text: "Help",
            icon: Icons.help,
            onTap: null,
          ),
          MenuItem(
            text: "Log Out",
            icon: Icons.power_settings_new,
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LogIn(settings: widget.settings,)));
            },
          ),
        ],
        ),

      ),
      
    );
  }
}

enum nav_choices{
  dashboard,
  notifications,
  cards,
  payments,
  friends,
  merchants,
}