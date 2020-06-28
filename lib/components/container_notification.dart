import 'package:flutter/material.dart';

class ContainerNotification extends StatelessWidget {
  final String title;
  final String des;
  final String date; 
   const ContainerNotification({Key key, this.title, this.des, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border:Border(bottom: BorderSide(color:Colors.grey[300].withOpacity(0.5)))
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(title,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),maxLines: 1,),
                    Text(des,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,color: Colors.grey),maxLines: 3,),
                    Padding(
                      padding: const EdgeInsets.only(top :8.0),
                      child: Text(date,style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400,color: Colors.blue)),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(child: SizedBox()),
                        CustomChip(),
                      ],
                    )
                ]
                ),
          ),
        );
  }
}

class CustomChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.5),
          borderRadius:BorderRadius.all(Radius.circular(10))
        ),
        child: Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Payment Request",style: TextStyle(color:Colors.white, fontWeight:FontWeight.w300, fontSize:10),),
        )),
      ),
    );
  }
}