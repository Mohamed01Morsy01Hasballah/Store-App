import 'package:card_swiper/card_swiper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Bloc/Cubit.dart';
import 'package:store_app/Bloc/States.dart';
import 'package:store_app/Screens/All%20Product.dart';
import 'package:store_app/Screens/CategoryScreen.dart';
import 'package:store_app/Widget/Carousel.dart';
import 'package:store_app/Widget/Product.dart';

class HomeScreen  extends StatelessWidget {
  var text=TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocConsumer<StoreCubit,StoreStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=StoreCubit.get(context);
       return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            leading: IconButton(
              icon: Icon(
                  Icons.category_outlined
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen()));
              },
            ) ,
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.supervised_user_circle_sharp),)
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  SizedBox(
                    height: size.height*0.08,
                    child: TextFormField
                      (
                        controller: text,
                        decoration: InputDecoration(
                            labelText: 'Search',
                            hintText: 'Search',
                            border: OutlineInputBorder(),
                            suffix: IconButton(onPressed: (){}, icon: Icon(Icons.search),padding: EdgeInsets.zero)
                        )
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: size.height*0.25,
                    child: Swiper(
                      itemCount: 3,
                      itemBuilder: (context,index)=>Carousel(index: index,),
                      pagination: SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        builder: DotSwiperPaginationBuilder(
                          activeColor: Colors.deepOrange,
                          color: Colors.white,



                        ),

                      ),
                      control: SwiperControl(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text('All Products',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Spacer(),
                        IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AllProduct()));
                        }, icon: Icon(Icons.arrow_forward_ios_outlined),color: Colors.deepOrange,iconSize: 25,)
                      ],
                    ),
                  ),
                  ConditionalBuilder(condition:state is! GetProductLoadingState,
                      builder: (context)=> Container(
                        color:Colors.grey[300],
                        child: Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: cubit.products.length ,

                              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 3,
                                mainAxisSpacing: 3,
                                childAspectRatio: 0.6,

                              ) ,
                              itemBuilder: (context,index)=>Product(product: cubit.products[index])),
                        ),
                      )
                      ,
                      fallback: (context)=>Center(child: CircularProgressIndicator(),)
                  )


                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
