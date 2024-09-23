import 'package:flutter/material.dart';
import 'package:profile_page/NavBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profile_page/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(221, 28, 34, 55),
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(221, 28, 34, 55),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      // home: const ProfilePage(),
      home: const LogIn(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "leejen_0_423",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              SizedBox(
                  height: h / 3,
                  width: double.maxFinite,
                  child: Image.asset(
                    'assets/jeno_bg.jpg',
                    fit: BoxFit.cover,
                  )),
              const Positioned(
                  bottom: -50,
                  height: 150,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/jeno_pf.jpg')),
                  ))
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Column(
            children: [
              Text(" Lee Jeno",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(255, 255, 255, 1))),
              Text(" Member of NCT DREAM",
                  style: TextStyle(fontSize: 15, color: Colors.white))
            ],
          ),
          const SizedBox(
            height: 15,
            width: 15,
          ),
          const Divider(color: Colors.white, indent: 30, endIndent: 30),
          const SizedBox(
            height: 15,
            width: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    FontAwesomeIcons.facebook,
                    size: 40,
                  )),
              SizedBox(
                height: 11,
                width: 15,
              ),
              CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    FontAwesomeIcons.instagram,
                    size: 40,
                  )),
              SizedBox(
                height: 11,
                width: 15,
              ),
              CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    FontAwesomeIcons.weibo,
                    size: 40,
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
            width: 15,
          ),
          const Divider(color: Colors.white, indent: 30, endIndent: 30),
          Container(
            padding: const EdgeInsets.all(16.0),
            height: 100,
            child: const Text(" Welcome to my world.",
                style: TextStyle(
                    fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1))),
          )
        ],
      ),
    );
  }
}
