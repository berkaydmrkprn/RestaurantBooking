
import 'package:restoran_app/views/OySonuc.dart';
import 'package:restoran_app/views/randevularim.dart';
import 'package:restoran_app/views/tarihsecimi.dart';

import 'package:flutter/material.dart';
import 'package:restoran_app/widgets/RatingButton.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Color.fromARGB(255, 20, 78, 103)),
      home:  HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white30,
      
      appBar: AppBar(title: Text("Kardeşler Pide Kebap Restoran"),

      backgroundColor: Color.fromARGB(255, 125, 78, 35),
            centerTitle: true,

      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
              "images/restoranfoto.jpg",
              
              height: 400,
             
          
     ),
          ElevatedButton(
            
            style: ElevatedButton.styleFrom(
              maximumSize: Size(200, 40),
              minimumSize: Size(200, 40),
              backgroundColor: Color.fromARGB(255, 125, 78, 35),
              
            ), 
            
            
            onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context )=> tarihsecimi() ),);
          }, child: Text("Rezervasyon Al"),
          
           ),
           Divider(),
          ElevatedButton(
            
            style: ElevatedButton.styleFrom(
              maximumSize: Size(200, 40),
              minimumSize: Size(200, 40),
              backgroundColor: Color.fromARGB(255, 125, 78, 35),
            ), 
            
            
            onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context )=> randevularim() ),);//adres değişecek
          }, child: Text("Rezervasyonlarım")),

          Divider(),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              maximumSize: Size(200, 40),
              minimumSize: Size(200, 40),
              backgroundColor: Color.fromARGB(255, 125, 78, 35),
            ), 
            
            onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context )=> RatingButton() ),);
          },
          
           child: Text("Restorana Oy ver ")),
      Divider(),
           ElevatedButton(
            style: ElevatedButton.styleFrom(
              maximumSize: Size(200, 40),
              minimumSize: Size(200, 40),
              backgroundColor: Color.fromARGB(255, 125, 78, 35),
            ),
            onPressed: (){

                     Navigator.push(context, MaterialPageRoute(builder: (context )=> OySonuc() ),);
           }, 
           
           child: Text("Restorana verilen oylar"))

          
        

        ],),

      ),
    );

  }
}