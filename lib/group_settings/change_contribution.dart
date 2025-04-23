import 'package:flutter/material.dart';

class ChangeContributionAmountScreen extends StatefulWidget {
  @override
  _ChangeContributionAmountScreenState createState() =>
      _ChangeContributionAmountScreenState();
}

class _ChangeContributionAmountScreenState
    extends State<ChangeContributionAmountScreen> {
  TextEditingController _amountController = TextEditingController();
  double? _currentContributionAmount = 20.00;
  @override
  void initState() {
    super.initState();

    _amountController.text =
        _currentContributionAmount?.toStringAsFixed(2) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: Text(
          'Change Contribution Amount',
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
              'Current Contribution Amount:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.0),
            Text(
              '\$${_currentContributionAmount?.toStringAsFixed(2) ?? '0.00'}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1B5E20),
              ),
            ),
            SizedBox(height: 24.0),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'New Contribution Amount',
                border: OutlineInputBorder(),
                prefixText: '\$',
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
                final newAmount = double.tryParse(_amountController.text);
                if (newAmount != null && newAmount > 0) {
                  setState(() {
                    _currentContributionAmount = newAmount;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Contribution amount updated to \$${newAmount.toStringAsFixed(2)}',
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter a valid positive amount.'),
                    ),
                  );
                }
              },
              child: Center(
                child: Text(
                  'Save New Amount',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
