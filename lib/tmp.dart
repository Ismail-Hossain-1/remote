import 'package:flutter/material.dart';

// CategoryPage - The current page where you select Men or Women and navigate to search
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
    return Scaffold(
      appBar: AppBar(title: const Text("Category Page")),
      body: Column(
        children: <Widget>[
          // Row with buttons (Women and Men)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _onCategorySelected(0), // Women selected
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedIndex == 0 ? Color(0xFC734904) : Colors.grey,
                  ),
                  child: const Text("Women"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _onCategorySelected(1), // Men selected
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedIndex == 1 ? Color(0xFC734904) : Colors.grey,
                  ),
                  child: const Text("Men"),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1), // Divider between buttons and content

          // Content for Women and Men (IndexedStack)
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: <Widget>[
                // Content for Women
                ListView(
                  children: <Widget>[
                    ListTile(title: Text('Women\'s Item 1')),
                    ListTile(title: Text('Women\'s Item 2')),
                    ListTile(title: Text('Women\'s Item 3')),
                    ListTile(title: Text('Women\'s Item 4')),
                  ],
                ),
                // Content for Men
                ListView(
                  children: <Widget>[
                    ListTile(title: Text('Men\'s Item 1')),
                    ListTile(title: Text('Men\'s Item 2')),
                    ListTile(title: Text('Men\'s Item 3')),
                    ListTile(title: Text('Men\'s Item 4')),
                  ],
                ),
              ],
            ),
          ),
          // Search button to navigate to the SearchPage
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to SearchPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
              child: const Text("Go to Search"),
            ),
          ),
        ],
      ),
    );
  }
}

// SearchPage - Where users can search and view their search history
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<String> _recentSearches = [];
  bool _isSearchFocused = false;

  // Method to handle search
  void _performSearch() {
    String searchQuery = _searchController.text.trim();

    // Only add to recent searches if the query is not empty and not already in the list
    if (searchQuery.isNotEmpty && !_recentSearches.contains(searchQuery)) {
      setState(() {
        _recentSearches.insert(0, searchQuery); // Add to the front of the list
      });
    }

    // Clear the search field after search
    _searchController.clear();
  }

  // Method to clear recent searches
  void _clearRecentSearches() {
    setState(() {
      _recentSearches.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isSearchFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Page")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _searchController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: _performSearch,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_isSearchFocused && _recentSearches.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Recent Searches:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _recentSearches.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_recentSearches[index]),
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: _clearRecentSearches,
                      child: const Text('Clear Recent Searches'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            const Divider(thickness: 1),
            // Add any additional content or functionality you want here
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // Index to track which content (Women or Men) to show
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode(); // FocusNode for the TextField

  // List to store recent search terms
  List<String> _recentSearches = [];
  bool _isSearchFocused = false; // Flag to check if the search bar is focused

  // Method to change the selected category
  void _onCategorySelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Method to handle the search
  void _performSearch() {
    String searchQuery = _searchController.text.trim();

    // Only add to recent searches if the query is not empty and not already in the list
    if (searchQuery.isNotEmpty && !_recentSearches.contains(searchQuery)) {
      setState(() {
        _recentSearches.insert(0, searchQuery); // Add to the front of the list
      });
    }

    // Clear the search field after search
    _searchController.clear();
  }

  // Method to clear the recent searches
  void _clearRecentSearches() {
    setState(() {
      _recentSearches.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isSearchFocused = _focusNode.hasFocus; // Update focus status
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Dispose of the FocusNode
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Make the entire page scrollable
        child: Column(
          children: <Widget>[
            // Search bar at the top
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20 , bottom: 20),
              child: TextField(
                controller: _searchController,
                focusNode: _focusNode, // Attach FocusNode to the TextField
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: _performSearch, // Perform search when button pressed
                  ),
                ),
              ),
            ),
            // Spacer to create space between the search bar and the buttons
            const SizedBox(height: 20),
            // Row with buttons (Women and Men)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20), // Padding to lower the buttons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _onCategorySelected(0), // Women selected
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedIndex == 0 ? Color(0xFC734904) : Colors.grey,
                    ),
                    child: const Text("Women"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => _onCategorySelected(1), // Men selected
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedIndex == 1 ? Color(0xFC734904) : Colors.grey,
                    ),
                    child: const Text("Men"),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1), // Divider between buttons and content

            // Show recent search terms only if the search bar is focused
            if (_isSearchFocused && _recentSearches.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Recent Searches:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    // Display recent searches in a list
                    ListView.builder(
                      shrinkWrap: true, // To avoid scrolling issue
                      physics: NeverScrollableScrollPhysics(), // Disable internal scrolling
                      itemCount: _recentSearches.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_recentSearches[index]),
                        );
                      },
                    ),
                    // Button to clear recent searches
                    ElevatedButton(
                      onPressed: _clearRecentSearches,
                      child: const Text('Clear Recent Searches'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Red color for clear button
                      ),
                    ),
                  ],
                ),
              ),
            const Divider(thickness: 1), // Divider between recent searches and content

            // IndexedStack for switching content
            IndexedStack(
              index: _selectedIndex,
              children: <Widget>[
                // Content for Women
                ListView(
                  shrinkWrap: true, // To avoid scrolling issue
                  physics: NeverScrollableScrollPhysics(), // Disable internal scrolling
                  children: <Widget>[
                    ListTile(
                      title: Text('Women\'s Item 1'),
                    ),
                    ListTile(
                      title: Text('Women\'s Item 2'),
                    ),
                    ListTile(
                      title: Text('Women\'s Item 3'),
                    ),
                    ListTile(
                      title: Text('Women\'s Item 4'),
                    ),
                  ],
                ),
                // Content for Men
                ListView(
                  shrinkWrap: true, // To avoid scrolling issue
                  physics: NeverScrollableScrollPhysics(), // Disable internal scrolling
                  children: <Widget>[
                    ListTile(
                      title: Text('Men\'s Item 1'),
                    ),
                    ListTile(
                      title: Text('Men\'s Item 2'),
                    ),
                    ListTile(
                      title: Text('Men\'s Item 3'),
                    ),
                    ListTile(
                      title: Text('Men\'s Item 4'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
