import 'package:flutter/material.dart';
import 'package:flutter_navigation/Screen2.dart';
import 'package:flutter_navigation/modelclass.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String? selectVal;

  Widget _textWidget(String hint, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  List<String> gender = ["Select Gender", "Male", "Female"];
  String selectGender = "Select Gender";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          spacing: 15,
          children: [
            _textWidget("Enter the Name", _nameController),
            _textWidget("Enter the age", _ageController),

            DropdownButton(
              value: selectGender,
              items: gender
                  .map(
                    (ele) => DropdownMenuItem(value: ele, child: Text("$ele")),
                  )
                  .toList(),
              onChanged: (newVal) {
                selectGender = newVal!;
                setState(() {});
              },
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(15),
                ),
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
              ),
              onPressed: () {
                print(_nameController.text);
                print(_ageController.text);

                Navigator.push(
                  // result: [
                  //   {"name": "Rushi", "age": 25},
                  // ],
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 300),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return Screen2(
                        userInfo: UserInfo(
                          name: _nameController.text.toString(),
                          age: int.parse(_ageController.text.toString()),
                          gender: selectGender,
                        ),
                      );
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position: animation.drive(
                              Tween(begin: Offset(-1, -1), end: Offset.zero),
                            ),
                            child: child,
                          );
                        },
                  ),
                ).then((value) {
                  selectVal = value!;
                  setState(() {});
                });
              },
              child: Text("Next"),
            ),

            if (selectVal != null) Text("Selected Val : $selectVal"),
          ],
        ),
      ),
    );
  }
}
