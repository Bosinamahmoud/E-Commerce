import 'package:firebase_auth/firebase_auth.dart';
class FirebaseHelper{
  FirebaseAuth auth=FirebaseAuth.instance;
  Future<dynamic> signUp(String email,String password,String name)async{
    try{
 UserCredential user=await auth.createUserWithEmailAndPassword(email: email, password: password);
  await auth.currentUser!.updateDisplayName(name);
  await auth.currentUser!.reload();
  return user.user;
    }
   on FirebaseAuthException catch(e){
      return e.code;
    }
  }

  Future<dynamic>signIn(String email,String password)async{
    try{
      UserCredential user=await auth.signInWithEmailAndPassword(email: email, password: password);
      return user.user;

    }
    on FirebaseAuthException catch(e){
      return e.code;
    }
  }

  void signOut()async{
    await auth.signOut();
  }
}