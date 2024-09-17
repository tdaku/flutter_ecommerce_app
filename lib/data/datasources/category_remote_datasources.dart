import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/datasources/auth_local_datasources.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variabel.dart';
import '../models/response/category_response_model.dart';

class CategoryRemoteDatasources {
  Future<Either<String, CategoryResponseModel>> getCategories() async {
    final authData = await AuthLocalDataSources().getAuthData();
    final url = Uri.parse('${Variabels.baseUrl}/api/seller/categories');
    final header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    final response = await http.get(
      url,
      headers: header,
    );

    if (response.statusCode == 200) {
      return Right(CategoryResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, String>> createCategory(String name) async {
    final authData = await AuthLocalDataSources().getAuthData();
    final url = Uri.parse('${Variabels.baseUrl}/api/seller/category');
    final header = {
      'Authorization': 'Bearer ${authData.data!.token}',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await http.post(
      url,
      headers: header,
      body: jsonEncode({
        'name': name,
        'description': name,
      }),
    );

    if (response.statusCode == 201) {
      return const Right('Category berhasil ditambahkan');
    } else {
      return Left(response.body);
    }
  }
}
