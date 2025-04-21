import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../services/group_service.dart';

class JoinGroupScreen extends StatefulWidget {
  @override
  _JoinGroupScreenState createState() => _JoinGroupScreenState();
}

class _JoinGroupScreenState extends State<JoinGroupScreen> {
  final TextEditingController _inviteCodeController = TextEditingController();

  void _joinGroup() async {
    // No need to recreate controller here - it's a class member now
    // Remove this line:
    // final TextEditingController _inviteCodeController = TextEditingController();

    try {
      final response = await GroupService.joinGroup(_inviteCodeController.text);
      //print('Cycle Type : $response');

      if (response.statusCode == 200) {
        // Assuming a successful creation returns 201 (Created)
        print('Group created successfully');
        Navigator.pushNamed(context, AppRoutes.new_overview);
      } else {
        print('Failed to create group. Status code: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to JOIN group. Please try again.')),
        );
      }
    } catch (e) {
      print('Error during group creation: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('An unexpected error occurred.')));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    _inviteCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20), //
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Join Group', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Enter Invite Code',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: _inviteCodeController,
                    decoration: InputDecoration(
                      hintText: 'Enter group invite code',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: EdgeInsets.all(12.0),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.qr);
                      },
                      icon: Icon(
                        Icons.qr_code_scanner,
                        color: const Color(0xFF1B5E20),
                      ),
                      label: Text(
                        'Scan QR Code',
                        style: TextStyle(color: const Color(0xFF1B5E20)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              // Fix the button's onPressed callback
              onPressed: () => _joinGroup(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B5E20),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Join Group',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'You\'ll need an invite code to join an existing savings group. Ask the group admin for the code or scan their QR code.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
