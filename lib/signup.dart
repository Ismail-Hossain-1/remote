import 'package:flutter/material.dart';
import 'package:remote/homepage.dart';
import 'package:remote/menwomen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _dobController = TextEditingController();

  bool _womenswear = false;
  bool _menswear = false;
  bool _discounts = false;
  bool _newstaff = false;
  bool _exclusives = false;
  bool _apppartners = false;

  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: currentDate,
    );

    if (selectedDate != null && selectedDate != currentDate) {
      // Update the text field with the selected date in YYYY-MM-DD format
      _dobController.text = "${selectedDate.toLocal()}".split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xFFAFAF14).withOpacity(0.1),

        body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        width: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                const SizedBox(height: 60.0),
                const Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                const Align(
                  alignment: Alignment.centerLeft, // Aligns text to the right
                  child: Text(
                    "Email Address",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFC734904)),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Color(0xFC734904).withOpacity(
                            0.5), // Adjust opacity here (0.0 to 1.0)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(
                              0xFC734904), // Border color when not focused
                          width: 1.0,
                        ),
                      ),
                      fillColor: Colors.white.withOpacity(0.1),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFC734904).withOpacity(0.3),
                      )),
                ),
                Align(
                  alignment: Alignment.centerLeft, // Aligns text to the right
                  child: Text(
                    "We'll send your order confirmation here",
                    style: TextStyle(
                      color: Color(0xFC734904).withOpacity(0.5),
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft, // Aligns text to the right
                  child: Text(
                    "First Name",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFC734904)),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "First name",
                      hintStyle: TextStyle(
                        color: Color(0xFC734904).withOpacity(
                            0.5), // Adjust opacity here (0.0 to 1.0)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(
                              0xFC734904), // Border color when not focused
                          width: 1.0,
                        ),
                      ),
                      fillColor: Colors.white.withOpacity(0.1),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xFC734904).withOpacity(0.3),
                      )),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft, // Aligns text to the right
                  child: Text(
                    "Last Name",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFC734904)),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter last name",
                      hintStyle: TextStyle(
                        color: Color(0xFC734904).withOpacity(
                            0.5), // Adjust opacity here (0.0 to 1.0)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(
                              0xFC734904), // Border color when not focused
                          width: 1.0,
                        ),
                      ),
                      fillColor: Colors.white.withOpacity(0.1),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xFC734904).withOpacity(0.3),
                      )),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft, // Aligns text to the right
                  child: Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFC734904)),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      hintStyle: TextStyle(
                        color: Color(0xFC734904).withOpacity(
                            0.5), // Adjust opacity here (0.0 to 1.0)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(
                              0xFC734904), // Border color when not focused
                          width: 1.0,
                        ),
                      ),
                      fillColor: Colors.white.withOpacity(0.1),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xFC734904).withOpacity(0.3),
                      )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Must be 10 or more characters",
                    style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFC734904).withOpacity(0.5)),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Date of Birth",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFC734904),
                    ),
                  ),
                ),
                TextField(
                  controller: _dobController,
                  readOnly:
                      true, // Make the text field read-only to avoid direct editing
                  decoration: InputDecoration(
                    hintText: "Select your date of birth",
                    hintStyle: TextStyle(
                      color: Color(0xFC734904).withOpacity(0.5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xFC734904),
                        width: 1.0,
                      ),
                    ),
                    fillColor: Colors.white.withOpacity(0.1),
                    filled: true,
                    prefixIcon: Icon(
                      Icons.calendar_today,
                      color: Color(0xFC734904).withOpacity(0.3),
                    ),
                  ),
                  onTap: () =>
                      _selectDate(context), // Open date picker when tapped
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mostly interested in(optional):",
                      style: TextStyle(color: Color(0xff8a8484), fontSize: 14),
                    )),
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
                    borderRadius: BorderRadius.circular(
                        5), // Clip corners to match the container
                    child: Material(
                      color: Colors.white, // Card color
                      child: Center(
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center, // Align horizontally
                          children: [
                            Checkbox(
                              shape: CircleBorder(),
                              value: _womenswear, // Current state of checkbox
                              onChanged: (bool? value) {
                                setState(() {
                                  _womenswear =
                                      value ?? false; // Update checkbox state
                                });
                              },
                            ),
                            Text(
                              'Womenswear',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Checkbox(
                              value: _menswear, // Current state of checkbox
                              shape: CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  _menswear =
                                      value ?? false; // Update checkbox state
                                });
                              },
                            ),
                            Text(
                              'Menswear',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
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
                    borderRadius: BorderRadius.circular(
                        5), // Clip corners to match the container
                    child: Material(
                      color: Colors.white, // Card color
                      child: Column(
                        children: <Widget>[
                         const Padding(
                            padding: EdgeInsets.all(10),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                               child: Text(
                                "Contact prefested in: ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                                         ),
                             ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Tell us which email you'd like",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffc0b4b4)
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // Align horizontally
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Discounts and sales',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Checkbox(
                                  value:
                                      _discounts, // Current state of checkbox
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _discounts = value ??
                                          false; // Update checkbox state
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // Align horizontally
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'New stuff',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Checkbox(
                                  value: _newstaff, // Current state of checkbox
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _newstaff = value ??
                                          false; // Update checkbox state
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // Align horizontally
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Your exclusives',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Checkbox(
                                  value:
                                      _exclusives, // Current state of checkbox
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _exclusives = value ??
                                          false; // Update checkbox state
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // Align horizontally
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'App partners',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Checkbox(
                                  value:
                                      _apppartners, // Current state of checkbox
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _apppartners = value ??
                                          false; // Update checkbox state
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Tell me more about these',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                         const Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'By creating your account, you agree to our: ',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff625b5b)
                              ),
                            ),
                          ),
                          const  Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Terms and conditions & Privacy Policy',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                  color: Color(0xFC734904)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
                padding: const EdgeInsets.only(top: 60, left: 3, bottom: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>HomePage())
                    );
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    // padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Color(0xFC867960),
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}
