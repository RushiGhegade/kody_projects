

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/framework/repository/orderrepository/ui_order_filter.dart';

// these manage the ui filter apply
final selectUiFilterProvider = StateProvider<UiOrderFilter>((ref){
  return UiOrderFilter.All;
});

