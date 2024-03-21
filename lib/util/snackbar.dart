import 'package:flutter/material.dart';

//sirve para mostrar un mensaje en el scaffold
void showSnackBar(BuildContext context, String mensaje){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text("mensajes"),
          duration: Duration(seconds: 800),
      )
  );
}