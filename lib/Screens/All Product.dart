import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Bloc/Cubit.dart';
import 'package:store_app/Bloc/States.dart';

import '../Widget/Product.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit,StoreStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=StoreCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('All Products'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: cubit.products.length,

                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    childAspectRatio: 0.6,

                  ) ,
                  itemBuilder: (context,index)=>Product(product:cubit.products[index] ,)),
            ),
          ),
        );
      },

    );
  }
}
