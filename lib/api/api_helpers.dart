import 'package:flutter/material.dart';
import 'package:shamel/prefs/shared_pref_controller.dart';

mixin ApiHelpers{

  void showSnackBar({
    required BuildContext context,
    required String message,
    bool error = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: error ? Colors.red : Colors.green,
          duration: const Duration(seconds: 1),
          dismissDirection: DismissDirection.horizontal,)
    );
  }

  Map<String, String> get headers {
    print('in header');
    var headers = {
      'Accept': 'application/json',
      'lang': SharedPrefController().language
    };
    if (SharedPrefController().loggedIn)
      headers['Authorization'] = SharedPrefController().token;
    return headers;
  }
}