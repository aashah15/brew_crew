import 'package:brew_crew/providers/brews_provider.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    BrewsProvider brewsProvider = Provider.of(context);
    brewsProvider.getBrews();
    _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: const SettingsForm(),
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Brew Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(Icons.person),
            label: const Text('Logout'),
            style: TextButton.styleFrom(primary: Colors.black),
          ),
          TextButton.icon(
              icon: const Icon(Icons.settings),
              label: const Text('Settings'),
              style: TextButton.styleFrom(primary: Colors.black),
              onPressed: () => _showSettingsPanel())
        ],
      ),
      body: const BrewList(),
    );
  }
}
