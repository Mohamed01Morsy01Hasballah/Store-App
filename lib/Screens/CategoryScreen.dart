import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Bloc/Cubit.dart';
import 'package:store_app/Bloc/States.dart';
import 'package:store_app/Widget/Category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit,StoreStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=StoreCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Category'),

          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: 4,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing:4,
                    childAspectRatio: 1.2
                ) ,
                itemBuilder: (context,index)=>Category(category:cubit.Numcategory[index],id:index)
            ),
          ),
        );
      },

    );
  }
}
