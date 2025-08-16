import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';

class ProfileSetting extends StatelessWidget {
  final UserProfile? user;

  const ProfileSetting({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (user?.pictureUrl != null)
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: CircleAvatar(
              radius: 56,
              child:
                  ClipOval(child: Image.network(user!.pictureUrl.toString())),
            ),
          )
        else
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: const CircleAvatar(
              radius: 56,
              child: Icon(Icons.person, size: 56), // Fallback for null user
            ),
          ),
        Card(
          child: Column(
            children: [
              UserEntryWidget(
                  propertyName: 'Id', propertyValue: user?.sub ?? 'N/A'),
              UserEntryWidget(
                  propertyName: 'Name', propertyValue: user?.name ?? 'N/A'),
              UserEntryWidget(
                  propertyName: 'Email', propertyValue: user?.email ?? 'N/A'),
              UserEntryWidget(
                propertyName: 'Email Verified?',
                propertyValue: user?.isEmailVerified.toString() ?? 'N/A',
              ),
              UserEntryWidget(
                propertyName: 'Updated at',
                propertyValue: user?.updatedAt?.toIso8601String() ?? 'N/A',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// UserEntryWidget
class UserEntryWidget extends StatelessWidget {
  final String propertyName;
  final String? propertyValue;

  const UserEntryWidget({
    required this.propertyName,
    required this.propertyValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(propertyName), Text(propertyValue ?? '')],
      ),
    );
  }
}
