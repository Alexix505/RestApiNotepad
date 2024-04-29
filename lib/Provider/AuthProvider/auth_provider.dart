import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:rest_api_notepad/Constants/url.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  ///Base Url
  final requestBaseUrl = AppUrl.baseUrl;

  ///Setter
  bool _isLoading = false;
  String _resMessage = '';

  ///Getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  void registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();
    String url = "$requestBaseUrl/users/";

    final body = {
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": lastName,
    };

    try {
      http.Response req = await http.post(
        Uri.parse(url),
        body: json.encode(body),
      );

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);

        print(req.body);
      } else {
        final res = json.decode(req.body);

        print(req.body);
        _isLoading = false;
        _resMessage = 'Account Crated!';
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "please try again";
      notifyListeners();
      print(':::: $e');
    }
  }

  void loginUser({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();
    String url = "$requestBaseUrl/users/login";

    final body = {
      "email": email,
      "password": password,
    };

    try {
      http.Response req = await http.post(
        Uri.parse(url),
        body: json.encode(body),
      );

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);

        print(req.body);
      } else {
        final res = json.decode(req.body);

        print(req.body);
        _isLoading = false;
        _resMessage = 'Login Successful';
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "please try again";
      notifyListeners();
      print(':::: $e');
    }
  }
}
