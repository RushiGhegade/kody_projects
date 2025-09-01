import 'package:flutter/material.dart';

class ListViewwidget extends StatefulWidget {
  const ListViewwidget({super.key});

  @override
  State<ListViewwidget> createState() => _ListViewwidgetState();
}

class _ListViewwidgetState extends State<ListViewwidget> {

  List<String> list = ["One","Two","Three","Four"];

  List<MyClass> myList = [
    MyClass(headerdata: "Header 1", bodydata:"Body 1"),
    MyClass(headerdata: "Header 2", bodydata:"Body 2"),
    MyClass(headerdata: "Header 3", bodydata:"Body 3"),
  ];
  Widget _text(int i, String name) {
    return Text("${i}) $name");
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: Text("ListView widget"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
               Text("List View Widget : it is use when we have small and static widget it having children in children we pass this widgets"),
                ListView(
                  padding: EdgeInsets.all(5),
                  // scrollDirection: Axis.horizontal,
                  // reverse: true,
                  shrinkWrap: true,
                  // physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      margin:EdgeInsets.all(5),
                      color: Colors.red,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      margin:EdgeInsets.all(5),
                      color: Colors.yellow,
                    ),
                  ],
                ),

              Text("ListView Builder : when dynamic data is come that time we use builder it like for loop it run itemCount times"),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // reverse: true,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext context,int index){
                        return Container(

                          margin: EdgeInsets.only(right: 10),
                          height: 50,
                          width: 50,
                          color: Colors.grey,
                          alignment: Alignment.center,
                          child: Text("$index"),
                        );
                 },),
              ),
              //
              Text("ListView Seperator : it use when we have to show somw Widget end like(Divider) it give functionality for that it having one parameter extra separatorBuilder"),
              ListView.separated(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context,int index){
                    return Container(
                      height: 50,
                    width: 50,
                    color: Colors.red,
                      alignment: Alignment.center,
                      child: Text("$index"),
                    );
                  },
                  separatorBuilder: (BuildContext context,int index){
                    return SizedBox(
                      height: 20,
                      child: Divider(),
                    );
                    // return Divider(
                    //   height: 2,
                    // );
                  }
              ),

              Text("ReorderableListView : we can arrange the list using long tap gesture"),
              ReorderableListView(
                shrinkWrap: true,
                children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      key: ValueKey("one"),
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.red,
                    ),
                    // SizedBox(height: 5,),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      key: ValueKey("two"),
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.green,
                    ),
                    // SizedBox(height: 5,),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      key: ValueKey("three"),
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.yellow,
                    ),
                  ],
                  onReorder: (int oldIndex,int newIndex){
                        print(oldIndex);
                        print(newIndex);
                  },
              ),
              Text("ReorderableListView.builder :"),
              ReorderableListView.builder(
                shrinkWrap: true,
              // buildDefaultDragHandles: false,
              //     physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context,int index){
                return ListTile(
                  key: ValueKey(list[index]),
                  title: Text(list[index]),
                );
              },
              itemCount: list.length,
              onReorder: (int oldIndex,int newIndex){
                  try{
                    if(newIndex>oldIndex){
                      newIndex = newIndex-1;
                    }
                    print(oldIndex);
                    print(newIndex);
                    String ele =  list.removeAt(oldIndex);
                    list.insert(newIndex, ele);
                    setState(() {
                    });
                  }catch(w) {
                    print(oldIndex);
                    print(newIndex);
                  }
              }
              ),

              Text("ExpansionPanelList : it allowing users to expand and collapse sections of content within a single view."),
              ExpansionPanelList(
                materialGapSize: 12,
                elevation: 1,
                expansionCallback: (int index,bool isExpansion){
                  myList[index].isExpansion = !myList[index].isExpansion!;
                  setState(() {
                  });
                },
                children: myList.map((ele){
                  return ExpansionPanel(
                    isExpanded: ele.isExpansion!,
                    headerBuilder: (BuildContext context,bool isExpansion){
                      return Text(ele.headerdata!);
                    },
                    body: Text("${ele.bodydata}"),
                  );
                }).toList(),
              ),

              ListTile(
                title: Text("Hello"),
                leading: Container(
                  height: 20,
                  width: 20,
                  color: Colors.yellow,
                ),
                subtitle: Column(
                  children: [
                    Container(
                      height: 10,
                      width: 50,
                      color: Colors.red,
                    ),
                    Container(
                      height: 10,
                      width: 50,
                      color: Colors.yellow,
                    ),
                  ],
                ),
                  trailing: Container(
                    height: 10,
                    width: 10,
                    color: Colors.orange,
                  ),
                // isThreeLine: true,
                dense: false,
              ),

              SizedBox(
                height: 20,
              ),

              ListView(
                shrinkWrap: true,
                children:List.generate(5, (index){
                  print("Listview indez $index");
                  return Container(
                  height: 50,
                  margin: EdgeInsets.only(bottom: 10),
                  color: Colors.yellow,
                );}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class MyClass{

  bool? isExpansion;
  String? headerdata;
  String? bodydata;

  MyClass({this.isExpansion=false,required this.headerdata,required this.bodydata});

}