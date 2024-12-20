import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  // Dummy data for the user
  final String firstName = "John";
  final String lastName = "Doe";
  final String dob = "January 1, 1990";
  final String email = "john.doe@example.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFC734904),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Color(0xFC734904),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // First Name
              _buildProfileField("First Name", firstName),
              const SizedBox(height: 15),

              // Last Name
              _buildProfileField("Last Name", lastName),
              const SizedBox(height: 15),

              // Email
              _buildProfileField("Email", email),
              const SizedBox(height: 15),

              // Date of Birth
              _buildProfileField("Date of Birth", dob),
              const SizedBox(height: 30),

              // Edit Button
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    // Logic to edit profile
                    print("Edit profile tapped");
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: Color(0xFC734904),
                    elevation: 5,
                  ),
                  child: Text(
                    'Edit Profile',
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
      ),
    );
  }

  // Helper method to create profile fields
  Widget _buildProfileField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFC734904),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
