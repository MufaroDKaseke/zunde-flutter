import 'package:flutter/material.dart';

class EditGroupNameScreen extends StatefulWidget {
  final String currentGroupName;

  const EditGroupNameScreen({Key? key, required this.currentGroupName}) : super(key: key);

  @override
  _EditGroupNameScreenState createState() => _EditGroupNameScreenState();
}

class _EditGroupNameScreenState extends State<EditGroupNameScreen> {
  TextEditingController _groupNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _groupNameController.text = widget.currentGroupName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: Text(
          'Edit Group Name',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Current Group Name:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.currentGroupName,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 24.0),
            TextField(
              controller: _groupNameController,
              decoration: InputDecoration(
                labelText: 'New Group Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B5E20),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                textStyle: TextStyle(fontSize: 18.0),
              ),
              onPressed: () {
                final newGroupName = _groupNameController.text.trim();
                if (newGroupName.isNotEmpty && newGroupName != widget.currentGroupName) {
                  
                  Navigator.pop(context, newGroupName); 
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Group name updated to "$newGroupName"')),
                  );
                } else if (newGroupName.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Group name cannot be empty.')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('No changes made.')),
                  );
                }
              },
              child: Center(child: Text('Save New Name', style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}