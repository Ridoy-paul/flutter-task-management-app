import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import '../../app.dart';
import '../../ui/screens/login_screen.dart';
import '../../ui/controllers/auth_controller.dart';
import 'package:http/http.dart';
import 'network_response.dart';

class NetworkCaller {
  Future<NetworkResponse> postRequest(String url, {Map<String, dynamic>? body, bool isLogin = false}) async {

    log(url);
    log(body.toString());

    try {
      final Response response =
          await post(Uri.parse(url), body: jsonEncode(body), headers: {
        'Content-type': 'Application/json',
            'token': AuthController.token.toString(),
      });

      log(response.statusCode.toString());
      log(response.body.toString());

      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          jsonResponse: jsonDecode(response.body),
          statusCode: 200,
        );
      }
      else if(response.statusCode == 401) {
        if(isLogin == false) {
          backToLogin();
        }

        return NetworkResponse(
          isSuccess: false,
          jsonResponse: jsonDecode(response.body),
          statusCode: response.statusCode,
        );
      }
      else {
        return NetworkResponse(
          isSuccess: false,
          jsonResponse: jsonDecode(response.body),
          statusCode: response.statusCode,
        );
      }
    } catch (error) {
      return NetworkResponse(isSuccess: false, errorMessage: error.toString());
    }
  }

  void backToLogin() {
    Navigator.pushAndRemoveUntil(TaskManagementApp.navigationKey.currentContext!, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
  }


}
