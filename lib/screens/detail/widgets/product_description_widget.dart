import 'package:app_food_demo/core/consts.dart';
import 'package:app_food_demo/models/food_model.dart';
import 'package:flutter/material.dart';

class ProductDescriptionWidget extends StatefulWidget {
  final FoodModel product;

  const ProductDescriptionWidget(this.product);
  @override
  _ProductDescriptionWidgetState createState() =>
      _ProductDescriptionWidgetState();
}

class _ProductDescriptionWidgetState extends State<ProductDescriptionWidget> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "${widget.product.name}",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: <Widget>[
                Text(
                  "\$${widget.product.price.toInt()}",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.redColor,
                  ),
                ),
                SizedBox(width: 30),
                _buildCounter(),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildInfo("Weight", "${widget.product.weight.toInt()}gm"),
                _buildInfo("Calories", "${widget.product.calory.toInt()}ccal"),
                _buildInfo("Protein", "${widget.product.protein.toInt()}gm"),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Items",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text("${widget.product.item}"),
            Expanded(child: SizedBox()),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(vertical: 16),
                    color: AppColors.greenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(String title, String val) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "$val",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.redColor,
          ),
        ),
      ],
    );
  }

  Widget _buildCounter() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.remove,
              color: Colors.black,
            ),
            onPressed: () => setState(() {
              if (count > 1) count--;
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              count.toString(),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () => setState(() => count++),
          ),
        ],
      ),
    );
  }
}
