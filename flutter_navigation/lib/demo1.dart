import 'package:flutter/material.dart';
import 'package:flutter_navigation/demo2.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyWidget1()),
        );
      },
      child: Scaffold(
        body: Hero(
          flightShuttleBuilder:
              (
                BuildContext flightContext,
                Animation<double> animation,
                HeroFlightDirection flightDirection,
                BuildContext fromHeroContext,
                BuildContext toHeroContext,
              ) {
                return RotationTransition(
                  turns: animation,
                  child: Material(
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                  ),
                );
              },
          tag: "MyImage",
          child: Center(
            child: Column(
              spacing: 10,
              children: [
                Text("Hello"),
                Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4fCuuuY332MuV108hXvUUgdvA1qKIOod4tg&s",
                  height: 100,
                  width: 100,
                ),
                Container(height: 100, width: 100, color: Colors.amber),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
