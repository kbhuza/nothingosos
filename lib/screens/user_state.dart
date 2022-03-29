import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grotree/screens/home.dart';
import 'package:grotree/screens/register.dart';



class UserState extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, userSnapshot) {
       if(userSnapshot.hasData) {
          print('user is already logged in');
          return HomePage();
        } else if (userSnapshot.hasError) {
  return Scaffold(
  body: Center(
  child: Text("An error has occured , try again later"),
  ),
  );
  }

        else if (userSnapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        else {
         print('user is not logged in');
         return SignUp();
         }
       }
     ),
   );
  }

