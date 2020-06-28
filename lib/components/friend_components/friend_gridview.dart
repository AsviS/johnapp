import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/api/accounts/connection_model.dart';
import 'package:repay/pages/make_payments/send_money_friend/pay_friend.dart';
import 'package:repay/screens/account_screens/chat_screen.dart';
import 'package:repay/utils/constants.dart';
import 'package:repay/utils/settings_helper.dart';

class FriendGridview extends StatelessWidget {
  final MyAppSettings settings;
  final List<ConnectionModel> data;
  final bool list;
  final bool physic;
  final bool shrink;
  final bool messaging;

  const FriendGridview({Key key, this.data, this.list, this.physic, this.shrink, this.messaging, this.settings}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return data.length >0 ?
          list == null ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: data.length,
              shrinkWrap: shrink == null ? false : true,
              physics: physic == null ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                String image = base_url+"/media/"+data[index].profile_image;
                return Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: ()=> messaging == null ? Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PayFriend(
                        image: image,
                        phone_number: data[index].phone_number,))):
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChatScreen(
                       user_pic: data[index].profile_image,
                       username: data[index].username,
                       chat_id: data[index].chat_id,
                       settings: settings,
                     ))),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover)
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(data[index].username, style: GoogleFonts.archivoNarrow(),)
                  ],
                );
              })
          :
          ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                String image = base_url+"/media/"+data[index].profile_image;
                return Column(
                  children: <Widget>[
                    index.isEven ? Expanded(child: SizedBox()) : SizedBox(height: 5,),
                    GestureDetector(
                      onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PayFriend(
                        image: image,
                        phone_number: data[index].phone_number,))),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover)
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(data[index].username, style: GoogleFonts.archivoNarrow(),)
                  ],
                );
              })
    :
      Expanded(child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

        ],
      ));
  }
}
