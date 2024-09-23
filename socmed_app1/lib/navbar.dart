import 'package:flutter/material.dart';
import 'package:profile_page/gallery.dart';
import 'package:profile_page/login.dart';
import 'package:profile_page/main.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 200, // Adjust the height as needed
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/jeno_bg.jpg'), // Your background image
                fit: BoxFit.cover,
              ),
            ),

            child: UserAccountsDrawerHeader(
              margin: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors
                    .transparent, // Ensures the background image is visible
              ),
              accountName: const Text(
                'LeeJeno',
                style: TextStyle(
                    color: Colors
                        .white), // Adjust text color for better visibility
              ),
              accountEmail: const Text(
                'jleejeno.0423@naver.com',
                style: TextStyle(
                    color: Colors
                        .white), // Adjust text color for better visibility
              ),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white, // Border color
                    width: 2, // Border width
                  ),
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/jeno_pf.jpg'),
                  radius: 100, // Adjust the radius as needed
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Gallery'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GalleryPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Sign Out'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LogIn()),
              );
            },
          )
        ],
      ),
    );
  }
}
