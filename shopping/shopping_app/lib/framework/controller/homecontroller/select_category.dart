

import 'package:flutter_riverpod/flutter_riverpod.dart';

// thee manage the navigation index
final selectedIndexProvider = StateProvider((ref){
  return 0;
}) ;