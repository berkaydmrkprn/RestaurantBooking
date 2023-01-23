import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restoran_app/main.dart';
import 'package:restoran_app/views/homepage.dart';
import 'package:restoran_app/views/register_page.dart';
import 'package:restoran_app/widgets/button.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 125, 78, 35),
        title: const Text("Login Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: TextFormField(
                decoration: InputDecoration(
                    label: Text("Username"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                controller: usernameCtrl,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
                child: Text("Login"),
                color: Color.fromARGB(255, 125, 78, 35),
                onPressed: () async {
                  var response = await FirebaseFirestore.instance
                      .collection("users")
                      .where("username", isEqualTo: usernameCtrl.text)
                      .where("password", isEqualTo: passwordCtrl.text)
                      .limit(1)
                      .get();
                  if (response.docs.isNotEmpty) {
                    usernameGlobal = usernameCtrl.text;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                }),
            button(
                child: Text("Register"),
                color: Color.fromARGB(255, 125, 78, 35),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterPage(
                                usernameCtrl: usernameCtrl,
                                passwordCtrl: passwordCtrl,
                                emailCtrl: TextEditingController(),
                                action: Actions1.register,
                              )));
                }),
                  GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => RegisterPage(
                                usernameCtrl: usernameCtrl , 
                                passwordCtrl: passwordCtrl ,
                                emailCtrl: TextEditingController(),
                                action: Actions1.register,)));
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Hesabınız yok mu ?? Buraya tıkla.",
                    style: TextStyle(fontSize: 15),
                  ),
                ),   
             ),
          ],
        ),
      ),
    );
  }
}
