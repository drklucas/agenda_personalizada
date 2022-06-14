import 'package:flutter/material.dart';

class Contact with ChangeNotifier {

  final String id; 
  final String name; 
  final String urlImage; 
  final String email; 
  final String phone; 
  final String instaUser; 
  final String address; 
  final String birthDate; 
  final List notes; 

  Contact({
    required this.id, 
    required this.name, 
    required this.urlImage, 
    required this.email, 
    required this.phone, 
    required this.instaUser, 
    required this.address, 
    required this.birthDate, 
    required this.notes,
  });
}