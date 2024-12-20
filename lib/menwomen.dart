import 'package:flutter/material.dart';
import 'package:remote/homepage.dart';
import 'package:remote/product.dart';
import 'package:remote/searchpage.dart';
import 'package:remote/women/womenpage.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _selectedIndex = 0;
  bool _womenswear = false;
  bool _menswear = false;

  // Method to change the selected category
  void _onCategorySelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Padding(
          padding: EdgeInsets.all(20.0),
          child: IndexedStack(
            index: _selectedIndex,
            children: <Widget>[
              // Content for Men (Example List)
              Column(
                //shrinkWrap: true,
                //  physics: NeverScrollableScrollPhysics(),  // Disable internal scrolling, since it's inside SingleChildScrollView
                children: <Widget>[
                  GestureDetector(
                    onTap: () => {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => ProductList()),
                      )
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white, // Card background color
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Shadow color
                            spreadRadius: 1.5, // Spread radius
                            blurRadius: 4, // Blur radius
                            offset: Offset(0, 3), // Shadow offset (X, Y)
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        //borderRadius: BorderRadius.circular(5), // Clip corners to match the container
                        child: Material(
                          color: Colors.white, // Card color
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      'NEW IN',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/images/bag.png', // Update with your image path
                                    width:
                                        120, // Specify width to fit your design
                                    height:
                                        120, // Specify height to fit your design
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white, // Card background color
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Shadow color
                            spreadRadius: 1.5, // Spread radius
                            blurRadius: 4, // Blur radius
                            offset: Offset(0, 3), // Shadow offset (X, Y)
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        //borderRadius: BorderRadius.circular(5), // Clip corners to match the container
                        child: Material(
                          color: Colors.white, // Card color
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      'CLOTHING',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/images/tshirt.png', // Update with your image path
                                    width:
                                        120, // Specify width to fit your design
                                    height:
                                        120, // Specify height to fit your design
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white, // Card background color
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Shadow color
                            spreadRadius: 1.5, // Spread radius
                            blurRadius: 4, // Blur radius
                            offset: Offset(0, 3), // Shadow offset (X, Y)
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        //borderRadius: BorderRadius.circular(5), // Clip corners to match the container
                        child: Material(
                          color: Colors.white, // Card color
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      'HILLS',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/images/hill.png', // Update with your image path
                                    width:
                                        120, // Specify width to fit your design
                                    height:
                                        120, // Specify height to fit your design
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ListView(
                shrinkWrap: true, // Make the ListView shrink to fit its content
                // physics: NeverScrollableScrollPhysics(),  // Disable internal scrolling, since it's inside SingleChildScrollView
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white, // Card background color
                      borderRadius:
                          BorderRadius.circular(15), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Shadow color
                          spreadRadius: 1.5, // Spread radius
                          blurRadius: 4, // Blur radius
                          offset: Offset(0, 3), // Shadow offset (X, Y)
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      //borderRadius: BorderRadius.circular(5), // Clip corners to match the container
                      child: Material(
                        color: Colors.white, // Card color
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'NEW IN',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  'assets/images/bag.png', // Update with your image path
                                  width:
                                      120, // Specify width to fit your design
                                  height:
                                      120, // Specify height to fit your design
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white, // Card background color
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Shadow color
                            spreadRadius: 1.5, // Spread radius
                            blurRadius: 4, // Blur radius
                            offset: Offset(0, 3), // Shadow offset (X, Y)
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        //borderRadius: BorderRadius.circular(5), // Clip corners to match the container
                        child: Material(
                          color: Colors.white, // Card color
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      'CLOTHING',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/images/tshirt.png', // Update with your image path
                                    width:
                                        120, // Specify width to fit your design
                                    height:
                                        120, // Specify height to fit your design
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white, // Card background color
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Shadow color
                            spreadRadius: 1.5, // Spread radius
                            blurRadius: 4, // Blur radius
                            offset: Offset(0, 3), // Shadow offset (X, Y)
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        //borderRadius: BorderRadius.circular(5), // Clip corners to match the container
                        child: Material(
                          color: Colors.white, // Card color
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      'SHOES',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/images/shoe.png', // Update with your image path
                                    width:
                                        120, // Specify width to fit your design
                                    height:
                                        120, // Specify height to fit your design
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
