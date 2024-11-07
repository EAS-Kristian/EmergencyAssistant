import 'package:flutter/material.dart';
import 'assessment_record.dart';

class AssessmentProgress {
  Map<String, bool> dangerChecks = {
    'Safe': false,
    'PPE': false,
  };

  Map<String, bool> airwayChecks = {
    'Clear': false,
    'HeadTilt': false,
    'JawThrust': false,
  };

  Map<String, bool> responseChecks = {
    'Alert and Responsive': false,
    'Responds to Voice': false,
    'Responds to Pain': false,
    'Unresponsive': false,
  };

  Map<String, bool> catastrophicBleedChecks = {
    'Pressure': false,
    'Pack': false,
    'Tourniquet': false,
  };
  String? tourniquetTime;

  String? breathingRate;

  Map<String, bool> circulationChecks = {
    'Head/Neck': false,
    'Chest': false,
    'Abdomen': false,
    'Pelvis': false,
    'Legs': false,
    'Arms': false,
  };

  Map<String, Map<String, bool>> damageChecks = {
    'Head/Neck': {
      'Pain': false,
      'Deformity': false,
      'Swelling': false,
    },
    'Chest': {
      'Pain': false,
      'Deformity': false,
      'Bruising': false,
    },
    'Abdomen': {
      'Pain': false,
      'Rigid': false,
      'Distended': false,
    },
    'Pelvis': {
      'Pain': false,
      'Unstable': false,
      'Deformity': false,
    },
    'Legs': {
      'Pain': false,
      'Deformity': false,
      'Movement': false,
    },
    'Arms': {
      'Pain': false,
      'Deformity': false,
      'Movement': false,
    },
  };

  Map<String, Map<String, dynamic>> environmentChecks = {
    'Ground Mat': {
      'used': false,
      'description': 'Insulation from cold ground',
      'icon': Icons.layers,
    },
    'Blizzard Blanket': {
      'used': false,
      'description': 'Protection from elements',
      'icon': Icons.ac_unit,
    },
    'Shelter': {
      'used': false,
      'description': 'Protection from weather',
      'icon': Icons.house,
    },
    'Heat Packs': {
      'used': false,
      'count': 0,
      'description': 'Active warming',
      'icon': Icons.whatshot,
    },
  };

  AssessmentRecord toRecord() {
    return AssessmentRecord(
      timestamp: DateTime.now(),
      dangerChecks: dangerChecks,
      responseChecks: responseChecks,
      airwayChecks: airwayChecks,
      catastrophicBleedChecks: catastrophicBleedChecks,
      tourniquetTime: tourniquetTime,
      breathingRate: breathingRate,
      circulationChecks: circulationChecks,
      damageChecks: damageChecks,
      environmentChecks: environmentChecks,
    );
  }
} 