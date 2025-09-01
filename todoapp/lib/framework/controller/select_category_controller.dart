import 'package:riverpod/riverpod.dart';
import 'package:todoapp/framework/enums/categories.dart';
import 'package:todoapp/framework/enums/select_mode.dart';

final selectCategory = StateProvider<Categories>((ref){
  return Categories.All;
});

final isDark = StateProvider<SelectDarkMode>((ref){
  return SelectDarkMode.Light;
});
