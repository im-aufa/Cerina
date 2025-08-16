import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  final Auth0 auth0 = Auth0(
    dotenv.env['AUTH0_DOMAIN']!,
    dotenv.env['AUTH0_CLIENT_ID']!,
  );

  final Auth0Web auth0Web = Auth0Web(
    dotenv.env['AUTH0_DOMAIN']!,
    dotenv.env['AUTH0_CLIENT_ID']!,
  );

  Credentials? _credentials;

  Future<Credentials?> login() async {
    try {
      if (kIsWeb) {
        await auth0Web.loginWithRedirect(
          redirectUrl: 'http://localhost:3000',
        );
        return null; // Can't get credentials immediately.
      }

      final credentials = await auth0
          .webAuthentication(scheme: dotenv.env['AUTH0_CUSTOM_SCHEME'])
          .login(useHTTPS: true);

      _credentials = credentials;
      print("Login success");
      return credentials;
    } catch (e) {
      print("Login error: $e");
      return null;
    }
  }

  Future<void> logout() async {
    try {
      if (kIsWeb) {
        await auth0Web.logout(returnToUrl: 'http://localhost:3000');
      } else {
        await auth0
            .webAuthentication(scheme: dotenv.env['AUTH0_CUSTOM_SCHEME'])
            .logout(useHTTPS: true);
      }
      _credentials = null;
      print("Logged out");
    } catch (e) {
      print("Logout error: $e");
    }
  }

  Future<UserProfile?> getUser() async {
    if (_credentials != null) {
      return _credentials!.user;
    }
    if (kIsWeb) {
      await handleWebLogin();
      return _credentials?.user;
    }
    return null;
  }

  bool isAuthenticated() {
    return _credentials != null;
  }

  Future<void> handleWebLogin() async {
    if (kIsWeb) {
      try {
        final credentials = await auth0Web.onLoad();
        _credentials = credentials;
      } catch (e) {
        print("Error on web login: $e");
      }
    }
  }
}