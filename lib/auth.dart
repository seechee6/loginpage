import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

import 'login.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream:FirebaseAuth.instance.authStateChanges(),
      builder: ((context,snapshot){
        if(snapshot.hasData){
          return const MyWidget();
        } else{
          return const MyHomePage(
          title:'My Login Page'
        );
        
      }
  })));
  }
}