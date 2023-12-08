import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String age;
  final String studentClass;
  final String division;
  final String hobbies;
  final String address;
  final String gender;

  const ProfileScreen({
    Key? key,
    required this.name,
    required this.age,
    required this.studentClass,
    required this.division,
    required this.hobbies,
    required this.address,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData genderIcon = gender == 'Male' ? Icons.male : Icons.female;

    return Scaffold(
      appBar: AppBar(
        title: Text('Student Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.black,
                  child: Icon(
                    genderIcon,
                    size: 100,
                    color: Colors.green, // Set the color as per your requirement
                  )
             ),
            ),
            SizedBox(height: 16),
            _buildProfileCard("Name", name),
            _buildProfileCard("Age", age),
            _buildProfileCard("Class", studentClass),
            _buildProfileCard("Division", division),
            _buildProfileCard("Hobbies", hobbies),
            _buildProfileCard("Address", address),
            _buildProfileCard("Gender", gender),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(String label, String value) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
