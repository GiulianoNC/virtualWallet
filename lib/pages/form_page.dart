import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: FormBuilder(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:  CrossAxisAlignment.stretch,
            children: [
              Expanded(
                 child: Image.asset(
                    "images/register.png",
                   // fit: BoxFit.contain,
                  ),
                )
            ],
          ),
        ),
      ),
    );


  }
}