import 'package:flutter/material.dart';
import 'package:profile_page/NavBar.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPage();
}

class _GalleryPage extends State<GalleryPage> {
  List imageList = [
    'img_1.jpg',
    'img_2.jpg',
    'img_3.jpg',
    'img_4.jpg',
    'img_5.jpg',
    'img_6.jpg',
    'img_7.jpg',
    'img_8.jpg',
    'img_9.jpg',
    'img_10.jpg',
    'img_11.jpg',
    'img_12.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "leejen_0_425",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                (MediaQuery.of(context).orientation == Orientation.portrait)
                    ? 3
                    : 4,
            childAspectRatio: 1.0,
          ),
          shrinkWrap: true,
          itemCount: imageList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageDetailPage(
                      imagePath: 'assets/${imageList[index]}',
                      imageName: imageList[index],
                    ),
                  ),
                );
              },
              child: Card(
                color: Colors.white70,
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(
                    color: Colors.white70,
                    width: 0.5,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/${imageList[index]}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Create a new screen to show the image details
class ImageDetailPage extends StatelessWidget {
  final String imagePath;
  final String imageName;

  const ImageDetailPage(
      {super.key, required this.imagePath, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(imageName, style: const TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
