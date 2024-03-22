// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:virtual_wallet_app/util/snackbar.dart';
import 'package:virtual_wallet_app/utils/auth.dart';


class LoginPage extends StatelessWidget {
  static const String routname ="Login";
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>(); 
  final AuthService _auth = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

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
          child: FormBuilder(
              key: _formKey,
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
                    Text("Sign in",
                    textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                ),
                SizedBox(height: 20.0),
                FormBuilder(
                  child: Column(  
                    children: [
                      FormBuilderTextField(
                        name: "email",
                        controller: _emailController,
                        decoration: InputDecoration(
                        labelText: "Email o Usuario",
                        border: OutlineInputBorder(),
                      ),
                        validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                      ),
                      SizedBox(height: 20.0),
                        FormBuilderTextField(
                        name: "password",
                        controller: _passwordController,
                        decoration: InputDecoration(
                        labelText: "Contraseña",
                        border: OutlineInputBorder(),
                      ),
                        validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength( 6),
                      ]),
                      obscureText: true,
                  )],
                ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                    child: buttonLogin(context),
                ),
                SizedBox(height: 20.0), // Espacio entre el botón y el texto
                Expanded(child:TextButton(
                  onPressed:(){
            
                     Navigator.pushNamed(context, "/register");
             
                  } ,
                  child: Text("Register",
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),                
                  ),
                  )
                )  
              ],
            ),
          ),
        )
      ),
    );
  }
  ElevatedButton buttonLogin(BuildContext context){
    return ElevatedButton(
        onPressed: ()async{
          //showSnackBar(context, "estamos mostrando un mensaje");
            _formKey.currentState?.save();
            

            if (_formKey.currentState?.validate() == true) {
            //final v = _formKey.currentState?.value;
            var result = await _auth.signInEmailAndPassword(_emailController.text, _passwordController.text);

            if (result == 1) {
              showSnackBar(context, "Usuario o contraseña erroneas");
            } else if (result == 2) {
              showSnackBar(context, "Usuario o contraseña erroneas");
            } else if (result != null) {
              Navigator.popAndPushNamed(context, "/home");
              

              }
            }
          

        },
        child:
        Text("Sign in")
    );
  }
}

