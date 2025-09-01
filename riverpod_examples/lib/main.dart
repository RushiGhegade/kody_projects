import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples/freamwork/controller/state_provider_controller.dart';
import 'package:riverpod_examples/ui/home/mobile/home_Screen.dart';
import 'package:riverpod_examples/ui/home/mobile/screens/ChangeNotifierProviderScreen.dart';
import 'package:riverpod_examples/ui/home/mobile/screens/FutureProviderScreen.dart';
import 'package:riverpod_examples/ui/home/mobile/screens/StateNotifierProviderScreen.dart';
import 'package:riverpod_examples/ui/home/mobile/screens/StateProviderScreen.dart';
import 'package:riverpod_examples/ui/home/mobile/screens/StreamProviderScreen.dart';
import 'package:riverpod_examples/ui/home/mobile/screens/simple_provider.dart';
import 'package:riverpod_examples/ui/utils/theme/appbar_them.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: Screen1());
  }
}

class Screen1 extends ConsumerWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getTheme = ref.watch(favoriteTeamProvider);
    return ProviderScope(
      child: MaterialApp(
        themeMode: (getTheme.isdark) ? ThemeMode.dark : ThemeMode.light,
        theme: AppbarTheme.appBarThemelight(),
        darkTheme: AppbarTheme.appBarThemedark(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          'Provider': (context) => SimpleProvider(),
          'StateProvider': (context) => Stateproviderscreen(),
          'StateNotifierProvider': (context) => Statenotifierproviderscreen(),
          'FutureProvider': (context) => Futureproviderscreen(),
          'StreamProvider': (context) => Streamproviderscreen(),
          'ChangeNotifierProvider': (context) => Changenotifierproviderscreen(),
        },
      ),
    );
  }
}
