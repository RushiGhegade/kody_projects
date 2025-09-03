
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/framework/controller/auth_controller/auth_controllers.dart';
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

    return Padding(padding: EdgeInsets.all(10),
    child:   islogin.when(
        data:(data){
          if(data.isLogin){



          }else{

          }
        } ,
        error: (obj,st){
          return CustomTextWidget(text: "$st");
        },
        loading: (){
          return Center(child: CircularProgressIndicator());
        }
    ),
    );
  }
}
