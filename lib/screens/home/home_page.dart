import '../../models/food_model.dart';
import 'package:flutter/material.dart';

import 'widgets/body_widget.dart';
import 'widgets/sidebar_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FoodModel> foodList = FoodModel.list;
  var menuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            //body content
            BodyWidget(foodList: foodList),
            //sidebar with vertical menu
            SidebarWidget(
              activeIndex: menuIndex,
              onChange: (index) => setState(() => menuIndex = index),
            ),
          ],
        ),
      ),
    );
  }
}
