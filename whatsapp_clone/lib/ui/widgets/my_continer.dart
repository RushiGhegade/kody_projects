import 'package:flutter/material.dart';

class MyContiner extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final Color color;
  final double left;
  final double right;
  final String? data;

  const MyContiner({
    super.key,
    required this.text,
    required this.color,
    this.height,
    this.width,
    required this.left,
    required this.right,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: left, right: right, bottom: 10),
      padding: EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 1),
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 68, 78, 83),
            ),
          ),

          RichText(
            text: TextSpan(
              text: data,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 68, 78, 83),
              ),
              children: [
                if (left == 50) WidgetSpan(child: SizedBox(width: 6)),
                if (left == 50)
                  WidgetSpan(
                    child: Icon(
                      Icons.done_all_outlined,
                      size: 17,
                      color: const Color.fromARGB(255, 2, 141, 255),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
