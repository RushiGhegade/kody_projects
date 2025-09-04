
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/framework/controller/auth_controller/auth_controllers.dart';
import 'package:shopping_app/ui/profile/gest_user_login_profile.dart';
import 'package:shopping_app/ui/profile/login_user_profile.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    final islogin = ref.watch(getUserCredential);

    return islogin.when(
        data:(data){
          if(data.isLogin){

              return  LoginUserProfile(id: data.id);

          }else{
              return GestUserLoginProfile();
          }
        } ,
        error: (obj,st){
          return CustomTextWidget(text: "$st");
        },
        loading: (){
          return Center(child: CircularProgressIndicator());
        }
    );
  }
}
