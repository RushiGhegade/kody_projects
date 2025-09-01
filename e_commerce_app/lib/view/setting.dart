import 'package:e_commerce_app/auth/userauth.dart';
import 'package:e_commerce_app/auth/userdata.dart';
import 'package:e_commerce_app/view/profileScreen.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  AuthService authService = Userdata.currentUser;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Setting Screen"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Profile"),
              Tab(text: "Notification"),
              Tab(text: "About"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProfileScreen(authService: authService),
            Center(child: Text("Notification Screen")),
            Center(child: Text("About Screen")),
          ],
        ),
      ),
    );
  }
}
