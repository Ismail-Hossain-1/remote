import 'package:flutter/material.dart';

class Womenpage extends StatefulWidget {
  const Womenpage({super.key});

  @override
  State<Womenpage> createState() => _WomenpageState();
}

class _WomenpageState extends State<Womenpage> {
  bool _womenswear = false;
  bool _menswear = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
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
                borderRadius: BorderRadius.circular(5), // Clip corners to match the container
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
                              'App partners',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 40,),
                        Checkbox(
                          value: _womenswear, // Current state of checkbox
                          onChanged: (bool? value) {
                            setState(() {
                              _womenswear = value ?? false; // Update checkbox state
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}