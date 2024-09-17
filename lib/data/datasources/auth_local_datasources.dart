import 'package:flutter_ecommerce_app/data/models/response/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSources {
  Future<void> saveAuthData(AuthResponseModel data) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('auth_data', data.toJson());
  }

  //remove auth data
  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth_data');
  }

  //get auth data
  Future<AuthResponseModel> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final authData = pref.getString('auth_data');
    return AuthResponseModel.fromJson(authData!);
  }

  //check auth data
  Future<bool> checkAuthData() async {
    final pref = await SharedPreferences.getInstance();
    return pref.containsKey('auth_data');
  }
}
