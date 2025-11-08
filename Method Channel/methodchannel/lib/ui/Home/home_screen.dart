import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:methodchannel/ui/utils/base_Widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with BaseStatefulWidget {
  static const platform = MethodChannel('batteryChannel');

  String deviceBateryLevel = "Not Get";

  ///  method to call the native code
  void getBateryLevel() async {
    try {
      int? result = await platform.invokeMethod<int>('getBatteryLevel');
      deviceBateryLevel = "Device Batery : $result%";
      setState(() {});
    } on PlatformException catch (e) {
      print("Exception : $e");
    }
  }

  /// open the camera
  void openCamera() async {
    try {
      final result = await platform.invokeMethod('openCamera');
      print("Camera result: $result");
    } on PlatformException catch (e) {
      print("Exception :$e");
    }
  }

  @override
  Widget buildPage(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 50,
        children: [
          Text(deviceBateryLevel),
          ElevatedButton(
            onPressed: () {
              getBateryLevel();
            },
            child: Text("Get Batery"),
          ),

          ElevatedButton(
            onPressed: () {
              openCamera();
            },
            child: Text("Open Camera"),
          ),
        ],
      ),
    );
  }
}
