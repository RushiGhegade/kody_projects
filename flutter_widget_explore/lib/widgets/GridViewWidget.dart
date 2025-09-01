import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  Widget _text(int i, String name) {
    return Text("${i}) $name",);
  }

  Widget myWidget(int i){
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
      alignment: Alignment.center,
      child: Text("$i"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView Widget"),
      ),
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _text(1, "GridView(shrinkWrap,reverse,physics,gridDelegate,children) : when we have limited widget that time we use Normal gridview"),
            GridView(
              shrinkWrap: true,
              reverse: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 100,crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
              children: [
                myWidget(1),
                myWidget(2),
                myWidget(3),
              ],
              ),

            _text(2, "GridView.builder : when we have many children that time we this "),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: GridView.builder(
                shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10,mainAxisExtent: 100), itemBuilder:(context,int index){
                    return myWidget(index);
              }),
            ),

            _text(3, "GridView.extends(maxCrossAxisExtent, : creates a scrollable grid with flexible item sizes. it create a fixed sized grid"),

            GridView.extent(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              maxCrossAxisExtent:200,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              children: [
                myWidget(1),
                Container(

                  color: Colors.green,
                ),
                Container(
                  color: Colors.green,
                )
              ],
            ),


            _text(4, "GridView.count(crossAxisCount, : creates a scrollable grid with flexible item sizes. it create a fixed sized grid"),

            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                myWidget(1),
                myWidget(2),
                myWidget(3),
                myWidget(4),
              ]

              ,),

            _text(5, "staggeredGridView"),
                    StaggeredGrid.count(

                      crossAxisCount: 5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: [
                        StaggeredGridTile.count(
                          crossAxisCellCount:    3,
                          mainAxisCellCount: 2,
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.red,
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 2,
                          child: Container(
                            height: 100,
                            width: 200,
                            color: Colors.green,
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 2,
                          child: Container(
                            height: 100,
                            width: 200,
                            color: Colors.pink,
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 2,
                          child: Container(
                            height: 100,
                            width: 200,
                            color: Colors.orange,
                          ),
                        )
      ,
                        StaggeredGridTile.count(
                          mainAxisCellCount: 1,
                          crossAxisCellCount: 2,
                          child: Container(
                            height: 100,
                            width: 200,
                            color: Colors.pink,
                          ),
                        ),

                        StaggeredGridTile.count(
                          mainAxisCellCount: 1,
                          crossAxisCellCount: 2,
                          child: Container(
                            height: 50,
                            width: 200,
                            color: Colors.yellow,
                          ),
                        ),

                        StaggeredGridTile.count(
                          mainAxisCellCount: 1,
                          crossAxisCellCount: 2,
                          child: Container(
                            height: 100,
                            width: 200,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
        // MasonryGridView.count(
        //   shrinkWrap: true,
        //   crossAxisCount: 4,
        //   mainAxisSpacing: 4,
        //   crossAxisSpacing: 4,
        //   itemBuilder: (context,index){
        //     return Container(
        //       height: 100
        //       ,width: 100,
        //       color: Colors.red,
        //       child: ListTile(title: Text("$index"),),
        //     );
        //   },
        // ),


          ],
        ),
      ),
    );
  }
}
