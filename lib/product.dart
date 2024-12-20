import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String price;

  const ProductCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the order page with the product details
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OrderPage(
              title: title,
              imageUrl: imageUrl,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white, // Card background color
          borderRadius: BorderRadius.circular(15), // Rounded corners
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
          borderRadius: BorderRadius.circular(15),
          child: Material(
            color: Colors.white, // Card color
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title, // Product title
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          price, // Product price
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    imageUrl, // Image for the product
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample list of products with title, image path, and price
    final products = [
      {'title': 'T-Shirt', 'imageUrl': 'assets/images/tshirt.png', 'price': '\$49.99'},
      {'title': 'Shoe', 'imageUrl': 'assets/images/shoe.png', 'price': '\$29.99'},
      {'title': 'Bag', 'imageUrl': 'assets/images/bag.png', 'price': '\$89.99'},
      {'title': 'T-shirt', 'imageUrl': 'assets/images/tshirt.png', 'price': '\$59.99'},
      {'title': 'Shoe', 'imageUrl': 'assets/images/shoe.png', 'price': '\$79.99'},
      {'title': 'Bag', 'imageUrl': 'assets/images/bag.png', 'price': '\$19.99'},
      {'title': 'High Hill', 'imageUrl': 'assets/images/hill.png', 'price': '\$149.99'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ProductCard(
                title: products[index]['title']!,
                imageUrl: products[index]['imageUrl']!,
                price: products[index]['price']!,
              ),
            );
          },
        ),
      ),
    );
  }
}

class OrderPage extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String price;

  const OrderPage({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int _quantity = 1; // Default quantity

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Details')),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), // Rounded corners for the container
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5), // Light shadow color
                    blurRadius: 10, // Softness of the shadow
                    offset: Offset(0, 5), // Shadow position (downward)
                  ),
                ],
              ),
              child: Card(
                elevation: 0, // Remove the Card’s default shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded corners for the Card
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image section
                      ClipRRect(

                        borderRadius: BorderRadius.circular(10), // Image rounded corners
                        child: Image.asset(
                          widget.imageUrl, // Dynamic image path
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 15), // Space between image and text/quantity section
                      // Item info section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Item name
                            Text(
                              widget.title, // Dynamic product name
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            // Price tag
                            Text(
                              widget.price, // Dynamic price
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            // Quantity controls
                            Container(
                              // width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15), // Rounded corners for the container

                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.3), // Thin border color with opacity
                                  width: 2, // Thin border width
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: _decreaseQuantity,
                                  ),
                                  Text(
                                    '$_quantity', // Display current quantity
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: _increaseQuantity,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                            Container(
                              alignment: Alignment.center,
                              child: ElevatedButton(

                                onPressed: ()=>{}, // Add your function to handle add to cart
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  backgroundColor: Color(0xf7be8938), // Button color
                                ),
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

    );
  }
}

