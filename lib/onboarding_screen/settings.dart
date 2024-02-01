import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MySettingsPage(),
//     );
//   }
// }

class MySettingsPage extends StatefulWidget {
  @override
  _MySettingsPageState createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();

  bool isEditing = false;

  void saveLocally() {
    // Save values locally (you can use shared preferences, database, etc.)
    // For now, we'll just print the values.
    print("Saved Locally:");
    print("Input 1: ${_controller1.text}");
    print("Input 2: ${_controller2.text}");
    print("Input 3: ${_controller3.text}");
    print("Input 4: ${_controller4.text}");
  }

  void toggleEditing() {
    // Toggle the editing state
    setState(() {
      isEditing = !isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Settings'),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildInputField(_controller1, 'user name', isEditing),
            buildInputField(_controller2, 'email', isEditing),
            buildInputField(_controller3, 'phone number', isEditing),
            buildInputField(_controller4, 'description', isEditing),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: isEditing ? null : saveLocally,
                  child: Text('Save'),
                ),
                ElevatedButton.icon(
                  onPressed: toggleEditing,
                  icon: Icon(isEditing ? Icons.done : Icons.edit),
                  label: Text(isEditing ? 'Done' : 'Edit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputField(
    TextEditingController controller,
    String labelText,
    bool isEditing,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        enabled: isEditing,
      ),
      enabled: isEditing,
    );
  }
}
