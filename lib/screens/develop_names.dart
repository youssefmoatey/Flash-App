import 'package:flutter/material.dart';

class DevelopersNames extends StatefulWidget {
  const DevelopersNames({super.key});

  @override
  State<DevelopersNames> createState() => _DevelopersNamesState();
}

class _DevelopersNamesState extends State<DevelopersNames> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor :Colors.blue ,
        title: Text("Developers names "),
      ),
    );

  }
}