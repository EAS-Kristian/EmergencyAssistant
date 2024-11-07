import 'package:flutter/foundation.dart';
import '../models/assessment_record.dart';

class AssessmentProvider extends ChangeNotifier {
  final List<AssessmentRecord> _assessments = [];

  List<AssessmentRecord> get assessments => List.unmodifiable(_assessments);

  void addAssessment(AssessmentRecord assessment) {
    _assessments.insert(0, assessment); 
    notifyListeners();
  }
} 