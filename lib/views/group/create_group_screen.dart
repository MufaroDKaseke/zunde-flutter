import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../services/group_service.dart';

class CreateGroupScreen extends StatefulWidget {
  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final TextEditingController _groupNameController = TextEditingController();
  String? _cycleType;
  final TextEditingController _contributionAmountController =
      TextEditingController();
  final TextEditingController _groupDescriptionController =
      TextEditingController();

  List<String> _cycleTypes = ['Daily', 'Weekly', 'Monthly'];

  void _createGroup() async {
    if (_cycleType == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please select a Cycle Type')));
      return;
    }

    // Attempt to parse the contribution amount
    // final contributionAmount = double.tryParse(_contributionAmountController.text);
    // if (contributionAmount == null) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Please enter a valid Contribution Amount')),
    //   );
    //   return;
    // }

    try {
      final response = await GroupService.createGroup(
        _groupNameController.text,
        _cycleType!, // Use the non-nullable _cycleType
        _contributionAmountController.text,
        _groupDescriptionController.text,
      );
      //print('Cycle Type : $response');

      if (response.statusCode == 201) {
        // Assuming a successful creation returns 201 (Created)
        print('Group created successfully');
        Navigator.pushNamed(context, AppRoutes.new_overview);
      } else {
        print('Failed to create group. Status code: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create group. Please try again.')),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Create Group', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Group Name',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _groupNameController,
              decoration: InputDecoration(
                hintText: 'Enter group name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: EdgeInsets.all(12.0),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Cycle Type',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: 'Select cycle type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: EdgeInsets.all(12.0),
              ),
              value: _cycleType,
              items:
                  _cycleTypes.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _cycleType = newValue;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Contribution Amount',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _contributionAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter amount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: EdgeInsets.all(12.0),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Group Description (Optional)',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _groupDescriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Describe your group\'s purpose',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: EdgeInsets.all(12.0),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _createGroup,
              //Navigator.pushNamed(context, AppRoutes.new_dashboard)

              //create group logic
              //print('Create Group pressed');
              //Navigator.pushNamed(context, AppRoutes.dashboard);,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B5E20),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Create Group',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Divider(thickness: 1.0)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('OR', style: TextStyle(color: Colors.grey[600])),
                ),
                Expanded(child: Divider(thickness: 1.0)),
              ],
            ),
            SizedBox(height: 16.0),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.joinGroup);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: const Color(0xFF1B5E20)),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Join Group',
                style: TextStyle(
                  color: const Color(0xFF1B5E20),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
