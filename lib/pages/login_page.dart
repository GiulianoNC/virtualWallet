// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:virtual_wallet_app/util/snackbar.dart';


class LoginPage extends StatelessWidget {
  static const String routname ="Login";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
         Text("Virtual wallet"),
         centerTitle: true,
         ),
      backgroundColor: Colors.grey[300], // Fondo gris
      body:
      Center(
        child:
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex:1,
                  child: Image.asset("images/send-money.png",
                  fit: BoxFit.contain,
                  ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                  child:
                  Text("Login",
                  textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Email o Usuario",
                      border: OutlineInputBorder(),
                    ),
                  ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Contraseña",
                      border: OutlineInputBorder()
                    ),
                  ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                  child: buttonLogin(context),
              ),
            ],
          ),
        )
      ),
    );
  }
  ElevatedButton buttonLogin(BuildContext context){
    return ElevatedButton(
        onPressed: ()async{
          showSnackBar(context, "estamos mostrando un mensaje");
        },
        child:
        Text("Iniciar Sesion")
    );
  }
}

