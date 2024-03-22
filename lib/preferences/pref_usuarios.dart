import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciaUsuario{
//generar instancia

static late SharedPreferences _prefs;

static Future init() async{
   _prefs = await SharedPreferences.getInstance();
}

String get ultimaPagina{
  //retorna la ultima pagina, sino login
  return _prefs.getString("ultimaPagina") ??"Login";
}

set ultimaPagina(String value){
  _prefs.setString("ultimaPagina", value);
}

String get ultimouid{
  //retorna la ultima pagina, sino login
  return _prefs.getString("ultimouid") ??"";
}

set ultimouid(String value){
  _prefs.setString("ultimouid", value);
}


}
