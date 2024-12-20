import 'package:flutter/material.dart';
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
                    const Text('Recent Searches:', style: TextStyle(color: Color(0xffcc8f31), fontWeight: FontWeight.bold)),
                    ElevatedButton(
                      onPressed: _clearRecentSearches,
                      child: const Text(
                        'Clear Recent Searches',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfa574406),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        //backgroundColor: Colors.redAccent, // A more refined shade of red
                        //foregroundColor: Colors.white, // Text color
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Add padding for better button sizing
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Rounded corners for a modern look
                        ),
                        shadowColor: Colors.black45, // Shadow color for a more elevated effect
                        elevation: 5,
                        // Subtle shadow for elevation
                      ),
                    ),

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
