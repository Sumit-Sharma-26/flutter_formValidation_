import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


// Get Data from user in Student Profile Form with validation
class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _classController = TextEditingController();
  final _divisionController = TextEditingController();
  final _hobbiesController = TextEditingController();
  final _addressController = TextEditingController();
  final _genderController = TextEditingController();


  Widget _buildTextField(TextEditingController controller, String label, IconData icon, String validationPattern, {List<Widget>? suffix}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }

        // Validate based on the provided pattern
        if (validationPattern.isNotEmpty && !RegExp(validationPattern).hasMatch(value)) {
          return 'Invalid $label';
        }
        return null;
      },
    );
  }

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Gender", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Row(
          children: [
            Radio<String>(
              value: 'Male',
              groupValue: _genderController.text,
              onChanged: (value) {
                setState(() {
                  _genderController.text = value!;
                });
              },
            ),
            Text('Male'),
            Radio<String>(
              value: 'Female',
              groupValue: _genderController.text,
              onChanged: (value) {
                setState(() {
                  _genderController.text = value!;
                });
              },
            ),
            Text('Female'),
          ],
        ),
        if (_genderController.text.isEmpty)
          Text(
            'Please select a gender',
            style: TextStyle(color: Colors.red),
          ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(_nameController, "Name", Icons.person, r"^[a-zA-Z ]+$"),
              _buildTextField(_ageController, "Age", Icons.cake, r"^\d+$"),
              _buildTextField(_classController, "Class", Icons.school, r"^\d+$"),
              _buildTextField(_divisionController, "Division", Icons.people, r"^\d+$"),
              _buildTextField(_hobbiesController, "Hobbies", Icons.sports, r"^[a-zA-Z ]+$"),
              _buildTextField(_addressController, "Address", Icons.location_on, r"^[a-zA-Z ]+$"),
              _buildGenderSelection(),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false && _genderController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                            name: _nameController.text,
                            age: _ageController.text,
                            studentClass: _classController.text,
                            division: _divisionController.text,
                            hobbies: _hobbiesController.text,
                            address: _addressController.text,
                            gender: _genderController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
