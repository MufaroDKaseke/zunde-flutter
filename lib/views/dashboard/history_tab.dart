import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transaction History',
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
                  'Contribution',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'Brian',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                trailing: Text('+\$20', style: TextStyle(color: Colors.green)),
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
                  'Contribution',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'William',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                trailing: Text('+\$20', style: TextStyle(color: Colors.green)),
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
                  'Contribution',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'Leeroy',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                trailing: Text('+\$20', style: TextStyle(color: Colors.green)),
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
                  'Contribution',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'Mufaro',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                trailing: Text('+\$20', style: TextStyle(color: Colors.green)),
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
                  'Payout',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'Tatenda',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                trailing: Text('-\$120', style: TextStyle(color: Colors.red)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
