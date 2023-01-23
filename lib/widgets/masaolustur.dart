import 'package:flutter/material.dart';
import 'package:restoran_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restoran_app/views/randevularim.dart';
import 'package:restoran_app/model/user.dart';
import 'package:restoran_app/views/saatSecimi.dart';

void main(masa,context) {

MasaOlustur(masa,context); 
  
}

MasaOlustur(masa,context) async{
      
  
 var durum = await FirebaseFirestore.instance
                .collection("users")
                .where("time" ,isEqualTo:TimeGlobal)
                .where("date" ,isEqualTo:DateGlobal)
                .get();

                              Future openDialog() => showDialog(context: context ,
   builder: ( context) => AlertDialog(
    title: Text("Masa Dolu"),
    ));

  var is_user = false;              
  for (final data in durum.docs) {
  //debugPrint('Username=' + data.get('username') + 'Time=' + data.get('time'));
 if(data.get('username') != usernameGlobal) {
  is_user = true;
 }
}
 if(is_user) {
    openDialog();
    Navigator.push(context, MaterialPageRoute(builder: (context )=> saatSecimi() ),); 
  } else {
    Navigator.push(context, MaterialPageRoute(builder: (context )=> randevularim() ),);
  }
                 /* if(durum.docs.isNotEmpty) {

                     

                   openDialog();
                   
                  
                 

                   Navigator.push(context, MaterialPageRoute(builder: (context )=> saatSecimi() ),);  
                   
                  }
                  else{

                      Navigator.push(context, MaterialPageRoute(builder: (context )=> randevularim() ),);

                      
                  }*/
                  
                  

              
             var durum1=  MasaModel(Masa: masa
             
             );
             
             
              await FirebaseFirestore.instance

                .collection('users').doc(usernameGlobal).update(durum1.toJson());
              
              
                
            
}