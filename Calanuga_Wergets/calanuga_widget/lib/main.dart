import 'package:flutter/material.dart';

void main() {
  runApp(const LibraryApp());
}

class LibraryApp extends StatelessWidget {
  const LibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    BookListPage(),
    BestsellerPage(),
    OfflineBooksPage(),
    PurchasedBooksPage(),
    PopularBooksPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
      ),
      drawer: MyDrawer(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.pop(context);
        },
      ),

      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Best Sellers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_download),
            label: 'Offline Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Purchased Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Popular Books',
          ),
        ],

        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black, 
        unselectedItemColor:Colors.brown, 
      ),
    );
  }
}

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 190,
            child: ClipRRect(
              child: Image.asset(
                'assets/lib.png', 
                fit: BoxFit.cover, 
                width: double.infinity, 
              ),
            ),
          ),
          
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'My Books',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BookWidget(
                  bookTitle: 'The Bone Maker',
                  bookAuthor: 'Sarah Beth Durst',
                  bookCoverImage: 'assets/book 1.jpg',
                ),
                BookWidget(
                  bookTitle: 'The Witchmakers Wife',
                  bookAuthor: 'Kristin Harmel',
                  bookCoverImage: 'assets/book2.jfif',
                ),
                BookWidget(
                  bookTitle: 'Creation Lake',
                  bookAuthor: 'Rachel Kushner',
                  bookCoverImage: 'assets/book3.jpg',
                ),
                BookWidget(
                  bookTitle: 'Her Last Wish',
                  bookAuthor: 'Ajay K. Pandey',
                  bookCoverImage: 'assets/book4.webp',
                ),BookWidget(
                  bookTitle: 'Babel: an Arcane History',
                  bookAuthor: 'R.F. Kuang',
                  bookCoverImage: 'assets/book5.jfif',
                ),BookWidget(
                  bookTitle: 'Echoes of Sorrows',
                  bookAuthor: 'Raveena Ravi',
                  bookCoverImage: 'assets/book6.jpg',
                ),BookWidget(
                  bookTitle: 'It Ends with Us',
                  bookAuthor: 'Colleen Hoover',
                  bookCoverImage: 'assets/book7.jpg',
                ),BookWidget(
                  bookTitle: 'Harry Potter & Deadly Hallows',
                  bookAuthor: 'J.K Rowling',
                  bookCoverImage: 'assets/book8.jpeg',
                ),BookWidget(
                  bookTitle: 'The Women',
                  bookAuthor: 'Kristin Hannah',
                  bookCoverImage: 'assets/book9.jpg',
                ),BookWidget(
                  bookTitle: 'The Hobbit',
                  bookAuthor: 'J.R.R Tolkien',
                  bookCoverImage: 'assets/book10.jpg',
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Best Selling Books',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BookWidget(
                  bookTitle: 'The Narrow Road Between Desires',
                  bookAuthor: 'Patrick Rothfuss',
                  bookCoverImage: 'assets/sell1.jfif',
                ),
                BookWidget(
                  bookTitle: 'The Lord of the Rings',
                  bookAuthor: 'J.R.R Tolkiens',
                  bookCoverImage: 'assets/sell2.webp',
                ),
                BookWidget(
                  bookTitle: 'And then there were none',
                  bookAuthor: 'Agatha Cristie',
                  bookCoverImage: 'assets/sell3.jfif',
                ),
                BookWidget(
                  bookTitle: 'Lee Child',
                  bookAuthor: 'Jack Reacher',
                  bookCoverImage: 'assets/sell4.jfif',
                ),
                BookWidget(
                  bookTitle: 'Verity',
                  bookAuthor: 'Colleen Hoover',
                  bookCoverImage: 'assets/sell5.webp',
                ),
                BookWidget(
                  bookTitle: 'Harry Potter & Half-Blood Prince',
                  bookAuthor: 'J.K Rowlings',
                  bookCoverImage: 'assets/sell6.jpeg',
                ),
                BookWidget(
                  bookTitle: 'Harry Potter',
                  bookAuthor: 'J.K Rowlings',
                  bookCoverImage: 'assets/sell7.jpg',
                ),
                BookWidget(
                  bookTitle: 'Harry Potter & Philosophers Stone',
                  bookAuthor: 'J.K Rowlings',
                  bookCoverImage: 'assets/sell8.jfif',
                ),
                BookWidget(
                  bookTitle: 'Framed',
                  bookAuthor: 'Jhn Grisham and Jim McCloskey',
                  bookCoverImage: 'assets/sell9.webp',
                ),
                BookWidget(
                  bookTitle: 'The Testament',
                  bookAuthor: 'John Grisham',
                  bookCoverImage: 'assets/sell10.jpg',
                ),

              ],
            ),
          ),
          
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Featured Collection',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BookWidget(
                  bookTitle: 'Silver Blood',
                  bookAuthor: 'Emman Hamm',
                  bookCoverImage: 'assets/image1.jpg',
                ),
                BookWidget(
                  bookTitle: 'The Wolmen Mark',
                  bookAuthor: 'Megan Linski',
                  bookCoverImage: 'assets/image2.jpg',
                ),
                BookWidget(
                  bookTitle: 'Ever Marked',
                  bookAuthor: 'Elle Scott',
                  bookCoverImage: 'assets/image3.jpg',
                ),
                BookWidget(
                  bookTitle: 'The Far Traveller',
                  bookAuthor: 'Nancy Marie Brown',
                  bookCoverImage: 'assets/image4.jpg',
                ),
                BookWidget(
                  bookTitle: 'Icelandie Folklore',
                  bookAuthor: 'Iceland Culture',
                  bookCoverImage: 'assets/image5.jpg',
                ),
                BookWidget(
                  bookTitle: 'Treasure & Treason',
                  bookAuthor: 'Lisa Shearin',
                  bookCoverImage: 'assets/image6.jpg',
                ),
                BookWidget(
                  bookTitle: 'The Girl Who Cried Werewolf',
                  bookAuthor: 'Heather Hildenbrand and Bam Shepherd',
                  bookCoverImage: 'assets/image7.jpg',
                ),
                BookWidget(
                  bookTitle: 'WereHuman',
                  bookAuthor: 'Gwendolyn Druyor',
                  bookCoverImage: 'assets/image8.jpg',
                ),
                BookWidget(
                  bookTitle: 'Pendragon',
                  bookAuthor: 'James Wilde',
                  bookCoverImage: 'assets/image9.jpg',
                ),
                BookWidget(
                  bookTitle: 'Ravencrest Academy',
                  bookAuthor: 'Theresa Kay',
                  bookCoverImage: 'assets/image10.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BestsellerPage extends StatelessWidget {
  const BestsellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: BestsellerGrid(),
    );
  }
}

class BestsellerGrid extends StatelessWidget {
  const BestsellerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 2.0,
      childAspectRatio: 0.5,
      scrollDirection: Axis.vertical,
      children: const [
                      BookWidget(
                  bookTitle: 'The Narrow Road Between Desires',
                  bookAuthor: 'Patrick Rothfuss',
                  bookCoverImage: 'assets/sell1.jfif',
                ),
                BookWidget(
                  bookTitle: 'The Lord of the Rings',
                  bookAuthor: 'J.R.R Tolkiens',
                  bookCoverImage: 'assets/sell2.webp',
                ),
                BookWidget(
                  bookTitle: 'And then there were None',
                  bookAuthor: 'Agatha Cristie',
                  bookCoverImage: 'assets/sell3.jfif',
                ),
                BookWidget(
                  bookTitle: 'Lee Child',
                  bookAuthor: 'Jack Reacher',
                  bookCoverImage: 'assets/sell4.jfif',
                ),
                BookWidget(
                  bookTitle: 'Verity',
                  bookAuthor: 'Colleen Hoover',
                  bookCoverImage: 'assets/sell5.webp',
                ),
                BookWidget(
                  bookTitle: 'Harry Potter & Half-Blood Prince',
                  bookAuthor: 'J.K Rowlings',
                  bookCoverImage: 'assets/sell6.jpeg',
                ),
                BookWidget(
                  bookTitle: 'Harry Potter',
                  bookAuthor: 'J.K Rowlings',
                  bookCoverImage: 'assets/sell7.jpg',
                ),
                BookWidget(
                  bookTitle: 'Harry Potter & Philosophers Stone',
                  bookAuthor: 'J.K Rowlings',
                  bookCoverImage: 'assets/sell8.jfif',
                ),
                BookWidget(
                  bookTitle: 'Framed',
                  bookAuthor: 'Jhn Grisham and Jim McCloskey',
                  bookCoverImage: 'assets/sell9.webp',
                ),
                BookWidget(
                  bookTitle: 'The Testament',
                  bookAuthor: 'John Grisham',
                  bookCoverImage: 'assets/sell10.jpg',
                ),
      ],
    );
  }
}

class OfflineBooksPage extends StatelessWidget {
  const OfflineBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: OfflineBooksGrid(),
    );
  }
}

class OfflineBooksGrid extends StatelessWidget {
  const OfflineBooksGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 2.0,
      childAspectRatio: 0.5,
      scrollDirection: Axis.vertical,
      children: const [
        BookWidget(
          bookTitle: 'A Study in Drowning',
          bookAuthor: 'Melissa Albert',
          bookCoverImage: 'assets/off1.jpg',
        ),
        BookWidget(
          bookTitle: 'Daughter of No Words',
          bookAuthor: 'Carissa Broadbent',
          bookCoverImage: 'assets/off2.jfif',
        ),
                BookWidget(
          bookTitle: 'A Dark and Hollow Star',
          bookAuthor: 'Ashley Shutterworth',
          bookCoverImage: 'assets/off3.jfif',
        ),        BookWidget(
          bookTitle: 'LUSH and other tales at Boozy Mayhem',
          bookAuthor: 'Duane Swierzynski',
          bookCoverImage: 'assets/off4.jfif',
        ),        BookWidget(
          bookTitle: 'If Tomorrow Comes',
          bookAuthor: 'Nancy Kress',
          bookCoverImage: 'assets/off5.jfif',
        ),        BookWidget(
          bookTitle: 'Entropy',
          bookAuthor: 'Gerald M. Kilby',
          bookCoverImage: 'assets/off6.jpg',
        ),        BookWidget(
          bookTitle: 'Beyond New Eden',
          bookAuthor: 'H.S. Stone',
          bookCoverImage: 'assets/off7.jfif',
        ),        BookWidget(
          bookTitle: 'A Desolation Called Peace',
          bookAuthor: 'Arkady Martine',
          bookCoverImage: 'assets/off8.jfif',
        ),        BookWidget(
          bookTitle: 'The War of the Worlds',
          bookAuthor: 'H.G. Wells',
          bookCoverImage: 'assets/off9.jfif',
        ),        BookWidget(
          bookTitle: 'Drowned Cities',
          bookAuthor: 'Paolo Bacigalupi',
          bookCoverImage: 'assets/off10.jfif',
        ),
      ],
    );
  }
}


class PurchasedBooksPage extends StatelessWidget {
  const PurchasedBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: PurchasedBooksGrid(),
    );
  }
}

class PurchasedBooksGrid extends StatelessWidget {
  const PurchasedBooksGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 2.0,
      childAspectRatio: 0.5,
      scrollDirection: Axis.vertical,
      children: const [
        BookWidget(
          bookTitle: 'Shutter Island',
          bookAuthor: 'Dennis Lehane',
          bookCoverImage: 'assets/pur1.jfif',
        ),
        BookWidget(
          bookTitle: 'The Beautiful Mystery',
          bookAuthor: 'Louise Penny',
          bookCoverImage: 'assets/pur2.jpg',
        ),
        BookWidget(
          bookTitle: 'The Adventure of Sherlock Holmes',
          bookAuthor: 'Sir Arthure Conan Doyle',
          bookCoverImage: 'assets/pur3.jfif',
        ),        
        BookWidget(
          bookTitle: 'Sherlock Holmes',
          bookAuthor: 'Sir Arthure Conan Doyle',
          bookCoverImage: 'assets/pur4.jfif',
        ),        
        BookWidget(
          bookTitle: 'The Last House of Needless Street',
          bookAuthor: 'Catriona Ward',
          bookCoverImage: 'assets/pur5.jfif',
        ),        
        BookWidget(
          bookTitle: 'The Hunger',
          bookAuthor: 'Alma Katsu',
          bookCoverImage: 'assets/pur6.jfif',
        ),        
        BookWidget(
          bookTitle: 'Fear',
          bookAuthor: 'R.L Stine',
          bookCoverImage: 'assets/pur7.jfif',
        ),        
        BookWidget(
          bookTitle: 'Pet Sematary',
          bookAuthor: 'Stephen King',
          bookCoverImage: 'assets/pur8.jfif',
        ),        
        BookWidget(
          bookTitle: 'The Ruins',
          bookAuthor: 'Scott Smith',
          bookCoverImage: 'assets/pur9.jfif',
        ),        
        BookWidget(
          bookTitle: 'I am Legend',
          bookAuthor: '',
          bookCoverImage: 'assets/pur10.jpg',
        ),        
      ],
    );
  }
}

class PopularBooksPage extends StatelessWidget {
  const PopularBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: PopularBooksGrid(),
    );
  }
}

class PopularBooksGrid extends StatelessWidget {
  const PopularBooksGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 2.0,
      childAspectRatio: 0.5,
      scrollDirection: Axis.vertical,
      children: const [
        BookWidget(
          bookTitle: 'Hatchet',
          bookAuthor: 'Gary Paulsen',
          bookCoverImage: 'assets/pop1.jpg',
        ),
        BookWidget(
          bookTitle: 'Treasure Island',
          bookAuthor: 'Robert Louis Stevenson',
          bookCoverImage: 'assets/pop2.jpg',
        ),
        BookWidget(
          bookTitle: 'Escape to Pirate Island',
          bookAuthor: 'Niamh Murphy',
          bookCoverImage: 'assets/pop3.jfif',
        ),BookWidget(
          bookTitle: 'The Famous Five',
          bookAuthor: 'Guid Blyton',
          bookCoverImage: 'assets/pop4.jpg',
        ),BookWidget(
          bookTitle: 'Heart of Darkness',
          bookAuthor: 'Joseph Conrad',
          bookCoverImage: 'assets/pop5.jfif',
        ),BookWidget(
          bookTitle: 'The Love Hypothesis',
          bookAuthor: 'Ali Hazelwood',
          bookCoverImage: 'assets/pop6.jfif',
        ),BookWidget(
          bookTitle: 'Pride and Prejudice',
          bookAuthor: 'Jane Austen',
          bookCoverImage: 'assets/pop7.jfif',
        ),BookWidget(
          bookTitle: 'A Part of You',
          bookAuthor: 'Lynden Renwick',
          bookCoverImage: 'assets/pop8.jfif',
        ),BookWidget(
          bookTitle: 'Youve Reached Sam',
          bookAuthor: 'Dustin Thao',
          bookCoverImage: 'assets/pop9.webp',
        ),BookWidget(
          bookTitle: 'You are Still the One',
          bookAuthor: 'Himanshu Rai',
          bookCoverImage: 'assets/pop10.webp',
        ),
      ],
    );
  }
}

class BookWidget extends StatelessWidget {
  final String bookTitle;
  final String bookAuthor;
  final String bookCoverImage;

  const BookWidget({
    super.key,
    required this.bookTitle,
    required this.bookAuthor,
    required this.bookCoverImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:250, 
      height: 350, 
      child: Card(
        color: const Color.fromARGB(255, 255, 243, 234), 
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0), 
                
                child: Image.asset(
                  bookCoverImage,
                  width: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                bookTitle,
                style: const TextStyle(fontSize: 13.8, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(bookAuthor, style: const TextStyle(fontSize: 11)),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                onPressed: () {
                  debugPrint('Selected $bookTitle');
                },
                child: const Text('Read'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function(int) onTap;

  const MyDrawer({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Ms. Maurixe"),
            accountEmail: Text("maurixe15@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              child: Text(
                "M",
                style: TextStyle(fontSize: 40.0, color: Colors.blue),
              ),
            ),
          ),
          
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => onTap(0),
          ),
          ListTile(
            leading: const Icon(Icons.local_offer),
            title: const Text('Best Sellers'),
            onTap: () => onTap(1),
          ),
          ListTile(
            leading: const Icon(Icons.cloud_download),
            title: const Text('Offline Books'),
            onTap: () => onTap(2),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Purchased Books'),
            onTap: () => onTap(3),
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Popular Books'),
            onTap: () => onTap(4),
          ),
        ],
      ),
    );
  }
}
