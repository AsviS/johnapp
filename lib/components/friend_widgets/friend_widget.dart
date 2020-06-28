import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/utils/constants.dart';

class FriendWidget extends StatelessWidget {
  final String profile_image;
  final String date;
  final String username;
  final String last_message;
  final Function onTap;

  const FriendWidget({Key key, this.profile_image, this.username, this.last_message, this.onTap, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              blurRadius: 0.5
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
               Padding(
                 padding: const EdgeInsets.only(left:20.0,top: 20),
                 child: Container(
                   height: 50,
                   width: 50,
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     image: DecorationImage(image: NetworkImage(base_url+"/media/"+profile_image),fit: BoxFit.cover)
                   ),
                 ),
               ),
              Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height:20,
                      width: MediaQuery.of(context).size.width-100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(child: SizedBox()),
                          Text(date, style: GoogleFonts.archivoNarrow(fontWeight: FontWeight.w400, fontSize: 12,color: Colors.grey),),

                        ],
                      ),
                    ),
                    SizedBox(height: 4,),

                    Text(username, style: GoogleFonts.josefinSans(fontWeight: FontWeight.w600, fontSize: 16),),
                    SizedBox(height: 4,),
                    Text(last_message, style: GoogleFonts.archivoNarrow(fontWeight: FontWeight.w400, fontSize: 12,color: Colors.grey),),
                  ],
                ),
              ),

          ],),
        ),
      ),
    );
  }
}
