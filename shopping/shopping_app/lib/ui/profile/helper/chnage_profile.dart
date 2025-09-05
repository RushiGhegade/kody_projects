
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/repository/auth_repository/model/user_info_model.dart';
import 'package:shopping_app/framework/utils/local_database_hive.dart';
import 'dart:typed_data';

import '../../../framework/controller/auth_controller/picimages.dart';
import '../../auth/helper/action_button.dart';
import '../../utils/theme/app_color.dart';
import '../../utils/widgets/custom_Icon.dart';
import '../../utils/widgets/custom_sizebox.dart';
import '../../utils/widgets/custom_text_widget.dart';

///  these help to change the profile of the user
///  in profile screen
class ChangeProfile extends ConsumerStatefulWidget {

  final String id;

  const ChangeProfile({super.key,required this.id});

  @override
  ConsumerState<ChangeProfile> createState() => _ChangeProfileState();
}

class _ChangeProfileState extends ConsumerState<ChangeProfile> {

  Uint8List? file;

  @override
  Widget build(BuildContext context) {
     // var userInfo = ref.watch(getUserData(widget.id));
    return  SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,

        children: [
          Center(
            child: Column(
              spacing: 9,
              children: [
                GestureDetector(
                  onTap: () async {
                    print("Function Call");
                    // file = await (await PicImages.pickImage()).readAsBytes();
                    file = await (await PicImages.pickImage())!.readAsBytes();
                    setState(() {});
                  },
                  child: Container(
                    height: 130.spMin,
                    width: 130.spMin,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.textColor.withOpacity(0.2),
                    ),
                    child: (file != null)
                        ? Image.memory(file!, fit: BoxFit.cover)
                        : CustomIcon(
                      iconData: Icons.person,
                      color: AppColor.textColor,
                    ),
                  ),
                ),
                if (file == null)
                  CustomTextWidget(text: "Select Profile Image"),
              ],
            ),
          ),

          ActionButton(text: "Submit", callback: (){


             LocalDatabaseHive.changeImage(widget.id, file!);

             // userInfo = ref.read(getUserData(widget.id) );
             Navigator.pop(context);


          }),
          CustomSizeBox.height20,
        ],
      ),
    );

  }
}
