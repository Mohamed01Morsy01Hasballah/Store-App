import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/ProductModel.dart';

class Category extends StatelessWidget {
  CategoryModel? category;
  int?id;
   Category(
  {
    this.id,
    required this.category
}
       );

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: FancyShimmerImage(
                width: double.infinity,
                height: size.height *0.2,
                boxFit: BoxFit.fill,
              imageUrl: '${category!.image}',
            ),
          ),
        ),
          Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.black26.withOpacity(0.2)
            ),
            child: Text(
              '${category!.name}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20,color:Colors.white,fontWeight: FontWeight.bold),
            ),
          ),
        )

      ],
    );
  }
}
