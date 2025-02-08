class Sajda {
  final int surahNumber;
  final int ayaNumber;
  final bool recommended;
  final bool obligatory;

  Sajda({
    required this.surahNumber,
    required this.ayaNumber,
    required this.recommended,
    required this.obligatory,
  });

  factory Sajda.fromJson(Map<String, dynamic> json) {
    return Sajda(
      surahNumber: json['surahNumber'],
      ayaNumber: json['ayaNumber'],
      recommended: json['recommended'],
      obligatory: json['obligatory'],
    );
  }
}