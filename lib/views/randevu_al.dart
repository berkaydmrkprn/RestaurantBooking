import 'package:flutter/material.dart';
import 'package:restoran_app/widgets/masabutton.dart';
import 'package:restoran_app/widgets/masaolustur.dart';


class randevu_al extends StatefulWidget {
  const randevu_al({Key? key}) : super(key: key);

  @override
  State<randevu_al> createState() => _randevu_alState();
}

class _randevu_alState extends State<randevu_al> {

  

 
  @override
  Widget build(BuildContext context) {
    

   
MediaQuery.of(context).size.width;
  
double screenWidth = MediaQuery.of(context).size.width;
   return Scaffold(




      backgroundColor: Colors.white38,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 125, 78, 35),

        title: Text("Randevu al"),),

      body:
       Container( 
        
          padding: const EdgeInsets.all(16.0),
          color: Color.fromARGB(255, 247, 224, 216),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          
        child: Row(
          
     crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(width: 30),
          
            Masa(
              
              
              child:Text("Masa1"),
              
             
            color: Color.fromARGB(255, 125, 78, 35),
             onPressed:() async{
              MasaOlustur("masa1",context);
          },),
            
            
           SizedBox(width: 10),


            Masa(child:Text("Masa2"), 
            color: Color.fromARGB(255, 125, 78, 35), 
            onPressed: (){
                 MasaOlustur("masa2",context);
            }),

       SizedBox(width: 10),

            Masa(child:Text("Masa3"), 
            color: Color.fromARGB(255, 125, 78, 35), 
            onPressed: (){
                 MasaOlustur("masa3",context);
            }),
   SizedBox(width: 10),

             Masa(child:Text("Masa4"), 
            color: Color.fromARGB(255, 125, 78, 35), 
            onPressed: (){
                 MasaOlustur("masa4",context);
            }),
            

SizedBox(width: 10),



            Row( 
             
              
              children:<Widget>[
                

              

             Masa(child:Text("Masa5"), 
            
            
            
            color: Color.fromARGB(255, 125, 78, 35), 
            
            
            onPressed: (){

                 MasaOlustur("masa5",context);


            }),
            SizedBox(width: 10),
             Masa(child:Text("Masa6"), 
            
            
            
            color: Color.fromARGB(255, 125, 78, 35), 
            
            
            onPressed: (){

                 MasaOlustur("masa6",context);


            }),

          SizedBox(width: 10),

             Masa(child:Text("Masa7"), 
            
            
            
            color: Color.fromARGB(255, 125, 78, 35), 
            
            
            onPressed: (){

                 MasaOlustur("masa7",context);


            }),

            SizedBox(width: 10),

             Masa(child:Text("Masa8"), 
            
            
            
            color: Color.fromARGB(255, 125, 78, 35), 
            
            
            onPressed: (){

                 MasaOlustur("masa8",context);


            }),

           
            ]



            ),

     ] ),















 ),
       



     
          
        );
  }
}