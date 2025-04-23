import 'package:flutter/material.dart';

class MembersScreen extends StatelessWidget {
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
              'Group Members',
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
                leading: CircleAvatar(
                  child: Text('M'),
                  backgroundColor: const Color(0xFFD4EDDA),
                ),
                title: Text(
                  'Mufaro',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text('Member'),
                trailing: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: true ? Colors.green.shade100 : Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    true ? 'Paid' : 'Pending',
                    style: TextStyle(
                      color:
                          true ? Colors.green.shade800 : Colors.amber.shade800,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('T'),
                  backgroundColor: const Color(0xFFD4EDDA),
                ),
                title: Text(
                  'Tanaka',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text('Member'),
                trailing: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color:
                        false ? Colors.green.shade100 : Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    false ? 'Paid' : 'Pending',
                    style: TextStyle(
                      color:
                          false ? Colors.green.shade800 : Colors.amber.shade800,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('B'),
                  backgroundColor: const Color(0xFFD4EDDA),
                ),
                title: Text(
                  'Brian',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text('Member'),
                trailing: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: true ? Colors.green.shade100 : Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    true ? 'Paid' : 'Pending',
                    style: TextStyle(
                      color:
                          true ? Colors.green.shade800 : Colors.amber.shade800,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('T'),
                  backgroundColor: const Color(0xFFD4EDDA),
                ),
                title: Text(
                  'Tatenda',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text('Member'),
                trailing: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color:
                        false ? Colors.green.shade100 : Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    false ? 'Paid' : 'Pending',
                    style: TextStyle(
                      color:
                          false ? Colors.green.shade800 : Colors.amber.shade800,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('L'),
                  backgroundColor: const Color(0xFFD4EDDA),
                ),
                title: Text(
                  'Leeroy',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text('Member'),
                trailing: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: true ? Colors.green.shade100 : Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    true ? 'Paid' : 'Pending',
                    style: TextStyle(
                      color:
                          true ? Colors.green.shade800 : Colors.amber.shade800,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('W'),
                  backgroundColor: const Color(0xFFD4EDDA),
                ),
                title: Text(
                  'William',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text('Member'),
                trailing: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: true ? Colors.green.shade100 : Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    true ? 'Paid' : 'Pending',
                    style: TextStyle(
                      color:
                          true ? Colors.green.shade800 : Colors.amber.shade800,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
