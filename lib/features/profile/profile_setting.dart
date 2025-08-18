import 'package:cerina/features/auth/data/auth_service.dart';
import 'package:cerina/features/auth/welcome_screen.dart';
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

  Future<void> _logout() async {
    final authService = AuthService();
    await authService.logout();
    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

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
        actions: const [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.transparent),
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
                    vertical: screenSize.height * 0.02,
                    horizontal: screenSize.width * 0.05,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: screenSize.width * 0.15,
                        backgroundImage: _user?.pictureUrl != null
                            ? NetworkImage(_user!.pictureUrl.toString())
                            : null,
                        child: _user?.pictureUrl == null
                            ? Icon(Icons.person, size: screenSize.width * 0.15)
                            : null,
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      Text(
                        _user?.name ?? 'User Name',
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _user?.email ?? 'user.email@example.com',
                        style: textTheme.titleMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.04),
                      ProfileInfoTile(
                        icon: Icons.person_outline,
                        label: 'Name',
                        value: _user?.name ?? 'N/A',
                      ),
                      SizedBox(height: screenSize.height * 0.015),
                      ProfileInfoTile(
                        icon: Icons.email_outlined,
                        label: 'Email',
                        value: _user?.email ?? 'N/A',
                      ),
                      SizedBox(height: screenSize.height * 0.015),
                      ProfileInfoTile(
                        icon: Icons.verified_user_outlined,
                        label: 'Email Verified',
                        value: _user?.isEmailVerified?.toString() ?? 'N/A',
                      ),
                      SizedBox(height: screenSize.height * 0.015),
                      ProfileInfoTile(
                        icon: Icons.update_outlined,
                        label: 'Updated At',
                        value: _user?.updatedAt
                                ?.toLocal()
                                .toString()
                                .split(' ')[0] ??
                            'N/A',
                      ),
                      SizedBox(height: screenSize.height * 0.015),
                      ProfileInfoTile(
                        icon: Icons.fingerprint,
                        label: 'User ID',
                        value: _user?.sub ?? 'N/A',
                      ),
                      SizedBox(height: screenSize.height * 0.03),
                      ElevatedButton.icon(
                        onPressed: _logout,
                        icon: const Icon(Icons.logout),
                        label: const Text('Log Out'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.pink[400],
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(screenSize.width * 0.04),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
    );
  }
}

class ProfileInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ProfileInfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenSize.height * 0.02,
        horizontal: screenSize.width * 0.04,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenSize.width * 0.04),
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
          Icon(icon,
              color: Colors.grey[600], size: textTheme.titleLarge?.fontSize),
          SizedBox(width: screenSize.width * 0.04),
          Text(
            label,
            style: textTheme.titleMedium,
          ),
          const Spacer(),
          Flexible(
            child: Text(
              value,
              style: textTheme.titleMedium?.copyWith(
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
