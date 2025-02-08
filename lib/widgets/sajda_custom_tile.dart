import 'package:flutter/material.dart';
import '../models/sajda.dart';

class SajdaCustomTile extends StatelessWidget {
  final Sajda sajda;

  const SajdaCustomTile({required this.sajda});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Sajda in Surah ${sajda.surahNumber}:${sajda.ayaNumber}"),
      subtitle: Text(sajda.obligatory ? "Obligatory" : "Recommended"),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}