import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();

  Map<String, String> formValues = {
    'email': '',
    'password': '',
  };

  bool _recordarme = false;

  set recordarme(bool value) {
    _recordarme = value;
    notifyListeners();
  }

  bool get recordarme => _recordarme;

  bool isValidForm() {
    return formLoginKey.currentState?.validate() ?? false;
  }
}
