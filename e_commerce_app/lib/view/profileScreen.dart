import 'package:e_commerce_app/auth/userauth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final AuthService authService;
  const ProfileScreen({super.key, required this.authService});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          (widget.authService.isGuest!)
              ? Text("User Login with Guest Account")
              : Text("UserEmail : ${widget.authService.email}"),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              fixedSize: Size(MediaQuery.of(context).size.width, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                'login',
                (route) => false,
              );
            },
            child: Text("Log out", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
