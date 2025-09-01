import 'package:e_commerce_app/auth/dummy_user.dart';
import 'package:e_commerce_app/auth/userdata.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  Widget textFormFieldWidget(
    Widget icon,
    String prompt,
    TextEditingController controller,
  ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: prompt,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
      ),
    );
  }

  void showMySnackBar(String name) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(name)));
  }

  bool isvalid() {
    String email = _emailController.text;
    String pass = _passController.text;

    for (int i = 0; i < DummyUser.users.length; i++) {
      if (DummyUser.users[i].email == email &&
          DummyUser.users[i].password == pass) {
        showMySnackBar("Login successfully");
        return true;
      } else if (DummyUser.users[i].email == email &&
          DummyUser.users[i].password != pass) {
        showMySnackBar("Password Incorrect");
        return false;
      } else if (DummyUser.users[i].email != email &&
          DummyUser.users[i].password == pass) {
        showMySnackBar("Email Incorrect");
        return false;
      }
    }
    showMySnackBar("User Not Found");
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Text("Login Screen", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            spacing: 7,
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // color: Colors.grey,
                // alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(right: 30),
                height: 200,
                width: 200,
                child: Image.asset("assets/user.png",fit: BoxFit.contain,),
              ),

              Form(
                key: _key,
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Enter The Email"),

                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Enter the Email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.blue),
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    ),

                    SizedBox(height: 8),
                    Text("Enter The Password"),

                    TextFormField(
                      controller: _passController,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Enter the password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.blue),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forget Password",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: Size(MediaQuery.of(context).size.width, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  if (_key.currentState!.validate() && isvalid()) {
                    Userdata.currentUser.email = _emailController.text;
                    Userdata.currentUser.password = _passController.text;
                    Userdata.currentUser.isLoggedIn = true;
                    Userdata.currentUser.isGuest = false;

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      'homescreen',
                      (route) => false,
                    );
                  } else {}
                },
                child: Text("Login", style: TextStyle(color: Colors.white)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Continue as", style: TextStyle(fontSize: 19)),
                  TextButton(
                    onPressed: () {
                      Userdata.currentUser.isGuest = true;
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        'homescreen',
                        (route) => false,
                      );
                    },
                    child: Text(
                      "Guest",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
