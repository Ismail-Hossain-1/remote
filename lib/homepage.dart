import 'package:flutter/material.dart';
import 'package:remote/menwomen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of screens for each tab
  List<Widget> _pages = [
    ProfileScreen(),
    HomeScreen(),
    SearchScreen(),
    ShopScreen(),
    LikesScreen(),
  ];

  // Method to handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('App Interface'),
      // ),
      body: _pages[_selectedIndex], // Show the selected page
      // backgroundColor:
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Highlight the selected tab
        // backgroundColor: Color(0xff73572d),
        onTap: _onItemTapped, // Change selected tab
        selectedItemColor: Color(0xff5e3d22),
        unselectedItemColor: Color(0xff989291),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shops',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Likes',
          ),
        ],
      ),
    );
  }
}


// Example screens for each tab
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(  // Wrap only the scrollable content inside SingleChildScrollView
      child: CategoryPage(),      // CategoryPage should be the content being scrolled
    );
  }
}




class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Screen'));
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Search Screen'));
  }
}

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Shops Screen'));
  }
}

class LikesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Likes Screen'));
  }
}
