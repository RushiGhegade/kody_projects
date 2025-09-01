import 'package:riverpod/riverpod.dart';

final getStreamData = StreamProvider((elel) async* {
  int hour = 1;
  int second = 1;

  List<int> list = [];

  while (true) {
    await Future.delayed(Duration(seconds: 1));

    if (second == 60) {
      second = 0;
      hour++;
    }
    second++;
    yield [hour, second];
  }
});
