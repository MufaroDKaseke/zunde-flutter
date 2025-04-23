import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Consistent background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Group Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                title: Text(
                  'Edit Group Name',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.edit_group_name);
                },
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                title: Text(
                  'Change Cycle Type',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.change_cycle_type);
                },
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                title: Text(
                  'Change Contribution Amount',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.change_contribution);
                },
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                title: Text(
                  'Share group invite link',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.share_invite_link);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
