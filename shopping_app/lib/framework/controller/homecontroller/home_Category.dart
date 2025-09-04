
import 'package:riverpod/riverpod.dart';
import 'package:shopping_app/framework/repository/homerepository/enums/categories.dart';


final homeSelectCategoryProvider = StateNotifierProvider<MyFilter,List<Categories>>((ref){

  return MyFilter();

});


class MyFilter extends StateNotifier<List<Categories>>{

  MyFilter():super([]);

  void clearCategory(){
    state = [Categories.all];
  }

  void removeAll(){
    state.removeWhere( (ele) => ele == Categories.all );

  }


  void addCategory(Categories categories){

    removeAll();
    if(!state.contains(categories)){
      state = [...state,categories];
    }

  }

  void removeCategory(Categories categories){
    state.removeWhere( (ele) => ele.name==categories.name );
    state = [...state];
  }

}

