import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsProduct extends StatelessWidget {
final List<String> images;
final String title;
final String des;
final int price;
DetailsProduct({
  required this.title,
  required this.price,
  required this.images,
  required this.des
});
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Details Product',style: TextStyle(fontSize: 20,color: Colors.black),),
        leading: IconButton(
          icon:Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){Navigator.pop(context);},),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Title',style: TextStyle(fontSize: 25,color:Colors.black),),
                  Text('${title}',style: TextStyle(fontSize: 19,color:Colors.deepOrange)),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Price',style: TextStyle(fontSize: 25,color:Colors.black),),
                  Text('\$${price}',style: TextStyle(fontSize: 19,color:Colors.deepOrange)),
                ],
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                  height: size.height * 0.4,
                  width: double.infinity,
                  child: Swiper(
                    itemCount: 3,
                    itemBuilder: (context,index){
                        return  ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: FancyShimmerImage(
                            width: double.infinity,
                            boxFit: BoxFit.fill,
                            imageUrl: '${images[index]}',
                          ),
                        );

                    },
                    pagination: SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.deepOrange,
                        color: Colors.grey,



                      ),

                    ),
                    control: SwiperControl(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description  ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                    SizedBox(height: 20,),
                    Text(' ${des}',
                      maxLines: 5,overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15,color:Colors.blue),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
