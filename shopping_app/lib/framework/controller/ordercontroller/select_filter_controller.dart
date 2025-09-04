

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/framework/repository/orderrepository/ui_order_filter.dart';

final selectUiFilterProvider = StateProvider<UiOrderFilter>((ref){
  return UiOrderFilter.All;
});

