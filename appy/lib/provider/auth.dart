import 'dart:convert';
import 'package:appy/model/http_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _id;
  String? _token;
  DateTime? _expiryDate;

  bool get isAuth {
    return tokens != null;
  }

  String? get tokens {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    } else {
      return null;
    }
  }

  Future<void> logIn(String email, String password) async {
    await _autentication(email, password, 'signInWithPassword');
  }

  Future<void> signUp(String email, String password) async {
    await _autentication(email, password, 'signUp');
  }

  Future<void> _autentication(
      String email, String password, String keySagment) async {
    try {
      final url = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:$keySagment?key=AIzaSyDD-w8Gfc41l46CSVV1dwCtZPMXTA-q42s');
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      _id = responseData['localId'];
      _token = responseData['idToken'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData['expiresIn']),
        ),
      );
    } catch (error) {
      rethrow;
    }
  }
}
