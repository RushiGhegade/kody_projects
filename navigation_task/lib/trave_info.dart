class TravelInfo {
  String? destName;
  String? travelMode;
  String? date;
  String? activity;
  int? count;
  String? stayType;
  String? notes;
  String? mood;

  TravelInfo({
    required this.destName,
    required this.travelMode,
    required this.date,
    required this.activity,
    required this.count,
    required this.stayType,
    this.notes,
    required this.mood,
  });
}
