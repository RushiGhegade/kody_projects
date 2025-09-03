
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginUserProfile extends ConsumerStatefulWidget {

  final String id;

  const LoginUserProfile({super.key,required this.id});

  @override
  ConsumerState<LoginUserProfile> createState() => _LoginUserProfileState();
}

class _LoginUserProfileState extends ConsumerState<LoginUserProfile> {
  @override
  Widget build(BuildContext context) {



    return const Placeholder();
  }
}
