import 'package:ToDo_flutter/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:provider/provider.dart';

import 'Provider/ListProvider.dart';
import 'Screen/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoModel>(
          create: (context) => TodoModel(),
        ),

      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.blue,
            ),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return LoginPage();
            }
            return LoginPage();
          },
        ),
      ),
    );
  }
}
