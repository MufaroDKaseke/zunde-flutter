import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShareGroupInviteLinkScreen extends StatefulWidget {
  final String groupName;
  const ShareGroupInviteLinkScreen({Key? key, required this.groupName})
    : super(key: key);

  @override
  _ShareGroupInviteLinkScreenState createState() =>
      _ShareGroupInviteLinkScreenState();
}

class _ShareGroupInviteLinkScreenState
    extends State<ShareGroupInviteLinkScreen> {
  String _inviteLink = '';
  String _inviteCode = '3SB7PT';

  @override
  void initState() {
    super.initState();
    _generateInviteLink();
  }

  Future<void> _generateInviteLink() async {
    await Future.delayed(Duration(milliseconds: 500)); //
    setState(() {
      _inviteLink =
          'https://zunde-app.com/invite/$_inviteCode-${DateTime.now().millisecondsSinceEpoch}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: Text('Share Invite Link', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            _inviteLink.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Share this link to invite members to "${widget.groupName}":',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    SelectableText(
                      _inviteLink,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton.icon(
                      onPressed: () {
                        Share.share(
                          _inviteCode,
                          subject: 'Invite to ${widget.groupName}',
                        );
                      },
                      icon: Icon(Icons.share, color: Colors.white),
                      label: Text(
                        'Share Link',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B5E20),
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Or scan this QR code:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      _inviteCode,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1B5E20),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12.0),
                    Center(
                      child: QrImageView(
                        data: _inviteCode,
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Members can scan this QR code to join the group.',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
      ),
    );
  }
}
