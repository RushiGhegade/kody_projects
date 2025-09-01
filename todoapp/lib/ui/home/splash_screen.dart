import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/framework/controller/task_details_controller.dart';
import 'package:todoapp/ui/home/helper/check_screen_layout.dart';
import 'package:todoapp/ui/home/mobile/screen/home_screen_mobile.dart';
import 'package:todoapp/ui/home/tablet/screen/home_screen_tablet.dart';
import 'package:todoapp/ui/home/web/screen/home_screen_web.dart';
import 'package:todoapp/ui/utils/theme/app_images.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      ref.read(getTaskDetails.notifier).fetchLocalData();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return CheckScreenLayout(
              mobile: HomeScreenMobile(),
              web: HomeScreenWeb(),
              tablet: HomeScreenTablet(),
            ).getLayout();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 150.h,
          width: 150.w,
          child: Image.asset(AppImages.splashScreenImage, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
