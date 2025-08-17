import 'package:cerina/core/utils/responsive.dart';
import 'package:cerina/features/auth/data/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  UserProfile? _user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final authService = AuthService();
    final user = await authService.getUser();
    if (mounted) {
      setState(() {
        _user = user;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive()..init(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Center(
          child: Text(
            'Kelola Akun',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.transparent),
            onPressed: null,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _user == null
              ? const Center(
                  child: Text('Could not load user data.'),
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    vertical: responsive.height(2),
                    horizontal: responsive.width(5),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: responsive.width(15),
                        backgroundImage: _user?.pictureUrl != null
                            ? NetworkImage(_user!.pictureUrl.toString())
                            : null,
                        child: _user?.pictureUrl == null
                            ? Icon(Icons.person, size: responsive.width(15))
                            : null,
                      ),
                      SizedBox(height: responsive.height(2)),
                      Text(
                        _user?.name ?? 'User Name',
                        style: TextStyle(
                          fontSize: responsive.fontSize(22),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _user?.email ?? 'user.email@example.com',
                        style: TextStyle(
                          fontSize: responsive.fontSize(16),
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: responsive.height(4)),
                      ProfileInfoTile(
                        responsive: responsive,
                        icon: Icons.person_outline,
                        label: 'Name',
                        value: _user?.name ?? 'N/A',
                      ),
                      SizedBox(height: responsive.height(1.5)),
                      ProfileInfoTile(
                        responsive: responsive,
                        icon: Icons.email_outlined,
                        label: 'Email',
                        value: _user?.email ?? 'N/A',
                      ),
                      SizedBox(height: responsive.height(1.5)),
                      ProfileInfoTile(
                        responsive: responsive,
                        icon: Icons.verified_user_outlined,
                        label: 'Email Verified',
                        value: _user?.isEmailVerified?.toString() ?? 'N/A',
                      ),
                      SizedBox(height: responsive.height(1.5)),
                      ProfileInfoTile(
                        responsive: responsive,
                        icon: Icons.update_outlined,
                        label: 'Updated At',
                        value: _user?.updatedAt?.toLocal().toString().split(' ')[0] ??
                            'N/A',
                      ),
                      SizedBox(height: responsive.height(1.5)),
                      ProfileInfoTile(
                        responsive: responsive,
                        icon: Icons.fingerprint,
                        label: 'User ID',
                        value: _user?.sub ?? 'N/A',
                      ),
                    ],
                  ),
                ),
    );
  }
}

/// A styled tile to display a piece of profile information.
class ProfileInfoTile extends StatelessWidget {
  final Responsive responsive;
  final IconData icon;
  final String label;
  final String value;

  const ProfileInfoTile({
    super.key,
    required this.responsive,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: responsive.height(2),
        horizontal: responsive.width(4),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(responsive.width(4)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600], size: responsive.fontSize(20)),
          SizedBox(width: responsive.width(4)),
          Text(
            label,
            style: TextStyle(
              fontSize: responsive.fontSize(16),
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontSize: responsive.fontSize(16),
                color: Colors.grey[800],
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
