import 'package:flutter/material.dart';
import 'package:repay/api/connections/find_friend_models.dart';
import 'package:repay/screens/startapp/startapp.dart';
import 'package:repay/theme/colors.dart';
import 'package:repay/utils/constants.dart';

class FriendHolder extends StatelessWidget {
  final List<Users> data;

  const FriendHolder({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index){
        return Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
                  border: Border.all(color:Colors.grey[100])
                ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color:Colors.grey[100]),
                  ),
                  child: Image.network(base_url+"/media/"+data[index].profile_image,fit: BoxFit.cover,),
                ),
              ),
              SizedBox(height: 8,),
              Text(data[index].username),
              SizedBox(height: 2,),
              StartUpButtom(
                width:200,
                height:40,
                color: blue,
                text_color: Colors.white,
                text:"Connected"
              )

            ],
          ),
        );
      }
      );
  }
}