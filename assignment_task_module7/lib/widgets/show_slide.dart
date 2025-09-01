import 'package:flutter/material.dart';

import '../assetsFolder/getcolors.dart';

class ShowSlide extends StatelessWidget {
  final int myIndex;
  final int length;
  const ShowSlide({super.key, required this.myIndex, required this.length});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 3.2),
      child: SizedBox(
        height: 5,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: length,
          itemBuilder: (BuildContext context, int index1) {
            return Container(
              height: 5,
              width: 40,
              decoration: BoxDecoration(
                color: (myIndex == index1)
                    ? Getcolors.blue
                    : Getcolors.boxcolor1,
                borderRadius: (index1 == 0)
                    ? BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomLeft: Radius.circular(6),
                      )
                    : (index1 == length - 1)
                    ? BorderRadius.only(
                        topRight: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      )
                    : BorderRadius.zero,
              ),
            );
          },
        ),
      ),
    );
  }
}
