import 'package:agenda_personalizada/components/favoriteContacts_item.dart';
import 'package:agenda_personalizada/data/dummy_contacts.dart';
import 'package:flutter/material.dart';

class FavoriteContactList extends StatelessWidget {
  const FavoriteContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loadedFavoriteContacts = dummyContacts;

    return Container(
      height: size.height * 0.275,
      width: size.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: loadedFavoriteContacts.length,
                itemBuilder: (ctx, i) {
                  return Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FavoriteContactsItem(loadedFavoriteContacts[i]),
                  ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
