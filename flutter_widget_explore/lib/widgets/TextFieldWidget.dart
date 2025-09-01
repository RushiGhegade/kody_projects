import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  Widget _text(int i, String name) {
    return Text("${i}) $name");
  }

  TextEditingController _textEditingController = TextEditingController();

  final _form = GlobalKey<FormState>();
  // final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inputs")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text(
                "A) Widget for input",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),

              Text(
                "1) TextField : it use to create a basic text input like search box , textfield have some limitaions like validation ",
              ),
              Text(
                "2) TextFormField : when integrating text input field with a form widget it provide the build in validation ",
              ),
              Text(
                "3) Form : to manage and avlidate the group of form field collectivly",
              ),
              Text(
                "B Properties of TexFormField",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),

              _text(
                1,
                "Controller & onFieldSubmitted:\n Controller => is used to control the text in TextField widgets, allowing you to read, modify, or set the text value. \nonFieldSubmitted: when we enter the done in keyboard that time this function call",
              ),

              TextFormField(
                controller: _textEditingController,
                onFieldSubmitted: (x) {
                  setState(() {});
                },
              ),
              if (_textEditingController.text.isNotEmpty)
                Text(_textEditingController.text),
              _text(
                2,
                "decoration :InputDecoration() it use to decorate the textField ",
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  label: Text("label"),
                  hintText: "Hint Text",
                  helperText: "Helper Text",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              _text(
                3,
                "textInputAction: it automatically change focus from one field to another field",
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Enter the Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              TextFormField(
                // textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Enter the age",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              _text(
                4,
                "obscureText & obscuringCharacter: hide the data that you enter",
              ),
              TextFormField(
                obscureText: true,
                obscuringCharacter: '#',
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Enter the Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              _text(5, "maxLength=12 : only 12 character we enter"),
              TextFormField(
                maxLength: 12,

                decoration: InputDecoration(
                  hintText: "Enter the Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              _text(
                6,
                "maxLines=5 : it show 2 lines when we click it call these function",
              ),
              TextFormField(
                onTap: () {
                  print("on tap");
                },
                maxLines: 5,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Enter the Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              _text(
                7,
                "onTap ,onChanged ,onFieldSubmitted,onSaved,onEditingComplete,onTapOutside : ",
              ),
              TextFormField(
                onTap: () {
                  print("on tap");
                },
                onChanged: (val) {
                  print("on submit $val");
                },
                onFieldSubmitted: (v) {
                  print("on submit $v");
                },
                onSaved: (x) {
                  print("on Save $x");
                },
                onEditingComplete: () {
                  print("onEditingComplete");
                },
                onTapOutside: (x) {
                  print("ontap outside");
                },

                decoration: InputDecoration(
                  hintText: "Enter the Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              _text(
                8,
                "enabledBorder : without click textfield it show \n focusedBorder : it means when you click to click then this will show ",
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter the Name",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              _text(8, "Validator: it is use to validate the text field"),

              Form(
                key: _form,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Enter the Name",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "age grater the 0";
                        } else {
                          return null;
                        }
                      },

                      decoration: InputDecoration(
                        hintText: "Enter the age",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_form.currentState!.validate()) {
                    print("Submit");
                  }
                },
                child: Text("submit"),
              ),


            ],
          ),
        ),
      ),
    );
  }

  List<String> list = ['Male', "Female"];
  String select ="Male";
}
