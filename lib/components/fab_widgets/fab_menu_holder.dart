import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:repay/components/fab_widgets/fab_item.dart';

class FabMenuHolder extends StatelessWidget {
  final bool isVisible;
  AnimationController _controller;
  final List<Widget> children;

   FabMenuHolder({Key key, this.isVisible, this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child:  Container(
        width: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow:[
              BoxShadow(
                color: Colors.grey[300],
                blurRadius: 5,

              )
            ]
        ),

        child: Column(
          children: children,
        ),
      ),
    );
  }
}
