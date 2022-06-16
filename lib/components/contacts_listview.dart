import 'package:agenda_personalizada/models/contact.dart';
import 'package:agenda_personalizada/providers/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/dummy_contacts.dart';
import 'contact_item.dart';

class ContactsListview extends StatelessWidget {

  const ContactsListview({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final provider = Provider.of<ContactList>(context);
    final List<Contact> loadedContacts = dummyContacts;

       return  Padding(
            padding: const EdgeInsets.all(6.3),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: loadedContacts.length,
                      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                        value: loadedContacts[i], 
                        child: Container(
                         // padding: const EdgeInsets.symmetric(horizontal: 15), 
                          height: size.height * 0.125, 
                          child: ContactItem(loadedContacts[i]),
                        ),
                        ), 
                      ),
                  ),
              ],
            ),
       );
  }
}