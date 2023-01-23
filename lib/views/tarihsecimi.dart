import 'package:flutter/material.dart';
import 'package:restoran_app/main.dart';
import 'package:restoran_app/model/user.dart';
import 'package:restoran_app/views/saatSecimi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class tarihsecimi extends StatefulWidget {
  const tarihsecimi({super.key});


  @override
  State<tarihsecimi> createState() => _tarihsecimiState();
}
enum Actions1 { dateregister, update }
 late final Actions1 action2;
class _tarihsecimiState extends State<tarihsecimi> {

  _showDatePicker(context) async{
    var date = await showDatePicker(context: context,
     initialDate: DateTime.now(), 
     firstDate: DateTime(2023), 
     lastDate: DateTime(2024));
     return date;
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(

          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 125, 78, 35),
          ),
          
          
          onPressed: () async{
            var date = await _showDatePicker(context);
            var dateFormatted = DateFormat("dd/MM/yyyy").format(date);
           DateGlobal=dateFormatted;
            var date1=DateModel(
                date: dateFormatted,
                

            );
            
             print(date);
            Navigator.push(context, MaterialPageRoute(builder: (context )=> saatSecimi() ),);
      

      
           await FirebaseFirestore.instance
                        .collection("users")
                        .doc(usernameGlobal)
                        .update(date1.toJson());

                  

         
                
            
                
            
        }, child: Padding(
            padding:  EdgeInsets.all(20.0),
            child: Text("Randevu Tarihinizi Seçiniz",
             style: TextStyle(
              color:Color.fromARGB(255, 242, 240, 238),
              fontSize: 25,
              ),
              ),
          
            )
          )
          
    )
    );
  }
}