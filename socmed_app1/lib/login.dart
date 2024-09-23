import 'package:flutter/material.dart';
import 'package:profile_page/main.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final String correctEmail = 'jleejeno.0423@naver.com';
  final String correctPassword = 'onejlee';

  // Stores user input
  String enteredEmail = '';
  String enteredPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Log In", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 100,
                    child: Image.asset('assets/neotech.png'),
                  ),
                  const SizedBox(width: 200, height: 30),
                  Container(
                    height: 340,
                    width: 600,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(221, 28, 34, 55),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                hintStyle: TextStyle(color: Colors.white),
                                labelText: 'Email',
                                hintText: 'Enter email',
                                prefixIcon:
                                    Icon(Icons.email, color: Colors.white),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  enteredEmail = value; // Stores email input
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter email.';
                                } else if (value != correctEmail) {
                                  return 'Incorrect email. Please try again.';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              obscureText: true, // Hides password input
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                hintStyle: TextStyle(color: Colors.white),
                                labelText: 'Password',
                                hintText: 'Enter password.',
                                prefixIcon:
                                    Icon(Icons.password, color: Colors.white),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  enteredPassword =
                                      value; // Stores password input
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password.';
                                } else if (value != correctPassword) {
                                  return 'Incorrect password. Please try again.';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            MaterialButton(
                              onPressed: () {
                                // Validates the form and check inputs
                                if (_formKey.currentState!.validate()) {
                                  // If email and password are correct, navigate to the ProfilePage
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ProfilePage(),
                                    ),
                                  );
                                }
                              },
                              color: Colors.lightBlue,
                              textColor: Colors.white,
                              minWidth: 300,
                              child: const Text('Log In'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
