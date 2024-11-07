import 'package:flutter/material.dart';

class AssessmentRecord {
  final DateTime timestamp;
  final Map<String, bool> dangerChecks;
  final Map<String, bool> responseChecks;
  final Map<String, bool> airwayChecks;
  final Map<String, bool> catastrophicBleedChecks;
  final String? tourniquetTime;
  final String? breathingRate;
  final Map<String, bool> circulationChecks;
  final Map<String, Map<String, bool>> damageChecks;
  final Map<String, Map<String, dynamic>> environmentChecks;

  AssessmentRecord({
    required this.timestamp,
    required this.dangerChecks,
    required this.responseChecks,
    required this.airwayChecks,
    required this.catastrophicBleedChecks,
    this.tourniquetTime,
    required this.breathingRate,
    required this.circulationChecks,
    required this.damageChecks,
    required this.environmentChecks,
  });
} 