import 'package:flutter/material.dart';
import 'package:restoran_app/main.dart';
import 'package:restoran_app/views/randevu_al.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restoran_app/model/user.dart';





class saatSecimi extends StatefulWidget {
  const saatSecimi({super.key});

  @override
  State<saatSecimi> createState() => _saatSecimiState();
  
}

class _saatSecimiState extends State<saatSecimi> {
 TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);
 
   _showTimePicker(context) async{
    var time= await showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now()
      
      ).then((value) {
        setState(() {
          _timeOfDay = value!;
        });
      });
      
  }
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         Text(_timeOfDay.format(context).toString(),
          style: TextStyle(fontSize: 50),), 

          ElevatedButton(
            style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 125, 78, 35),
          ),
            
            
            onPressed: () async{
            var time = await _showTimePicker(context);

           

            
            
            var time1=TimeModel(time: _timeOfDay.format(context).toString(),);

 TimeGlobal=_timeOfDay.format(context).toString();

             
             



            print(time);
            Navigator.push(context, MaterialPageRoute(builder: (context )=> randevu_al() ),);


               await FirebaseFirestore.instance
                        .collection("users")
                        
                        .doc(usernameGlobal)
                        .update(time1.toJson());
            
           
          } ,
           child: Padding(
            padding:  EdgeInsets.all(20.0),
            child: Text("Randevu Saatinizi Seçiniz",
             style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              ),
              ),
            
            )
          ),
        ],
      )
      ),
    );
  }
}