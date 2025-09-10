import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/framework/repository/homerepository/enums/categories.dart';



/// these provider manage the all filter in the homescreen thet we selected
final homeSelectCategoryProvider = ChangeNotifierProvider<MyFilter>((ref){
  return MyFilter();
});


class MyFilter extends ChangeNotifier{

   List<Categories> filterList = [Categories.all];

  // these function clear the filter
  void clearCategory() {
    filterList = [Categories.all];
    notifyListeners();
  }


  // these function remove the all filter
  void removeAll() {
    filterList.removeWhere((ele) => ele == Categories.all);
    notifyListeners();
  }


  // these function add the filter
  void addCategory(Categories categories) {
    removeAll();

    if(!filterList.contains(categories)){
      filterList = [...filterList,categories];
      print("--------------  $filterList ");
    }

    notifyListeners();
  }

  // these function remove the specific filter
  void removeCategory(Categories categories) {
    filterList.removeWhere((ele) => ele.name == categories.name);
    filterList = [...filterList];
    notifyListeners();
  }

}
