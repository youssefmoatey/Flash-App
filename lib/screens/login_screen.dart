import 'package:flash/screens/home_screen.dart';
import 'package:flash/screens/signup_screen.dart';
import 'package:flash/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 30,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.contains("@") == false) {
                        return " Enter valid Email ";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (value) {
                      if (value == null || value.length < 8) {
                        return " Enter valid Password ";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 18.0),
                MyCustomButton(
                  buttonLabel: "Sign in",
                  onTap: () async {
                    bool result = await fireBaseLogin(
                        emailController.text, passwordController.text);
                    if (result == true) {
                      if (_formKey.currentState!.validate()) {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setString('email', emailController.text);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                    email: emailController.text,
                                  )),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Sign in Failed')),
                      );
                    }
                  },
                ),
                const Center(
                  child: Text(
                    "Forgot Password? Tap me.",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 18.0),
                MyCustomButton(
                  buttonLabel: " No account?Sign up",
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> fireBaseLogin(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return false;
  }
}



          /* Padding(
                    padding: const EdgeInsets.all(8.0),
                     child: Container(
                     width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                            ),
                          child: Center(
                              child: Text("No Account?Sign Up",
                              style: TextStyle(color: Colors.black,
                              fontSize: 20),
                              ),
                              ),
                       ),
                 ),*/