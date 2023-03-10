import 'package:flutter/material.dart';
import 'package:store_app/Bloc/Cubit.dart';

class Carousel extends StatelessWidget {
 final int index;
Carousel({
  required this.index
});
List<String >images=[
  'images/1.jpg',
  'images/2.png',
  'images/3.jpg',

];
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      height: size.height*0.2,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
            colors: [
              Color(0xFF7A60A5),
              Color(0xFF82C3DF),
            ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0,1.0],
          tileMode:TileMode.clamp
        )
          
      ),
      child:Row(
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0xFF9689CE)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    //mainAxisSize: MainAxisSize.max,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Get the special discount',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      SizedBox(
                        height: 18,),
                      Flexible(
                          child:
                          SizedBox(
                            width: double.infinity,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Text(
                                  '50 %\n OFF',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                               ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Image(width:double.infinity,image: AssetImage('${images[index]}'))
              ))
        ],
      ) ,
    );
  }
}
