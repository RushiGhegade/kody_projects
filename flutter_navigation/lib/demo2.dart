import 'package:flutter/material.dart';

class MyWidget1 extends StatelessWidget {
  const MyWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
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
          tag: "dd",
          child: Center(
            child: Column(
              spacing: 10,
              children: [
                Container(height: 100, width: 100, color: Colors.amber),

                Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4fCuuuY332MuV108hXvUUgdvA1qKIOod4tg&s",
                  height: 100,
                  width: 100,
                ),
                Text("Hello"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
