import 'package:app_food_demo/core/consts.dart';
import 'package:app_food_demo/models/food_model.dart';
import 'package:app_food_demo/screens/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductListWidget extends StatefulWidget {
  final List<FoodModel> foodList;

  const ProductListWidget({this.foodList});
  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  PageController pageController = PageController(viewportFraction: .8);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: widget.foodList.length,
        controller: pageController,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => DetailPage(widget.foodList[index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Stack(
                children: <Widget>[
                  _buildCardBackGround(index),
                  _buildCardImage(index),
                  _buildCardPrice(index),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Positioned _buildCardPrice(int index) {
    return Positioned(
      bottom: 0,
      right: 30,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.redColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Text(
          "\$${widget.foodList[index].price.toInt()}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Align _buildCardImage(int index) {
    return Align(
      alignment: Alignment.topRight,
      child: Transform.rotate(
        angle: math.pi / 3,
        child: Hero(
          tag: "image${widget.foodList[index].imgPath}",
          child: Image(
            width: 180,
            image: AssetImage("assets/${widget.foodList[index].imgPath}"),
          ),
        ),
      ),
    );
  }

  Container _buildCardBackGround(int index) {
    return Container(
      margin: EdgeInsets.only(
        top: 50,
        bottom: 20,
        right: 50,
      ),
      padding: EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              RatingBar(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 12,
                unratedColor: Colors.black12,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(width: 5),
              Text(
                "(120 Reviews)",
                style: TextStyle(
                  fontSize: 11,
                ),
              ),
            ],
          ),
          Text(
            "${widget.foodList[index].name}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
