import 'package:flutter/material.dart';

class ContainerText extends StatelessWidget {
  final Color title_color;
  final Color des_color;
  final String title;
  final String des;

  const ContainerText({Key key, this.title, this.des, this.title_color, this.des_color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(left:8.0,top: 10),
            child: Text(title,style: TextStyle(fontWeight:FontWeight.w400, fontSize:15,color:title_color == null ? Colors.grey: title_color),),
          ),
           Padding(
            padding: const EdgeInsets.only(left:8.0,top: 4),
            child: Text(des,style: TextStyle(fontWeight:FontWeight.w400, fontSize:16, color: des_color == null ? Colors.black : des_color),),
          ),
      ],),
    );
  }
}