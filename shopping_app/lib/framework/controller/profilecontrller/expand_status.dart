import 'package:flutter_riverpod/flutter_riverpod.dart';

// these manage the expand status of the ui
final expandStatus = StateProvider((ref) {
  return true;
});
