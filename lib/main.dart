import 'package:firebase_core/firebase_core.dart';
import 'package:restoran_app/firebase_options.dart';
import 'package:restoran_app/services/auth.dart';
import 'package:restoran_app/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

var usernameGlobal = "";
var TimeGlobal="";
var DateGlobal="";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<Auth>(
      create: (context) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: LoginPage(),
      ),
    );
  }
}
