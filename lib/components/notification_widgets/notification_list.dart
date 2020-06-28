import 'package:flutter/material.dart';
import 'package:repay/anim/FadeAnimation.dart';
import 'package:repay/components/notification_widgets/notification_card.dart';
import 'package:repay/api/accounts/notification_model.dart';

class NotificationList extends StatelessWidget {
  final List<NotificationModel> data;

  const NotificationList({Key key ,this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return data.length == null ?
     Text("data")
    :ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index){
          return NotificationCard(
              id:data[index].id,
              notification_status: data[index].notification_status,
              sender: data[index].sender_username,
              request: data[index].notification_type,
              sub: data[index].notification_message,
              date: data[index].notification_date,
          );
        });
  }
}
