import 'package:app_food_demo/core/consts.dart';
import 'package:app_food_demo/core/flutter_icons.dart';
import 'package:flutter/material.dart';

import 'menu_widget.dart';

class SidebarWidget extends StatelessWidget {
  final int activeIndex;
  final Function(int) onChange;

  SidebarWidget({@required this.onChange, @required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          color: AppColors.greenColor,
          height: MediaQuery.of(context).size.height,
          width: 60,
          padding: EdgeInsets.only(top: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  image: DecorationImage(
                    image: ExactAssetImage("assets/profile.jpg"),
                  ),
                ),
              ),
              Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: Icon(FlutterIcons.menu),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: MenuWidget(activeIndex: activeIndex, onChange: onChange),
        ),
      ],
    );
  }
}
