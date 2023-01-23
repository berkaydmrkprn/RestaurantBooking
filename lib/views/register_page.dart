import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:restoran_app/model/user.dart';
import 'package:restoran_app/widgets/button.dart';
import 'package:flutter/material.dart';

enum Actions1 { register, update }

class RegisterPage extends StatelessWidget {
  const RegisterPage(
      {super.key,
      required this.usernameCtrl,
      required this.passwordCtrl,
      required this.emailCtrl,
      this.username = "",
      this.action = Actions1.register});

  final TextEditingController usernameCtrl;
  final TextEditingController emailCtrl;
  final TextEditingController passwordCtrl;
 
  final Actions1 action;
  final String username;

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      
      appBar: AppBar(
         backgroundColor:Color.fromARGB(255, 125, 78, 35),
        title: Text("Register"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: TextFormField(
              decoration: InputDecoration(
                  label: Text("Username"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              controller: usernameCtrl,
              
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: TextFormField(
              decoration: InputDecoration(
                  label: Text("E-Mail"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              controller: emailCtrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: TextFormField(
              decoration: InputDecoration(
                  label: Text("Password"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              controller: passwordCtrl,
              obscureText: true,
            ),
          ),
          
          button(
              child: Text("Register"),
              color:Color.fromARGB(255, 125, 78, 35),
              
              onPressed: () async {
                
                var user = UserModel(
                    username: usernameCtrl.text,
                    
                    email: emailCtrl.text,
                    password: passwordCtrl.text);
                if (action == Actions1.register) {
                      
                             
                  await FirebaseFirestore.instance
                   .collection("users")
                      .doc(user.username)
                      .set(user.toJson());
                     
                } else {
                  var response = await FirebaseFirestore.instance
                      .collection("users")
                      .where("username", isEqualTo: username)
                      .limit(1)
                      .get();                      
                  if (response.docs.isNotEmpty) {
                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(response.docs.first.id)
                        .set(user.toJson());
                  }
                }
                Navigator.pop(context);
              })
        ]),
      ),
    );
  }
}
