
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final getHiveDataController = StateNotifierProvider<HiveData,List<String>>((ref){

  return HiveData();

});

class HiveData extends StateNotifier<List<String>>{

  HiveData() : super([]);


}


