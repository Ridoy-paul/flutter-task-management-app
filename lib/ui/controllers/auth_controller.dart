import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/user_model.dart';

class AuthController {
  static String? token;
  static UserModel? user;


  Future<void> saveUserInformation(String token, UserModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
    await sharedPreferences.setString('user', jsonEncode(model.toJson()));
  }

  Future<void> initializeUserCache() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    user = UserModel.fromJson(jsonDecode(sharedPreferences.getString('user') ?? '{}'));
  }

  Future<bool> checkAuthState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    if(token != null) {
      await initializeUserCache();
      return true;
    }
    return false;
  }

}