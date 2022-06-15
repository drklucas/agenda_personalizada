import 'dart:math';

import 'package:agenda_personalizada/databases/db_firestore.dart';
import 'package:agenda_personalizada/models/contact.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class ContactList with ChangeNotifier {
  List<Contact> _items = []; 
  late FirebaseFirestore db; 
  late AuthService auth; 

  List<Contact> get items => [..._items]; 

  ContactList({required this.auth}) {
    _startList();
  }

  int get itemsCount {
    return _items.length; 
  }

  _startList() async {
    await _startFirestore();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  Future<void> index() async {
    _items.clear(); 
    var contactList = 
      await db 
      .collection('users/${auth.usuario!.uid}/contacts')
      .get();

      for(var contact in contactList.docs) {
        _items.add(
          Contact(
            id: contact['id'], 
            name: contact['name'], 
            urlImage: contact['urlImage'], 
            email: contact['email'], 
            phone: contact['phone'], 
            instaUser: contact['instaUser'], 
            address: contact['address'], 
            birthDate: contact['birthDate'], 
            notes: contact['notes']
            )
        ); 
      }

  }

  Future<void> saveCotact(Map<String, Object> data) async {
    bool hasId = data['id'] != null; 

    final contact = Contact(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(), 
      name: data['name'] as String, 
      urlImage: data['urlImage'] as String, 
      email: data['email'] as String, 
      phone: data['phone'] as String,
      instaUser: data['instaUser'] as String, 
      address: data['address'] as String,
      birthDate: data['birthDate'] as String,
      notes: data['notes'] as List,
      ); 

      if(hasId) {
        return update(contact); 
      } else {
        return store(contact); 
      }
  }

  Future<void> store(Contact contact) async {
    db 
        .collection('users/${auth.usuario!.uid}/contacts')
        .doc(contact.id)
        .set({
          'id': contact.id, 
          'name': contact.name, 
          'urlImage': contact.urlImage, 
          'email': contact.email, 
          'phone': contact.phone, 
          'instaUser': contact.instaUser, 
          'address': contact.address, 
          'birthDate': contact.birthDate, 
        })
        .then((value) => print('Client saved on Firebase'))
        .catchError((error) => print('An error ocurred: $error'));
  
  }

  Future<void> update(Contact contact) async {
    db 
        .collection('users/${auth.usuario!.uid}/contacts')
        .doc(contact.id)
        .set({
           'id': contact.id, 
          'name': contact.name, 
          'urlImage': contact.urlImage, 
          'email': contact.email, 
          'phone': contact.phone, 
          'instaUser': contact.instaUser, 
          'address': contact.address, 
          'birthDate': contact.birthDate, 
        })
        .then((value) => print('Client updated on Firebase!...'))
        .catchError((error) => print('An error ocurred: $error'));
  }

  Future<void> delete(String contactId) async {
    db 
        .collection('users/${auth.usuario!.uid}/contacts')
        .doc(contactId)
        .delete() 
        .then((value) => print('Client excluded...'))
        .catchError((error) => print('An error ocurred: $error')); 
        index(); 
        notifyListeners();
  }


}