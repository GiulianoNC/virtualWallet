import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:virtual_wallet_app/preferences/pref_usuarios.dart';
import 'package:virtual_wallet_app/util/snackbar.dart';
import 'package:virtual_wallet_app/utils/auth.dart';

class RegisterPage extends StatelessWidget {
  static const String routeName = "Register";

  RegisterPage({Key? key});

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>(); 
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300], // Fondo gris
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 1,
                  child: 
                  Image.asset(
                    "images/register.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 20.0),
                /*Flexible(
                  child: Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),*/
                SizedBox(height: 20.0),
                Flexible(
                  child: FormBuilderTextField(
                    name: 'email',
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                ),
                SizedBox(height: 20.0),
                Flexible(
                  child: FormBuilderTextField(
                    name: 'password',
                    decoration: InputDecoration(
                      labelText: 'password',
                      border: OutlineInputBorder(),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                    ]),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 20.0),
                Flexible(
                  child: butonRegister(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
ElevatedButton butonRegister(BuildContext context){
  var prefs = PreferenciaUsuario();

  return ElevatedButton(
    onPressed:()async{  
      _formKey.currentState?.save();

      if (_formKey.currentState?.validate() == true) {
        final v = _formKey.currentState?.value;
        var result = await _auth.createAccount(v?["email"], v?["password"]);

        if (result == 1) {
          showSnackBar(context, "La contraseña es demasiado débil");
        } else if (result == 2) {
          showSnackBar(context, "El correo ya está en uso");
        } else if (result != null) {
          Navigator.popAndPushNamed(context, "/home");
          
          //recuperar el uid del usuario de la autenticacion
          prefs.ultimouid = result;  

          //relacion los datos (uid) de autenticacion con el nro de docu del user en base de datos
          FirebaseFirestore.instance.collection("user").doc(result).set(
            {
              "email":v? ["email"],
              "password":v?["password"]
            }
          );

          //instanciamos firestore 
          /*FirebaseFirestore.instance.collection("user").add({
             //y agregamos el email y usuario que se registre en la nube
              "email":v? ["email"],
              "password":v?["password"]
          }*/
          
        }
      }          
    }, 
    child: Text("Register"),
  );
}
}
