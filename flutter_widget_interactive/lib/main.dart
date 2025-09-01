import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  final TextEditingController _userNameController = TextEditingController();
  bool flag = false;
  int count = 0;
  //assets/p3.jpg
  //assets/p4.jpg
  // assets/p5.jpg
  // assets/p6.jpg



  List<Map<String, String>> user = [
    {
      "userName": "Rushi",
      "location": "Gujrat",
      "message": "Happy life",
      "image": "assets/p6.jpg",
    },
    {
      "userName": "Bushan",
      "location": "Gujrat",
      "message": "Happy life",
      "image": "assets/p3.jpg",
    },
    {
      "userName": "Kunal",
      "location": "Gujrat",
      "message": "Happy life",
      "image": "assets/p4.jpg",
    },
    {
      "userName": "Kody",
      "location": "Gujrat",
      "message": "Happy life",
      "image": "assets/p5.jpg",
    },
    {
      "userName": "Kody",
      "location": "Gujrat",
      "message": "Happy life",
      "image": "assets/p6.jpg",
    },
  ];

  int i = 0;

  List<FocusNode> list = [FocusNode(),FocusNode(),FocusNode(),FocusNode()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Profile")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),

              TextField(
               focusNode:list[0],
                controller: _userNameController,
                textInputAction:TextInputAction.go,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Enter the Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSubmitted: (value) {
                  print("Submitted");
                  // list[0].unfocus();
                  FocusScope.of(context).unfocus();
                  FocusScope.of(context).requestFocus(list[3]);
                  // list[3].requestFocus();
                  setState(() {
                    
                  });
                },
              ),


              // A TextField that lets 	the user input their nam



              //A Text widget that dynamically displays: “Welcome, [username]!      ”
              if (_userNameController.text.isNotEmpty)
                Text(
                  "Welcome, ${_userNameController.text}!",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),

              SizedBox(height: 15),
              // A Row with 3 IconButtons representing actions (like, share, comment). Each should show a different print statement.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      print("Like");
                    },
                    icon: Icon(Icons.thumb_up, size: 31, color: Colors.blue),
                  ),
                  IconButton(
                    onPressed: () {
                      print("Share");
                    },
                    icon: Icon(
                      Icons.share_rounded,
                      size: 31,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      print("comment");
                    },
                    icon: Icon(Icons.comment, size: 31, color: Colors.blue),
                  ),
                ],
              ),
              //     A GestureDetector wrapping a Container that changes its color every time it is tapped.
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      i = i+40;

                    });
                  },
                  child: Container(
                    height: 100,
                    width: 150,
                    color: Color.fromRGBO((i+10)%255, (i+9)%255, (i+8)%255, 1),
                  ),
                ),
              ),

              // Increment counter logic
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                      },
                      child: Text("click"),
                    ),
                    SizedBox(height: 10),
                    Text("You clicked $count times"),
                    SizedBox(height: 20),
                    showDummyUser(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showDummyUser() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: user.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(user[index]['image']!, fit: BoxFit.cover),
          ),
          title: Text("Name : ${user[index]['userName']!}"),
          subtitle: Text("location : ${user[index]['location']!}"),
        );
      },
    );
  }
}
