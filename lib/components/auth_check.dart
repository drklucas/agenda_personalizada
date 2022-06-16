import 'package:agenda_personalizada/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/auth_screen.dart';
import '../screens/contacts_list_screen.dart';
import '../services/auth_service.dart';

class AuthCheck extends StatefulWidget {

  const AuthCheck({ Key? key }) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {

   @override
   Widget build(BuildContext context) {
     AuthService auth = Provider.of<AuthService>(context);

     if(auth.isLoading) {
       return loading();
     } else if (auth.usuario == null) {
       return const AuthScreen();
     } else {
       return const HomeScreen();
     }
   }
      loading() {
        return const Scaffold(
           body: Center(
             child: CircularProgressIndicator(),
           ),
       );
      }
       
  }
