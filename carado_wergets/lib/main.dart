import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const CaradoWergets());
}

class CaradoWergets extends StatefulWidget {
  const CaradoWergets({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CaradoWergetsState createState() => _CaradoWergetsState();
}

class _CaradoWergetsState extends State<CaradoWergets> {
  // Function to open the provided link
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(
          child: Container(
        alignment: Alignment.center,
        //color:const Color.fromARGB(106, 182, 182, 182), // Uncomment to see guide
        width: double.infinity,
        margin: const EdgeInsets.only(top: 120),
        child: Column(
          children: [
            // SPEED Image
            GestureDetector(
              onTap: () => _launchUrl('https://youtu.be/wYZux3BMc5k'),
              child: ClipOval(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'assets/speed.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Text

            GestureDetector(
              onTap: () => _launchUrl('https://www.youtube.com/@IShowSpeed'),
              child: const Text('IShowSpeed',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),

            GestureDetector(
              onTap: () => _launchUrl('https://youtu.be/wYZux3BMc5k'),
              child: const Text('Shake [Official Music Video]',
                  style: TextStyle(fontSize: 20)),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 125,
                    height: 35,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(158, 73, 73, 73),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Text('5M Likes',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    )),
                const SizedBox(width: 20),
                Container(
                  width: 125,
                  height: 35,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(158, 73, 73, 73),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text('249k Dislikes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    ));
  }
}
