import 'package:flutter/material.dart';
import 'package:apps_gym/ui/favoritescreen.dart';
import 'package:apps_gym/ui/notification.dart';
import 'package:apps_gym/ui/work_screen.dart';
import 'package:apps_gym/ui/add_story.dart';
import 'package:apps_gym/ui/gesture.dart';
import 'package:apps_gym/ui/login.dart';

void main() {
  runApp(const FloatingButtonDemo());
}

class FloatingButtonDemo extends StatelessWidget {
  const FloatingButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Perhatian !!!'),
          content: const Text('Klik OK untuk melanjutkan ?.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MY APPS',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 6, 6, 130),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 64, 62, 176),
        tooltip: 'Increment',
        onPressed: () {},
        child: const Icon(Icons.add, size: 28),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 76, 101, 192),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home, color: Color.fromRGBO(109, 204, 225, 1)),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite, color: Colors.red),
              iconSize: 30,
            ),
            IconButton(
              icon: Icon(Icons.share, color: Color.fromRGBO(109, 204, 225, 1)),
              onPressed: () {
                
                // Implement share functionality here
              }
            ),
            IconButton(
              icon: Icon(Icons.bookmark, color: Color.fromRGBO(109, 204, 225, 1)),
              onPressed: () {
                
                // Implement share functionality here
              }
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.jpg'), // Background image for UserAccountsDrawerHeader
                  fit: BoxFit.cover,
                ),
              ),
              child: UserAccountsDrawerHeader(
                accountName: Text('Putri Priyanti'),
                accountEmail: Text('putri@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/image.png'),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(0, 234, 228, 228), // Transparent background to see the image
                ),
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.home_outlined),
                  title: const Text('Home'),
                  onTap: () {
                    /// Close Navigation drawer before
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()),);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.favorite_border),
                  title: const Text('Favourites'),
                  onTap: () {
                    /// Close Navigation drawer before
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoriteScreen()),);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.workspaces),
                  title: const Text('Workflow'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CardBasicRoute()),);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.update),
                  title: const Text('Updates'),
                  onTap: () {
                   Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const GestureScreen()),);
                  },
                ),
                const Divider(color: Colors.black45,),
                ListTile(
                  leading: const Icon(Icons.account_tree_outlined),
                  title: const Text('Plugins'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.notifications_outlined),
                  title: const Text('Notifications'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()),);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    // Add your logout logic here
                    // For example, clearing user session, navigating to login page, etc.
                    
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
     body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Addstory()),
          );
        },
         child: Center(
          child: buildImageContainer(getImageUrl(0)),
        ),
      ),

    );
  }
}

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourites',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 6, 6, 130),
      ),
      body: Center(
        child: const Text('Favourite Screen'),
      ),
    );
  }
}

class ElevatedButtonExample extends StatefulWidget {
  final Function(BuildContext) showAlertDialog; // Define a function parameter

  const ElevatedButtonExample({Key? key, required this.showAlertDialog}) : super(key: key);

  @override
  _ElevatedButtonExampleState createState() => _ElevatedButtonExampleState();
}

class _ElevatedButtonExampleState extends State<ElevatedButtonExample> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
      

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: style,
            onPressed: () {
              // Call the function passed from the HomeScreen
              widget.showAlertDialog(context);
            },
            child: const Text('Home Screen'),
          ),
          
        ],
      ),
    );
  }
}

Widget buildImageContainer(String imageUrl) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  String getImageUrl(int index) {
    List<String> urls = [
      'https://awsimages.detik.net.id/community/media/visual/2022/05/03/kawasan-wisata-kawah-putih-1_169.jpeg?w=1200',
      
    ];
    return urls[index];
  }
