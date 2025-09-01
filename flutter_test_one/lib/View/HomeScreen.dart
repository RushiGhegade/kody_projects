import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _text(String str) {
    return Text(
      str,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    );
  }

  double val = 0.7;

  Widget _radioButton(String value) {
    return SizedBox(
      height: 20,
      width: 20,
      child: Radio(
        value: value,
        activeColor: Colors.blue,
        groupValue: select,
        onChanged: (s) {
          select = s!;
          setState(() {});
        },
      ),
    );
  }

  Widget _names(String name) {
    return Container(
      height: 40,
      width: 90,

      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      child: Text(name),
    );
  }

  List<Map<String, dynamic>> info = [
    {
      "icon": Icon(Icons.shopping_bag),
      "name": "john@example.com",
      "email": "Primary Email",
    },
    {
      "icon": Icon(Icons.mobile_friendly),
      "name": "+1234 567 890",
      "email": "Mobile Phone",
    },

    {"icon": Icon(Icons.home), "name": "New Your USA", "email": "Home Address"},
  ];

  List<Map<String, dynamic>> dummy = [
    {"icon": Icon(Icons.home, color: Colors.pink), "name": "Home"},
    {"icon": Icon(Icons.search, color: Colors.white), "name": "Search"},
    {"icon": Icon(Icons.favorite, color: Colors.red), "name": "Favorite"},
    {"icon": Icon(Icons.person), "name": "Profile"},
  ];

  bool flag = true;

  Widget _rating() {
    return Icon(Icons.star, color: Colors.orange, size: 28);
  }

  Widget _textField(String prompt) {
    return TextField(
      decoration: InputDecoration(
        hintText: prompt,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  List<Map<String,String>> map = [
    {
      "name":"Completed flutter cource",
      "hour":"2H"
    },
    {
      "name":"Updated Profile Picture",
      "hour":"3H"
    },
    {
      "name":"Posted new Project",
      "hour":"4H"
    },
  ];



  Widget _widgetDemo(String name,String time){
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.circle,color: Colors.blue,),
          Spacer(),
          Text(name),
          Spacer(flex: 6,),
          Text(time),
        ],
      ),
    );
  }

  bool checkFlag = true;
  String select = "Red";
  List<String> list = ["Red", "Green", "Blue"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.arrow_back, color: Colors.white),
        title: GestureDetector(
          onTap: (){
            print("Button click");
          },
          child: Text(
            "Flutter Widget Demo",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: Colors.white),
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Welcome To Flutter!",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        "Build beautiful App",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                _textField("Enter Your Email Address"),

                SizedBox(height: 20),
                _textField("password"),
                SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 5,),
                    SizedBox(
                      width: 10,
                      height: 10,
                      child: Checkbox(
                        activeColor: Colors.blue,
                        value: checkFlag,
                        onChanged: (v) {
                          checkFlag = !checkFlag;
                          setState(() {

                          });
                        },
                      ),
                    ),
                    SizedBox(width: 10,),
                    _text("Remember me"),
                   Spacer(),
                    _text("Enable Notifications"),

                    SizedBox(width: 10),

                    SizedBox(
                      height: 30,
                      width: 30,
                      // padding: EdgeInsets.all(4),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Switch(
                          // splashRadius: 2,
                          activeColor: Colors.blue,
                          inactiveTrackColor: Colors.blue,
                          value: flag,
                          onChanged: (val) {
                            flag = !flag;
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                _text("Select Your Favorite Color:"),
                SizedBox(height: 5,),
                Row(
                  spacing: 5,
                  children: [
                    _radioButton(list[0]),
                    _text("Red"),
                    SizedBox(width: 10,),
                    _radioButton(list[1]),
                    _text("Green"),
                    SizedBox(width: 10,),
                    _radioButton(list[2]),
                    _text("Blue"),
                  ],
                ),

                SizedBox(height: 10,),

                _text("Experiance Level : ${(val*100).round()}%"),
                SizedBox(height: 7),

                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape:SliderComponentShape.noThumb
                  ),
                  child: Slider(
                    padding: EdgeInsets.all(1),
                    value: val, onChanged: (v){
                    print(val);
                    val=v;
                    setState(() {});
                    },activeColor: Colors.blue,),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.blue,
                    fixedSize: Size(MediaQuery.of(context).size.width, 50),
                  ),
                  onPressed: () {},
                  child: Text("Login", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 10),
                RichText(text:TextSpan(text:"Don't have an account? " ,style:TextStyle(color: Colors.blue),children: [
                  TextSpan(text: "sign up"),
                ] ) ),
                SizedBox(height: 20),


                Center(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap:(){
                          print("Select the Image");
                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                          ),
                          child: Icon(Icons.person, size: 41),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Johan Doe",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Flutter Developer",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _rating(),
                          _rating(),
                          _rating(),
                          _rating(),
                          SizedBox(width: 10),
                          Text(
                            "4.5 Rating",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          fixedSize: Size(160, 50),
                          side: BorderSide(color: Colors.blue, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "View Profile",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: info.length,
                  itemBuilder: (context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: info[index]['icon'],
                          title: Text(info[index]['name']),
                          subtitle: Text(info[index]['email']),
                        ),
                        Divider()
                      ],
                    );
                  },
                ),
                Text(
                  "Skill and Interest",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 33,
                  runSpacing: 10,
                  children: [
                    _names("Flutter"),
                    _names("Dart"),
                    _names("Mobile"),
                    _names("Ui/UX"),
                    _names("API"),
                    _names("Firebase"),
                    _names("State mgmt"),
                    _names("Testing"),
                  ],
                ),
                SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dummy.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          dummy[index]['icon'],
                          Text(dummy[index]['name']),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                Text(
                  "Recent Activity",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _widgetDemo( map[0]['name']!, map[0]['hour']!),
                    _widgetDemo( map[1]['name']!, map[1]['hour']!),
                    _widgetDemo( map[2]['name']!, map[2]['hour']!)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
    );
  }
}
