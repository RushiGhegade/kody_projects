import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteTeamProvider = StateProvider<AppData>((ref) {
  return AppData(favoriteTeamName: "", isdark: false);
});

class AppData {
  final String favoriteTeamName;
  final bool isdark;

  const AppData({required this.favoriteTeamName, required this.isdark});

  AppData copyWith({String? favoriteTeamName, bool? isdark}) {
    return AppData(
      favoriteTeamName: favoriteTeamName ?? this.favoriteTeamName,
      isdark: isdark ?? this.isdark,
    );
  }
}
