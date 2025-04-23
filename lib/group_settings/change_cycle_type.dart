import 'package:flutter/material.dart';

enum CycleType {
  weekly,
  biWeekly,
  monthly,
}

class ChangeCycleTypeScreen extends StatefulWidget {
  @override
  _ChangeCycleTypeScreenState createState() => _ChangeCycleTypeScreenState();
}

class _ChangeCycleTypeScreenState extends State<ChangeCycleTypeScreen> {
  CycleType? _currentCycleType = CycleType.monthly; 
  CycleType? _selectedCycleType;

  @override
  void initState() {
    super.initState();
    
    _selectedCycleType = _currentCycleType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: Text(
          'Change Cycle Type',
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
              'Current Cycle Type:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.0),
            Text(
              _currentCycleType == CycleType.weekly
                  ? 'Weekly'
                  : _currentCycleType == CycleType.biWeekly
                      ? 'Bi-Weekly'
                      : 'Monthly',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: const Color(0xFF1B5E20)),
            ),
            SizedBox(height: 24.0),
            Text(
              'Select New Cycle Type:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            RadioListTile<CycleType>(
              title: const Text('Weekly'),
              value: CycleType.weekly,
              groupValue: _selectedCycleType,
              onChanged: (CycleType? value) {
                setState(() {
                  _selectedCycleType = value;
                });
              },
            ),
            RadioListTile<CycleType>(
              title: const Text('Bi-Weekly'),
              value: CycleType.biWeekly,
              groupValue: _selectedCycleType,
              onChanged: (CycleType? value) {
                setState(() {
                  _selectedCycleType = value;
                });
              },
            ),
            RadioListTile<CycleType>(
              title: const Text('Monthly'),
              value: CycleType.monthly,
              groupValue: _selectedCycleType,
              onChanged: (CycleType? value) {
                setState(() {
                  _selectedCycleType = value;
                });
              },
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B5E20),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                textStyle: TextStyle(fontSize: 18.0),
              ),
              onPressed: () {
                if (_selectedCycleType != null && _selectedCycleType != _currentCycleType) {
                  
                  setState(() {
                    _currentCycleType = _selectedCycleType;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'Cycle type updated to ${_currentCycleType == CycleType.weekly ? 'Weekly' : _currentCycleType == CycleType.biWeekly ? 'Bi-Weekly' : 'Monthly'}')),
                  );
                  
                } else if (_selectedCycleType == _currentCycleType) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('The selected cycle type is the same as the current.')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select a cycle type.')),
                  );
                }
              },
              child: Center(child: Text('Save New Cycle Type', style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}