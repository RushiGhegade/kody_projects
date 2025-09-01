import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples/freamwork/controller/screen_controller.dart';
import 'package:riverpod_examples/freamwork/model/screens_model.dart';

import '../../../freamwork/controller/statenotifierprovider_controller.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<ScreensModel>? getScreens;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getScreens = ref.read(screens);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Riverpod Types")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: getScreens!.length,
          itemBuilder: (context, index) {
            ScreensModel screensModel = getScreens![index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0.1,
                  ),
                ],
              ),
              child: ListTile(
                tileColor: Colors.white,
                title: Text(screensModel.name),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, screensModel.name);
                  },
                  child: Icon(Icons.arrow_forward_ios_sharp),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
