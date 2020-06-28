import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/anim/FadeAnimation.dart';
import 'package:repay/components/fab_widgets/fab_menu_holder.dart';
import 'package:repay/theme/colors.dart';

import 'fab_item.dart';

class FabMenu extends StatelessWidget {
  final List<Widget> children;
  final bool visible;
  final Function onpress;

  FabMenu({Key key, this.children, this.visible, this.onpress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(0.5,
      Row(
        children: <Widget>[
          Expanded(child: SizedBox()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(child: SizedBox()),
              FadeAnimation(
                0.5,FabMenuHolder(
                  isVisible: visible,
                  children: children,
                ),
              ),
              SizedBox(height: 10,),
              FloatingActionButton(
                  backgroundColor: blue,
                  child: Center(child: Icon(FeatherIcons.plus, color: Colors.white,),),
                  onPressed:onpress),


            ],
          ),
        ],
      ),
    );
  }
}


