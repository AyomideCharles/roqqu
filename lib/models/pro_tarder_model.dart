import 'package:flutter/material.dart';

class TraderModel {
  final String name;
  final Color avatarColor;

  TraderModel({
    required this.name,
    required this.avatarColor,
  });

  String get initials {
    List<String> parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    } else if (parts.isNotEmpty && parts[0].isNotEmpty) {
      return parts[0][0].toUpperCase();
    }
    return '';
  }
}

final List<TraderModel> dummyTraders = [
  TraderModel(name: 'Jaykay Kayode', avatarColor: const Color(0xFF5283FF)),
  TraderModel(name: 'Okobi Laura', avatarColor: const Color(0xFFF79009)),
  TraderModel(name: 'Tosin Lasisi', avatarColor: const Color(0xFF85D1F0)),
];
