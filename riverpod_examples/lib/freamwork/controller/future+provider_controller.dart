import 'package:flutter_riverpod/flutter_riverpod.dart';

final getDate = FutureProvider<String>((ref) async {
  await Future.delayed(Duration(seconds: 2), () {});
  // throw "ffknvn";
  return "Data Fetch";
});
