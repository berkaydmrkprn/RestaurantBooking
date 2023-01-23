import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restoran_app/views/homepage.dart';
import 'package:restoran_app/main.dart';
import 'package:restoran_app/model/user.dart';


class randevularim extends StatelessWidget {
   randevularim({Key? key}) : super(key: key);

  final _firestore =FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      appBar:AppBar(
        
        backgroundColor: Color.fromARGB(255, 125, 78, 35),
        title:Text(
       
        "Rezervasyonlarım"),
        actions: <Widget>[
          new IconButton(
            
            onPressed:(){  Navigator.push(context, MaterialPageRoute(builder: (context )=> HomePage() ),);
            
            
            }, icon: Text("X")),
        ],
        centerTitle: true,
        ),

      body: Center(
        
       child: StreamBuilder<QuerySnapshot>(

  
            stream: FirebaseFirestore.instance
                .collection("users").where("username",isEqualTo: usernameGlobal)
                .snapshots(includeMetadataChanges: true),
            builder: ((context, snapshot) => snapshot.hasError
                ? Text("Error")
                : snapshot.connectionState == ConnectionState.waiting
                    ? CircularProgressIndicator()
                    
                    : ListView(
                      
                      
                        children: snapshot.data!.docs.map((document) {
                              //Eklemek için
                              //DateFormat("dd/MM/yyyyTHH:mm:ss").parse(gelenStringTarih);
                          var data1 = DateModel.fromJson(document.data());
                          var data2 =TimeModel.fromJson(document.data());
                          var data3=MasaModel.fromJson(document.data());
                          return ListTile(
                            
                            title: Text( 
                              textAlign:TextAlign.center,
                              style: TextStyle(
                                
          color: Color.fromARGB(255, 125, 78, 35),
          fontSize: 25
        ),

                              "Randevu Tarihi: ${data1.date} "
                            "  Randevu Saati: ${data2.time} "+"  Masa: ${data3.Masa}"),

                          );

                        }).toList(),

                        
                      )
                      
                      
                      ),),
                      
                     

          ), 
          


        );
  }
}
  
