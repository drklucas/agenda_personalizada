import 'package:agenda_personalizada/providers/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

import '../models/contact.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  const ContactItem(this.contact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: const Icon(Icons.delete, color: Colors.white, size: 40),
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
                  }),
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
        onTap: () {},
        child: Card(
          color: Color.fromARGB(255, 106, 140, 107),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: SizedBox(
            height: size.height,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://www.auctus.com.br/wp-content/uploads/2017/09/sem-imagem-avatar.png')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                contact.name.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              width: 175,
                              child: Marquee(
                                text:
                                    'Aqui seria o equivalente ao status do contato na sua agenda',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                                fadingEdgeStartFraction: 0.2,
                                fadingEdgeEndFraction: 0.2,
                                blankSpace: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(14), 
                  child: IconButton(
                    icon: const Icon(
                      Icons.edit, 
                      color: Colors.white,
                      ),
                    iconSize: 20,
                    onPressed: () {
                      
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
