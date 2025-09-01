
import 'dart:io';
import 'dart:typed_data';
import 'package:hive/hive.dart';
part 'user_information_model.g.dart';

@HiveType(typeId: 1)
class UserInformation{

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String userName;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final Uint8List uint8list;

  const UserInformation({required this.id,required this.userName,required this.uint8list,required this.password});

}