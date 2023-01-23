 import 'package:flutter/material.dart';

class Masa  extends StatelessWidget {

    final Widget child;
    final Color color;
    final  VoidCallback onPressed;

    const Masa(

        {super.key,
      required this.child,
      required this.color,
      required this.onPressed}


    );


@override

  Widget build(BuildContext context){

    return SizedBox(

      height:100,
      width: 100,

      child: ElevatedButton(

        
       onPressed: onPressed,
          child: child,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
              padding: MaterialStateProperty.all(EdgeInsets.all(0)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.black)))))
                      
                      
                      ,
                      );




    


  }
    

  }