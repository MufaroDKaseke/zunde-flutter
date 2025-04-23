import 'package:flutter/material.dart';
import 'package:mukando_app/core/constants/colors.dart';
import '../dashboard/history_tab.dart';
import '../dashboard/members_tab.dart';
import '../dashboard/overview_tab.dart';
import '../dashboard/settings_tab.dart';
import '../../routes/app_routes.dart';
import '../../services/group_service.dart';

class GroupDashboard extends StatefulWidget {
  final String groupId;
  const GroupDashboard({required this.groupId});

  @override
  _GroupDashboardState createState() => _GroupDashboardState();
}

class _GroupDashboardState extends State<GroupDashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: zbGreen,
        title: const Text(
          'Group Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              _showLogoutDialog(context); // Extract dialog to a method
            },
          ),
        ],
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        // Add FAB
        onPressed: () => Navigator.pushNamed(context, AppRoutes.chatbot),
        backgroundColor: zbGreen,
        foregroundColor: Colors.white,
        tooltip: 'Add Contribution', // Add a tooltip for accessibility
        child: const Icon(Icons.chat_bubble_outline),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, // Position at the bottom right
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirm Logout'),
            content: const Text('Are you sure you want to log out?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: zbGreen),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Logout'),
              ),
            ],
          ),
    );
  }

  //show contribution dialog
  //   void _showCreateContributionDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('Create Contribution'),
  //       content:  Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           TextFormField(
  //             decoration: const InputDecoration(labelText: 'Amount'),
  //             keyboardType: TextInputType.numberWithOptions(decimal: true),
  //           ),
  //           const SizedBox(height: 12),
  //            TextFormField(
  //             decoration: const InputDecoration(labelText: 'Description'),
  //           ),
  //            const SizedBox(height: 12),
  //           // Add a date picker

  //         ],
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: const Text('Cancel'),
  //         ),
  //         ElevatedButton(
  //           style: ElevatedButton.styleFrom(
  //               backgroundColor: const Color.fromARGB(255, 14, 137, 76)),
  //           onPressed: () {
  //             //  Handle the contribution submission here
  //             Navigator.pop(context);
  //           },
  //           child: const Text('Submit'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return OverviewScreen();
      case 1:
        return MembersScreen();
      case 2:
        return HistoryScreen();
      case 3:
        return SettingsScreen();
      default:
        return OverviewScreen();
    }
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Members',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: zbGreen,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}
