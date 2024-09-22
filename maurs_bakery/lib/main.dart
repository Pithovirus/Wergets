import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0; // Track the index of the selected tab

  // Screens corresponding to each BottomNavigationBar item
  static final List<Widget> _pages = <Widget>[
    HomeScreen(),
    const Text('Orders Page', style: TextStyle(fontSize: 25, color: Colors.black)),
    const Text('Profile Page', style: TextStyle(fontSize: 25, color: Colors.black)),
  ];

  // Function to handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Maur's Bakery",
            style: TextStyle(
              color: const Color.fromARGB(200, 206, 83, 7),
              fontSize: 16,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 245, 245, 245),
          centerTitle: true,

          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color:  const Color.fromARGB(200, 206, 83, 7),
              height: 0.5,
            ),
            ),

        ),

        // Body changes based on the selected tab
        body: _pages[_selectedIndex],

        // Adding the BottomNavigationBar
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex, // Set the selected tab
          selectedItemColor: const Color.fromARGB(200, 206, 83, 7), // Highlight color for selected item
          onTap: _onItemTapped, // Handle tab selection
        ),
      ),
    );
  }
}

// Home screen page with menu images
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> menuImages = [
      {
        "Menu": "Brownies",
        "url":
            "https://plus.unsplash.com/premium_photo-1700400016408-11e7259fc9b6?q=80&w=1288&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      },
      {
        "Menu": "Cookies",
        "url":
            "https://plus.unsplash.com/premium_photo-1670895801135-858a7d167ea4?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      },
      {
        "Menu": "Cakes",
        "url":
            "https://images.unsplash.com/photo-1505976378723-9726b54e9bb9?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      },
      {
        "Menu": "Cupcakes",
        "url":
            "https://images.unsplash.com/photo-1603532648955-039310d9ed75?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      }
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.all(15),
        color: const Color.fromARGB(255, 245, 245, 245),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              "Your Baked Goods at an \nAffordable Price!",
              style: TextStyle(
                color: Color.fromARGB(200, 206, 83, 7),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              height: 270,
              width: 500,
              child: SizedBox(
                child: Image.network(
                    "https://images.unsplash.com/photo-1610881101036-55a769706cc7?q=80&w=1632&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Our Best Sellers",
              style: TextStyle(
                color: Color.fromARGB(200, 206, 83, 7),
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 200, // Set the height of the ListView
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: menuImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(menuImages[index]['url']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          menuImages[index]['Menu']!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(200, 206, 83, 7),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
