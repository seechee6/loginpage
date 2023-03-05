
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  Future login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      const alert = AlertDialog(
        title: Text("Error sign in"),
        content: Text("Wrong username or password"),
      );
      return showDialog(context: context, builder: (context) => alert);
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('LOGIN TO YOUR APP',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
        const SizedBox(height: 30),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Colors.lightGreen, Colors.greenAccent]),
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Email:'),
            TextField(
              decoration: const InputDecoration(prefixIcon: Icon(Icons.person)),
              controller: _emailcontroller,
            ),
            const SizedBox(height: 12),
            const Text('Password: '),
            TextField(
                obscureText: true,
                controller: _passwordcontroller,
                decoration:
                    const InputDecoration(prefixIcon: Icon(Icons.password))),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: login, child: const Text('Login')),
          ]),
        ),
      ]),
    );
  }
}

          
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          
