import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/Screens/DetailsProduct.dart';
import 'package:store_app/model/ProductModel.dart';

class Product extends StatelessWidget {
  ProductModel? product;
  Product( {
      this.product,

});
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              DetailsProduct(title: product!.title!, price: product!.price!, images: product!.images!, des: product!.description!)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:8,top:5,right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                    text: '\$',
                    style: TextStyle(
                      color: Colors.deepOrange
                    ),
                        children: [
                          TextSpan(
                            text: "${product!.price}",
                            style: TextStyle(
                              color: Colors.amber
                            )
                          )
                        ]
                  ),

                  ),
                  Icon(Icons.favorite,color: Colors.deepOrange,)
                ],
              ),
            ),
            SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: FancyShimmerImage(
                width: double.infinity,
                  height: size.height *0.2,
                  boxFit: BoxFit.fill,
                imageUrl: '${product!.images![0]}',
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${product!.title}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
