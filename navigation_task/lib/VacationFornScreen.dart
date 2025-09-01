import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'trave_info.dart';

class VacationFornScreen extends StatefulWidget {
  const VacationFornScreen({super.key});

  @override
  State<VacationFornScreen> createState() => _VacationFornScreenState();
}

class _VacationFornScreenState extends State<VacationFornScreen> {
  final TextEditingController _destinationName = TextEditingController();
  final TextEditingController _travelDate = TextEditingController();
  final TextEditingController _notes = TextEditingController();
  FocusNode focusNode = FocusNode();
  FocusNode focusNodemood = FocusNode();
  bool flag = false;
  bool activitiesFlag = false;
  double count = 0;

  List<String> travelMode = [
    "Select Travel Mode",
    "Flight",
    "Train",
    "Car",
    "Cruise",
    "Other",
  ];

  List<Map<String,dynamic>> data =[
    {
      "name":"Beach",
      "flag":false
    },
    {
      "name":"Adventure",
      "flag":false
    },
    {
      "name":"Food",
      "flag":false
    },
    {
      "name":"Sightseeing",
      "flag":false
    }
  ];

  Widget checkList(int index){
    return CheckboxListTile(
      // title: Text("Multiple"),
      title: Text(
        data[index]['name'],
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),

      value: data[index]['flag'],
      onChanged: (val) {
        data[index]['flag'] = !data[index]['flag'];
        print(val);
        setState(() {});
      },
    );
  }

  List<String> stayType = ["Hotel", "Hostel", "Tent"];
  String selectStayType = "Select";

  List<String> mood = ["Select Mood", "Happy", "Sad", "Other"];
  String selectMood = "Select Mood";

  String selecttravelMode = "Select Travel Mode";

  void _showMyDatePicker() async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
      // currentDate: DateTime.now(),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      String date = DateFormat('dd/MM/yyyy').format(picked!);
      print(date);
      _travelDate.text = date;
      setState(() {});
    }
  }

  Widget _textField(
    TextEditingController controller,
    String hint,
    bool required,
  ) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      readOnly: (hint == "Travel date") ? true : false,
      onTap: () {
        if (hint == "Travel date") {
          _showMyDatePicker();
        }
      },
      controller: controller,
      maxLines: hint.contains("Notes") ? 3 : 1,
      decoration: InputDecoration(
        hintText: "Enter the $hint",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  Widget radioButtons(String type) {
    return RadioListTile(
      contentPadding: EdgeInsets.only(right: 1),
      activeColor: Colors.blue,
      value: type,
      groupValue: selectStayType,
      title: Text(type),
      onChanged: (val) {
        selectStayType = val!;
        print(val);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Vacation Form Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: WillPopScope(
        onWillPop: ()async{

          bool result =await  showDialog(context: context, builder:(context){
            return AlertDialog(
              title: Text("Comfirm Exit"),
              content: Text("Do You Want To Close The app?"),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context,false);
                }, child: Text("No")),

                TextButton(onPressed: (){
                  Navigator.pop(context,false);
                }, child: Text("Yes"))
              ],
            );
          });

          return result;

        },

        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                _textField(_destinationName, "Destination Name", true),
        
                (selecttravelMode != "Other")
                    ? DropdownButton(
                        menuWidth: MediaQuery.of(context).size.width,
                        isExpanded: true,
                        value: selecttravelMode,
                        // elevation: 20,
                        items: travelMode
                            .map(
                              (ele) =>
                                  DropdownMenuItem(value: ele, child: Text(ele)),
                            )
                            .toList(),
                        onChanged: (val) {
                          selecttravelMode = val!;
                          if (val == "Other") {
                            focusNode.requestFocus();
                          }
                          setState(() {});
                        },
                      )
                    : TextFormField(
                        // textInputAction: TextInputAction.next,
                        focusNode: focusNode,
                        onFieldSubmitted: (value) {
                          travelMode.add(value);
                          selecttravelMode = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Travel Mode",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
        
                _textField(_travelDate, "Travel date", true),
        
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child:Column(
                    children: [
                      checkList(0),
                      checkList(1),
                      checkList(2),
                      checkList(3),
                    ],
                  )
                ),
        
                Text("Select Number Of Travelers : ${(count * 10).toInt()}"),
                Slider(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  activeColor: Colors.blue,
                  value: count,
                  onChanged: (val) {
                    print(val);
                    count = val;
                    setState(() {});
                  },
                ),
                Text("Select Stay Type"),
                Column(
                  children: [
                    radioButtons(stayType[0]),
                    radioButtons(stayType[1]),
                    radioButtons(stayType[2]),
                  ],
                ),
        
                _textField(_notes, "Notes(optional)", false),
        
                (selectMood != "Other")
                    ? DropdownButton(
                        menuWidth: MediaQuery.of(context).size.width,
                        isExpanded: true,
                        value: mood.contains(selectMood)?selectMood : null,
                        elevation: 1,
        
                        items: mood
                            .map(
                              (ele) =>
                                  DropdownMenuItem(value: ele, child: Text(ele)),
                            )
                            .toList(),
                        onChanged: (val) {
                          selectMood = val!;
                          print(selectMood);
                          if (val == "Other") {
                            focusNodemood.requestFocus();
                          }
                          setState(() {});
                        },
                      )
                    : TextFormField(
                        focusNode: focusNodemood,
                        onFieldSubmitted: (value) {
                          selectMood = value;
                          mood.add(value);
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Mood",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
        
                Row(
                  spacing: 5,
                  children: [
                    SizedBox(
                      width: 25,
                      child: Checkbox(
                        activeColor: Colors.blue,
                        value: flag,
                        onChanged: (val) {
                          flag = !flag;
                          setState(() {});
                        },
                      ),
                    ),
                    Text("Accept Terms and Condition"),
                  ],
                ),
        
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: (flag)
                        ? Colors.blue
                        : const Color.fromARGB(255, 126, 174, 213),
                    fixedSize: Size(MediaQuery.of(context).size.width, 50),
                  ),
                  onPressed: () {
                    String str = "";
                    for(int i=0;i<data.length;i++){
                      if(data[i]['flag']){
                        str += data[i]['name'];
                        str+=",";
                      }
                    }

                    TravelInfo travelInfo = TravelInfo(
                      destName: _destinationName.text,
                      travelMode: selecttravelMode,
                      date: _travelDate.text,
                      activity: str,
                      count: (count * 10).toInt(),
                      stayType: selectStayType,
                      notes: (_notes.text.isEmpty) ? null : _notes.text,
                      mood: selectMood,
                    );
                    if(flag){
                      Navigator.pushNamed(
                        context,
                        "/SummaryScreen",
                        arguments: travelInfo,
                      );
                    }

                  },
                  child: Text(
                    "Plain My Vacation",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
