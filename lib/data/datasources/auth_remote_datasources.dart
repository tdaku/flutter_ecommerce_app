import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/constants/variabel.dart';
import 'package:flutter_ecommerce_app/data/datasources/auth_local_datasources.dart';
import 'package:flutter_ecommerce_app/data/models/request/register_request_model.dart';
import 'package:flutter_ecommerce_app/data/models/response/register_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/response/auth_response_model.dart';


class AuthRemoteDataSource {
  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel data) async {
    final url = Uri.parse('${Variabels.baseUrl}/api/register/seller');
    var headers = {'Accept': 'application/json'};
    var request = http.MultipartRequest('POST', url);
    request.fields.addAll(data.toMap());
    request.files
        .add(await http.MultipartFile.fromPath('image', data.image.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      return Right(RegisterResponseModel.fromJson(
          await response.stream.bytesToString()));
    } else {
      return const Left('Failed to load data');
    }
  }

  // Future<Either<String, UserResponseModel>> getUser(int id) async {
  //   final authData = await AuthLocalDataSources().getAuthData();
  //   final url = Uri.parse('${Variabels.baseUrl}/api/user/$id');

  //   final header = {
  //     'Authorization': 'Bearer ${authData.data!.token}',
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //   };

  //   final response = await http.get(
  //     url,
  //     headers: header,
  //   );

  //   if (response.statusCode == 200) {
  //     return Right(UserResponseModel.fromJson(response.body));
  //   } else {
  //     return const Left('Failed to load user data');
  //   }
  // }

  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    final url = Uri.parse('${Variabels.baseUrl}/api/login');
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to Login');
    }
  }

  //logout
  Future<Either<String, String>> logout() async {
    final url = Uri.parse('${Variabels.baseUrl}/api/logout');
    final authData = await AuthLocalDataSources().getAuthData();
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData.data!.token!}',
      },
    );

    if (response.statusCode == 200) {
      return const Right("Logout Success");
    } else {
      return Left(response.body);
    }
  }
}
