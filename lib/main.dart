import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'lazy_loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => MyList(),
      // },
      home: const LazyLoading(),
    );
  }
}

// Sharepreferenced get and set data
class Sharepreferenced extends StatefulWidget {
  const Sharepreferenced({Key? key}) : super(key: key);

  @override
  _SharepreferencedState createState() => _SharepreferencedState();
}

class _SharepreferencedState extends State<Sharepreferenced> {
  String? firstName;

  @override
  void initState() {
    getPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$firstName"),
            TextButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  setState(() {
                    firstName = "Mohit";
                  });
                  prefs.setString("firstName", firstName!);
                },
                child: const Text("Data change"))
          ],
        ),
      ),
    );
  }

  void getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString("firstName");
    });
  }
}
