import 'package:flutter/material.dart';

import '../components/auth_form.dart';

class AuthScreen extends StatelessWidget {

  const AuthScreen({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                AuthForm()
              ],
            ), 
           ),
       );
  }
}