import 'package:flutter/material.dart';
import 'package:remote/homepage.dart';
import 'package:remote/searchpage.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _selectedIndex = 0;

  // Method to change the selected category
  void _onCategorySelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: <Widget>[
          //Search Field
          Padding(

            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: TextField(

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
              decoration: InputDecoration(

                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

         // Category Buttons (Women, Men)
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => _onCategorySelected(0), // Women selected
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _selectedIndex == 0
                                ? Color(0xFC734904)
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Text(
                        "Women",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextButton(
                    onPressed: () => _onCategorySelected(1), // Men selected
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _selectedIndex == 1
                                ? Color(0xFC734904)
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Text(
                        "Men",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1),

         // Content for Women and Men (IndexedStack)
          IndexedStack(
            index: _selectedIndex,
            children: <Widget>[
              ListView(
                shrinkWrap: true,  // Make the ListView shrink to fit its content
                physics: NeverScrollableScrollPhysics(),  // Disable internal scrolling, since it's inside SingleChildScrollView
                children: <Widget>[
                  ListTile(title: Text('Women\'s Item 1')),
                  ListTile(title: Text('Women\'s Item 2')),
                  ListTile(title: Text('Women\'s Item 3')),
                  ListTile(title: Text('Women\'s Item 4')),
                ],
              ),
              // Content for Men (Example List)
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),  // Disable internal scrolling, since it's inside SingleChildScrollView
                children: <Widget>[
                  ListTile(title: Text('Men\'s Item 1')),
                  ListTile(title: Text('Men\'s Item 2')),
                  ListTile(title: Text('Men\'s Item 3')),
                  ListTile(title: Text('Men\'s Item 4')),
                ],
              ),
            ],
          ),


        ],

    );
  }
}
