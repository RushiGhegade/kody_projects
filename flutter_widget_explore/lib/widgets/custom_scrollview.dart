
import 'package:flutter/material.dart';

class CustomScreelViewWidget extends StatefulWidget {
  const CustomScreelViewWidget({super.key});

  @override
  State<CustomScreelViewWidget> createState() => _CustomScreelViewWidgetState();
}

class _CustomScreelViewWidgetState extends State<CustomScreelViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          // SliverAppBar(
          //   floating: true,
          //   pinned: true,
          //   stretch: true,
          //   stretchTriggerOffset: 100,
          //   expandedHeight: 200,
          //   title: Text("Sliver app bar"),
          //   flexibleSpace:FlexibleSpaceBar(
          //     stretchModes: [StretchMode.zoomBackground],
          //     background: Container(
          //       height: 400,
          //       width: MediaQuery.of(context).size.width,
          //       color: Colors.orange,
          //       child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTaYVG_iCjqtC3bXEKrVyw1a1VUNpkA7fViw&s",fit: BoxFit.cover,),
          //     ),
          //   ),
          // ),

          // SliverToBoxAdapter(
          //   child:ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: 50,
          //     itemBuilder: (BuildContext context,int index){
          //     return Container(
          //       margin: EdgeInsets.only(bottom: 10),
          //       height: 50,
          //       color: Colors.blueAccent,
          //       child: Text("$index"),
          //     );
          //   }),
          // ),
          SliverPersistentHeader(delegate:MyHeaderDelegate()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
            childCount: 200,(BuildContext context,int index){
              print("SliverChildBuilderDelegate $index");
            return Container(
              height: 50,
              color: Colors.blue,
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              child: Text("$index"),
            );
          },
            ),
          ),

          // SliverGrid(delegate: SliverChildBuilderDelegate((context,index){
          //   return Container(
          //     color: Colors.blue,
          //   );
          // },
          // ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 10))


        ],
      ),
    );
  }
}


class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: Text(
        'Persistent Header',
        style: TextStyle(fontSize: 24.0 * (1 - shrinkOffset / maxExtent)), // Example: text scales with shrinkOffset
      ),
    );
  }

  @override
  double get maxExtent => 300.0; // Max height of the header

  @override
  double get minExtent => 60.0; // Min height of the header

  @override
  bool shouldRebuild(MyHeaderDelegate oldDelegate) {
    return false; // Rebuild only if necessary, e.g., if a property changes
  }
}


