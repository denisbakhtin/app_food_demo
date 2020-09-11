import 'package:app_food_demo/models/food_model.dart';
import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  final FoodModel product;
  const ProductImageWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Image(
            image: AssetImage("assets/bg.png"),
          ),
          Align(
            alignment: Alignment.center,
            child: Hero(
              tag: "image${product.imgPath}",
              child: Image(
                image: AssetImage("assets/${product.imgPath}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
