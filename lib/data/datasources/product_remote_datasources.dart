import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/constants/variabel.dart';
import 'package:flutter_ecommerce_app/data/datasources/auth_local_datasources.dart';
import 'package:flutter_ecommerce_app/data/models/request/products_request_model.dart';
import 'package:flutter_ecommerce_app/data/models/response/create_products_response_model.dart';
import 'package:flutter_ecommerce_app/data/models/response/products_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/request/update_products_request_model.dart';

class ProductRemoteDatasources {
  Future<Either<String, ProductsResponseModel>> getProducts() async {
    final url = Uri.parse('${Variabels.baseUrl}/api/seller/products');
    final authData = await AuthLocalDataSources().getAuthData();
    final header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };
    final response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      return Right(ProductsResponseModel.fromJson(response.body));
    } else {
      return const Left("Failed to load data");
    }
  }

  //create product
  Future<Either<String, CreateProductResponseModel>> createProducts(
      ProductsRequestModel data) async {
    final url = Uri.parse('${Variabels.baseUrl}/api/seller/products');
    final authData = await AuthLocalDataSources().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}'
    };
    var response = http.MultipartRequest(
      'POST',
      url,
    );

    response.files.add(
      await http.MultipartFile.fromPath('image', data.image.path),
    );
    response.fields.addAll(data.toMap());

    response.headers.addAll(headers);

    var result = await response.send();

    if (result.statusCode == 201) {
      return Right(CreateProductResponseModel.fromJson(
          await result.stream.bytesToString()));
    } else {
      return const Left('Failed to load data');
    }
  }

  //delete product
  Future<Either<String, String>> deleteProduct(int id) async {
    final url = Uri.parse('${Variabels.baseUrl}/api/seller/products/$id');
    final authData = await AuthLocalDataSources().getAuthData();
    final header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };
    final response = await http.delete(url, headers: header);

    if (response.statusCode == 200) {
      return const Right("Product berhasil dihapus");
    } else {
      return const Left("Product gagal dihapus");
    }
  }

  //update product
  Future<Either<String, CreateProductResponseModel>> updateProduct(
      UpdateProductsRequestModel data) async {
    final url =
        Uri.parse('${Variabels.baseUrl}/api/seller/products/${data.id}');
    final authData = await AuthLocalDataSources().getAuthData();
    final header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };
    var response = http.MultipartRequest(
      'POST',
      url,
    );

    if (data.image != null) {
      response.files
          .add(await http.MultipartFile.fromPath('image', data.image!.path));
    }

    response.fields.addAll(data.toMap());

    response.headers.addAll(header);

    var result = await response.send();

    if (result.statusCode == 200) {
      return Right(CreateProductResponseModel.fromJson(
          await result.stream.bytesToString()));
    } else {
      return const Left('Failed to add product');
    }
  }
}
