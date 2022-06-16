import 'package:agenda_personalizada/components/auth_check.dart';
import 'package:agenda_personalizada/providers/contact_list.dart';
import 'package:agenda_personalizada/screens/contacts_list_screen.dart';
import 'package:agenda_personalizada/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (cotnext) => ContactList(
            auth: context.read<AuthService>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthCheck(),
        routes: const {},
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
