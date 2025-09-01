
import 'package:flutter/material.dart';

class WrapWidget extends StatelessWidget {
  const WrapWidget({super.key});

  Widget _text(int i, String name) {
    return Text("${i}) $name",);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wrap Widget"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _text(1, "Direction : ByDefault direction is horizontal it arrange it child widget in horizontal way"),
        
              Text("Direction : Axis.Horizontal"),
              Wrap(
                direction: Axis.horizontal,
                children: [
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.red,
                      ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  )
                ],
              )
        
              ,Text("Direction : Axis.Vertical"),
              Wrap(
                direction: Axis.vertical,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  )
                ],
              )
        
        ,
              _text(2, "spacing : give the space between children"),
        
        
              Wrap(
                spacing: 20,
                direction: Axis.horizontal,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  )
                ],
              )
        
        
        
              ,_text(3, "runSpacing : when runtime widget get next line then it give space between 1st and 2nd line"),
        
        
              Wrap(
                spacing: 20,
                runSpacing: 20,
                direction: Axis.horizontal,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  )
                ],
              )

              ,_text(4," WrapAlignment.start,center,end,spaceBetween : it aligin runtime widget that come next line"),
              Wrap(

                spacing: 20,
                verticalDirection: VerticalDirection.up,
                runSpacing: 20,
                direction: Axis.horizontal,
                alignment:WrapAlignment.center,
                // crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  )
                ],
              )

              ,_text(4," verticalDirection: VerticalDirection.up : it  means child widget start showing from down it means last show 1 and 1st show last same horizontal direction"),


              Wrap(
                verticalDirection: VerticalDirection.up,
                spacing: 20,

                runSpacing: 20,
                direction: Axis.vertical,
                // alignment:WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),

                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
