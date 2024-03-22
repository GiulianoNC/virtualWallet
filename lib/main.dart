// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:virtual_wallet_app/firebase_options.dart';
import 'package:virtual_wallet_app/pages/home_page.dart';
import 'package:virtual_wallet_app/pages/login_page.dart';
import 'package:virtual_wallet_app/pages/register_page.dart';
import 'package:virtual_wallet_app/preferences/pref_usuarios.dart';
import 'package:virtual_wallet_app/pages/form_page.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await PreferenciaUsuario.init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final prefs = PreferenciaUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: prefs.ultimaPagina,
      //home: HomePage(),
      routes:  {
        LoginPage.routname  :(context) =>  LoginPage(),
        "/register":(BuildContext context)=>  RegisterPage(),
        "/home":(BuildContext context)=>const HomePage(),
        "/form":(BuildContext context)=>const FormPage(),


      },
    );
  }
}