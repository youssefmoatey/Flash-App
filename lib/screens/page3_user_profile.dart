import 'package:flash/screens/logout_screen.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('profile'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: ClipOval(
                  child: Image.asset(
                'assets/images/flash_logo.jpg',
                width: 100,
              )),
            ),
            const SizedBox(height: 20),
            const Text('Youssef Moatey'),
            const Text('Youssef@gmail.com'),
            const SizedBox(height: 40),
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: const Card(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Manage Profile'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: const Card(
                    child: ListTile(
                      leading: Icon(Icons.local_grocery_store_rounded),
                      title: Text('My added products'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: const Card(
                    child: ListTile(
                      leading: Icon(Icons.attach_money),
                      title: Text('Payment Methods'),
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogoutScreen()));
                  },
                  child: Card(
                    elevation: 20,
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      height: 50,
                      width: MediaQuery.sizeOf(context).width / 2,
                      color: const Color(0xFF393486),
                      child: const Center(
                        child: Text(
                          'Logout',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
