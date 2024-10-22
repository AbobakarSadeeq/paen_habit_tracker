import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _initializeHome();
  }

  Future<void> _initializeHome() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('hi how are you'),
          backgroundColor: Colors.red,
        ),
        body: Container(
            color: Colors.black,
            height: double.infinity,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  child: Text(
                    'Hi, how are you? ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  child: Text(
                    'Hi, how are you 2? ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  child: Text(
                    'Hi, how are you 3? ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
