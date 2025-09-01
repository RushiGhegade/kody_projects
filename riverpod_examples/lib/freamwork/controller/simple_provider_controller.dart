import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples/freamwork/enums/ipl_teams.dart';

final getIplTeams = Provider<List<IplTeam>>((ref) {
  return IPLTeamsNames.values.map((ele) {
    return IplTeam(
      teamsName: ele,
      image: Icons.sports_cricket,
      dis: "BEST IPL TEAM",
    );
  }).toList();
});

class IplTeam {
  IPLTeamsNames teamsName;
  IconData image;
  String dis;
  IplTeam({required this.teamsName, required this.image, required this.dis});
}
