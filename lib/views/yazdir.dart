import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restoran_app/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:restoran_app/model/user.dart';
import 'package:restoran_app/main.dart';





class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .where("time" ,isEqualTo:TimeGlobal)
                .snapshots(includeMetadataChanges: true),
            builder: ((context, snapshot) => snapshot.hasError
                ? Text("Error")
                : snapshot.connectionState == ConnectionState.waiting
                    ? CircularProgressIndicator()
                    : ListView(
                        children: snapshot.data!.docs.map((document) {
                          var data = UserModel.fromJson(document.data());
                          return ListTile(
                            title: Text("Username: ${data.username}"),
                            subtitle: Text("E-Mail: ${data.email}"),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                        child: SingleChildScrollView(
                                            child: Column(
                                          children: [
                                            ListTile(
                                                title: Text("Update"),
                                                onTap: () async {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder:
                                                              (context) =>
                                                                  RegisterPage(
                                                                    usernameCtrl:
                                                                        TextEditingController(
                                                                            text:
                                                                                data.username),
                                                                    passwordCtrl:
                                                                        TextEditingController(
                                                                            text:
                                                                                data.password),
                                                                    emailCtrl: TextEditingController(
                                                                        text: data
                                                                            .email),
                                                                    action: Actions1
                                                                        .update,
                                                                    username: data
                                                                        .username,
                                                                  )));
                                                }),
                                            ListTile(
                                              title: Text("Delete"),
                                              onTap: () async {
                                                Navigator.pop(context);
                                                await FirebaseFirestore.instance
                                                    .collection("users")
                                                    .doc(document.id)
                                                    .delete();
                                              },
                                            )
                                          ],
                                        )),
                                      ));
                            },
                          );
                        }).toList(),
                      )),
          ),
        ));
  }
}
