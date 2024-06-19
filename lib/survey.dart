import 'package:flutter/foundation.dart';

class SurveyModel with ChangeNotifier {
  String? name;
  String? email;
  String? feedback;

  bool _isSubmitted = false;

  bool get isSubmitted => _isSubmitted;

  void submit() {
    _isSubmitted = true;
    notifyListeners();
  }

  void updateName(String value) {
    name = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    email = value;
    notifyListeners();
  }

  void updateFeedback(String value) {
    feedback = value;
    notifyListeners();
  }
}
