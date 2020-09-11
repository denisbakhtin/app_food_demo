import 'package:app_food_demo/models/food_model.dart';
import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'popular_list_widget.dart';
import 'product_list_widget.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key key,
    @required this.foodList,
  }) : super(key: key);

  final List<FoodModel> foodList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 60),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          Expanded(
            child: ListView(
              children: <Widget>[
                //horizontal product list
                ProductListWidget(foodList: foodList),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    "Popular",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ),
                //vertical product list
                PopularListWidget(foodList: foodList),
              ],
            ),
          )
        ],
      ),
    );
  }
}
