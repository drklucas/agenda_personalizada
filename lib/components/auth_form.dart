import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {

  const AuthForm({ Key? key }) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

  final fPassKey = GlobalKey<FormState>(); 
  final fEmailKey = GlobalKey<FormState>();
  final email = TextEditingController(); 
  final password = TextEditingController(); 

  bool isLogin = true; 
  late String title; 
  late String actionButton; 
  late String toggleButton; 
  bool loading = false; 
  bool isObscure = true;

  final FirebaseAuth _auth = FirebaseAuth.instance;

   @override
   Widget build(BuildContext context) {
       return Container();
  }
}