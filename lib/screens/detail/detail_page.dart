import '../../core/consts.dart';
import '../../models/food_model.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_app_bar.dart';
import 'widgets/product_description_widget.dart';
import 'widgets/product_image_widget.dart';

class DetailPage extends StatelessWidget {
  final FoodModel product;
  DetailPage(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: 25),
          CustomAppBar(context),
          ProductImageWidget(product),
          ProductDescriptionWidget(product),
        ],
      ),
    );
  }
}
