
import 'package:flutter/material.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {


  final TextEditingController _controller = TextEditingController();
  List<String> allItem = ["Rushi","Rutik","Ram","Ashish","Abhishekh","Banana","greps","mango"];
  List<String> findItem = [];

  void findSearchItem(String find){
    findItem.clear();
    setState(() {
      findItem = allItem.where((ele)=> ele.toLowerCase().contains(find.toLowerCase())).toList();
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findItem = allItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello"),),
      body:SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
          TextField(
            controller:_controller,
            onChanged: (val){
              findSearchItem(val);
            },
          ),
            
            
            ListView.builder(
              shrinkWrap: true,
              itemCount: findItem.length,
              itemBuilder:(BuildContext context,int index){
                  return ListTile(
                    title: Text("${findItem[index]}"),
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}
