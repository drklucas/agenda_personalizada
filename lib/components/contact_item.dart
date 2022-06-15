import 'package:agenda_personalizada/providers/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/contact.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  const ContactItem(this.contact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(), 
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor, 
        child: const Icon(
          Icons.delete, 
          color: Colors.white, 
          size: 40
        ),
        alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
      ), 
      confirmDismiss: (_) {
        return showDialog<bool>(
          context: context, 
          builder: (ctx) => AlertDialog(
            title: const Text('Você tem certeza?'), 
            content: const Text('Você deseja remover o contato de sua agenda?'),
            actions: [
              TextButton(
                child: const Text('Não'),
                onPressed: () {
                  Navigator.of(ctx).pop(false); 
                },
              ), 
              TextButton(
                child: const Text('Sim'), 
                onPressed: () {
                  Navigator.of(ctx).pop(true); 
                }
              ), 
            ],
          ), 
        ); 
      },
      onDismissed: (_) {
        Provider.of<ContactList>(
          context, 
          listen: false,
        ).delete(contact.id);
      },
      child: GestureDetector(
        onTap: () {

        }, 
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          child: Center(child: Text(contact.name),)
        ), 
      ), 
      ); 
  }
}
