import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SplasScreen extends StatefulWidget {


  @override
  _SplasScreenState createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Center(
            child: CircularProgressIndicator(),
          ))
        ],
      ),
    );
  }
}