import 'package:riverpod/riverpod.dart';
import 'package:shopping_app/framework/repository/homerepository/enums/categories.dart';



/// these provider manage the all filter in the homescreen thet we selected
final homeSelectCategoryProvider =
    StateNotifierProvider<MyFilter, List<Categories>>((ref) {
      return MyFilter();
    });

class MyFilter extends StateNotifier<List<Categories>> {
  MyFilter() : super([Categories.all]);

  // these function clear the filter
  void clearCategory() {
    state = [Categories.all];
  }

  // these function remove the all filter
  void removeAll() {
    state.removeWhere((ele) => ele == Categories.all);
  }

  // these function add the filter
  void addCategory(Categories categories) {
    removeAll();
    if (!state.contains(categories)) {
      state = [...state, categories];
    }
  }

  // these function remove the specific filter
  void removeCategory(Categories categories) {
    state.removeWhere((ele) => ele.name == categories.name);
    state = [...state];
  }
}
