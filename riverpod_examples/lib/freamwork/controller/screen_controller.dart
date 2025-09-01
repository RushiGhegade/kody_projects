import 'package:riverpod/riverpod.dart';
import 'package:riverpod_examples/freamwork/model/screens_model.dart';
import 'package:riverpod_examples/ui/home/mobile/screens/ChangeNotifierProviderScreen.dart';
import 'package:riverpod_examples/ui/home/mobile/screens/FutureProviderScreen.dart';
import 'package:riverpod_examples/ui/home/mobile/screens/StateNotifierProviderScreen.dart';
import 'package:riverpod_examples/ui/home/mobile/screens/StateProviderScreen.dart';
import 'package:riverpod_examples/ui/home/mobile/screens/StreamProviderScreen.dart';
import 'package:riverpod_examples/ui/home/mobile/screens/simple_provider.dart';

final screens = Provider<List<ScreensModel>>((ref) {
  return [
    ScreensModel(name: "Provider", screen: SimpleProvider()),
    ScreensModel(name: "StateProvider", screen: Stateproviderscreen()),
    ScreensModel(
      name: "StateNotifierProvider",
      screen: Statenotifierproviderscreen(),
    ),
    ScreensModel(name: "FutureProvider", screen: Futureproviderscreen()),
    ScreensModel(name: "StreamProvider", screen: Streamproviderscreen()),
    ScreensModel(
      name: "ChangeNotifierProvider",
      screen: Changenotifierproviderscreen(),
    ),
  ];
});
