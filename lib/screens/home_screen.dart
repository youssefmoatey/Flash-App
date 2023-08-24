import 'package:flash/screens/aboat_screen.dart';
import 'package:flash/screens/logout_screen.dart';
import 'package:flash/screens/develop_names.dart';
import 'package:flash/screens/page1_main.dart';
import 'package:flash/screens/page2_categorys.dart';
import 'package:flash/screens/page3_user_profile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String email;
  const HomeScreen({super.key, required this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> pages = [
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 30,
        title: const Text(''),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.pending),
              title: const Text('About Us'),
              onTap: () {
                // Handle drawer item tap
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutUs()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.people_sharp),
              title: const Text('Developers names'),
              onTap: () {
                // Handle drawer item tap
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DevelopersNames()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text('Log out'),
              onTap: () {
                // Handle drawer item tap
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LogoutScreen()));
              },
            )
          ],
        ),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: " Home",
              backgroundColor: Colors.blueAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: " Categories",
              backgroundColor: Colors.blueAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: " My Profile",
              backgroundColor: Colors.blueAccent),
        ],
        onTap: (value) {
          currentIndex = value;
          setState(() {});
          print(value);
        },
      ),
    );
  }
}
