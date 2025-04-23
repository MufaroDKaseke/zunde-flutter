import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(Icons.done_all),
            onPressed: () {
              // Mark all as read
            },
            tooltip: 'Mark all as read',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            _buildSectionHeader('Today'),

            // Group Join Request with Action Buttons
            _buildNotificationCard(
              context,
              title: 'New Group Join Request',
              message: 'John Doe wants to join your savings group',
              time: '2 hours ago',
              isUnread: true,
              hasAction: true,
              onAccept: () {
                // Handle accept logic
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Request accepted')));
              },
              onDecline: () {
                // Handle decline logic
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Request declined')));
              },
            ),

            _buildNotificationCard(
              context,
              title: 'Contribution due tomorrow',
              message: 'Your group contribution of \$20 is due tomorrow',
              time: '3 hours ago',
              isUnread: true,
            ),

            _buildSectionHeader('Yesterday'),

            _buildNotificationCard(
              context,
              title: 'Your turn to receive payout!',
              message: 'Congratulations! You will receive \$120 this round',
              time: '1 day ago',
              isUnread: false,
            ),

            _buildNotificationCard(
              context,
              title: 'Mufaro made a contribution',
              message: 'Mufaro contributed \$25 to the group',
              time: '1 day ago',
              isUnread: false,
            ),

            _buildSectionHeader('Older'),

            _buildNotificationCard(
              context,
              title: 'Group meeting scheduled',
              message: 'The next group meeting is on Saturday at 10 AM',
              time: '3 days ago',
              isUnread: false,
            ),

            _buildNotificationCard(
              context,
              title: 'Payment reminder',
              message: 'Your contribution is due in 3 days',
              time: '4 days ago',
              isUnread: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(
    BuildContext context, {
    required String title,
    required String message,
    required String time,
    required bool isUnread,
    bool hasAction = false,
    VoidCallback? onAccept,
    VoidCallback? onDecline,
  }) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: isUnread ? Colors.green : Colors.transparent,
              width: 4,
            ),
          ),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                title,
                style: TextStyle(
                  fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(message),
                  SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
              contentPadding: EdgeInsets.all(12),
            ),
            if (hasAction)
              Padding(
                padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: onDecline,
                      child: Text(
                        'Decline',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: onAccept,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text('Accept'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
