import 'package:app_food_demo/core/consts.dart';
import 'package:app_food_demo/core/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'menu_clipper.dart';

class MenuWidget extends StatelessWidget {
  final int activeIndex;
  final Function(int) onChange;

  MenuWidget({@required this.onChange, @required this.activeIndex});

  static final itemWidth = 150.0;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi / 2,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              _buildMenuItem("Vegetables", 0),
              _buildMenuItem("Chicken", 1),
              _buildMenuItem("Beef", 2),
              _buildMenuItem("Thai", 3),
            ],
          ),
          buildAnimatedLug(),
        ],
      ),
    );
  }

  AnimatedContainer buildAnimatedLug() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      margin: EdgeInsets.only(left: itemWidth * activeIndex),
      width: itemWidth,
      height: 75,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: MenuClipper(),
              child: Container(
                width: itemWidth,
                height: 60,
                color: AppColors.greenColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Transform.rotate(
              angle: math.pi / 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Icon(
                  FlutterIcons.arrow,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, int index) {
    return GestureDetector(
      onTap: () => onChange(index),
      child: Container(
        width: 150,
        padding: EdgeInsets.only(top: 16),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
