import 'dart:async';

import 'package:flash/screens/login_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 10), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Colors.purple,
              Colors.blueGrey,
            ],
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    'assets/images/flash_logo.jpg',
                    width: 100,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'FLA',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '⚡',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'H',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Text('Your', style: TextStyle(color: Colors.white)),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child:
                          Text('Smart', style: TextStyle(color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child:
                          Text('World', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// Center(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//         shape: RoundedRectangleBorder(
//           // side: const BorderSide(color: Colors.white70, width: 1),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         shadowColor: Colors.blue,
//         elevation: 20,
//         child: Image.asset('assets/images/splash-logo/flash_logo.jpg',
//             width: MediaQuery.sizeOf(context).width / 2),
//       ))