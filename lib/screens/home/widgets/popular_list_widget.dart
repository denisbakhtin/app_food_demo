import 'package:app_food_demo/core/consts.dart';
import 'package:app_food_demo/models/food_model.dart';
import 'package:flutter/material.dart';

class PopularListWidget extends StatelessWidget {
  const PopularListWidget({
    Key key,
    @required this.foodList,
  }) : super(key: key);

  final List<FoodModel> foodList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: foodList.length,
      padding: EdgeInsets.only(left: 40, bottom: 16, top: 20),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          child: Row(
            children: <Widget>[
              Image(
                width: 100,
                image: AssetImage("assets/${foodList[index].imgPath}"),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${foodList[index].name}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Text(
                          "\$${foodList[index].price.toInt()}",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.redColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          "(${foodList[index].weight.toInt()}gm Weight)",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
