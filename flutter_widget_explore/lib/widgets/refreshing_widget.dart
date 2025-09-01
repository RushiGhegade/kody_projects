
import 'package:flutter/material.dart';

class RefreshingWidget extends StatefulWidget {
  const RefreshingWidget({super.key});

  @override
  State<RefreshingWidget> createState() => _RefreshingWidgetState();
}

class _RefreshingWidgetState extends State<RefreshingWidget> {
  final ScrollController _controller = ScrollController();
  List<int> myList = [1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9];
  int count = 0;
  bool loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener((){
      if(_controller.offset == _controller.position.maxScrollExtent){
        loadData();
      }
    });
  }

  void loadData(){
    if(loading)return;
    print("Data loading");
    setState(() {
      loading =true;
    });
    myList.addAll(List.generate(5,(index)=>index));
    print("Data loaded");
    setState(() {
      loading =false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text("App ABar"),
        ),
        body: RefreshIndicator(
      
          onRefresh: ()async{
           await  Future.delayed(Duration(seconds: 2),(){
             print("Update data ");
            });
           // myList.clear();
           for(int i=0;i<count;i++){
             myList.add(i*count);
             count++;
             setState(() {
             });
           }
      
          },
          child:ListView.builder(
              controller: _controller,
              shrinkWrap: true,
              itemCount: myList.length,
              itemBuilder: (context,int index){
                return Container(
                  height: 50,
                  color: Colors.red,
                  margin: EdgeInsets.only(bottom: 10),
                  alignment: Alignment.center,
                  child: Text("${myList[index]}"),
                );
              },
          ),
        ),
      
      ),
    );
  }
}
