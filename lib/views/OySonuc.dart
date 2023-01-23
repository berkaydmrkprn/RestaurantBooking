import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:restoran_app/model/user.dart';


class OySonuc extends StatelessWidget {
   OySonuc({Key? key}) : super(key: key);

  final _firestore =FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      appBar:AppBar(
        backgroundColor: Color.fromARGB(255, 125, 78, 35),
        title:Text(
       
        "Restorana verilen oylar"),
        centerTitle: true,
        ),

      body: Center(
       child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Oy")
                .snapshots(includeMetadataChanges: true),
            builder: ((context, snapshot) => snapshot.hasError
                ? Text("Error")
                : snapshot.connectionState == ConnectionState.waiting
                    ? CircularProgressIndicator()
                    : ListView(
                        children: snapshot.data!.docs.map((document) {
                              //Eklemek için
                              //DateFormat("dd/MM/yyyyTHH:mm:ss").parse(gelenStringTarih);
                          var data1 = RateModel.fromJson(document.data());
                       
                          
                          return ListTile(
                            title: Text( 
                              textAlign:TextAlign.center,
                              style: TextStyle(
                                
          color: Color.fromARGB(255, 125, 78, 35),
          fontSize: 25
        ),

                              "OY: ${data1.rate} "
                            

                           ) );

                        }).toList(),
                      )),),

          ),  

        );
  }
}
  
