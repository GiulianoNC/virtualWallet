import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future createAccount(String email, String password)async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password); 
    print(userCredential.user);
    //este id me sirve para averiguar si el usuario sigue en sesion
    return (userCredential.user?.uid);
    }on FirebaseAuthException catch(e){
      //para ver si la contrasenia es debil
      if(e.code == "weak-password"){
        print("the password provided is too weak");
        return 1;
        //si el mail ya esta en uso
      }else if(e.code == "email-already-in-use"){
        print("The account already exists for this user");
        return 2;
      }
    }catch(e){
      print(e);
    }
  } 

  Future signInEmailAndPassword(String email, String password)async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      final a = userCredential.user;
      if(a?.uid != null){
        return a?.uid;
      }
    }on FirebaseAuthException catch (e){

      if(e.code == "user-not-found"){
        return 1;
      }else if (e.code =="wrong-password"){
        return 2;
      }
    }
  }

}