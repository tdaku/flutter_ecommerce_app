import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/constants/variabel.dart';
import 'package:flutter_ecommerce_app/data/models/province_response_model.dart';
import 'package:flutter_ecommerce_app/data/models/subdistrict_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/city_response_model.dart';

class RajaongkirRemoteDatasource {
  Future<Either<String, ProvinceResponseModel>> getProvince() async {
    final url = Uri.parse(
        "${Variabels.rajaOngkirBaseUrl}/api/province?key=${Variabels.rajaOngkirKey}");
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json ',
      },
    );

    if (response.statusCode == 200) {
      return Right(ProvinceResponseModel.fromJson(response.body));
    } else {
      return const Left("Failed to load data");
    }
  }

  Future<Either<String, CityResponseModel>> getCity(int provinceId) async {
    final url = Uri.parse(
        "${Variabels.rajaOngkirBaseUrl}/api/city?key=${Variabels.rajaOngkirKey}&province=$provinceId");
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json ',
      },
    );

    if (response.statusCode == 200) {
      return Right(CityResponseModel.fromJson(response.body));
    } else {
      return const Left("Failed to load data");
    }
  }


  Future<Either<String, SubdistrictResponseModel>> getSubdistrict(int cityId) async {
    final url = Uri.parse(
        "${Variabels.rajaOngkirBaseUrl}/api/subdistrict?key=${Variabels.rajaOngkirKey}&city=$cityId");
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json ',
      },
    );

    if (response.statusCode == 200) {
      return Right(SubdistrictResponseModel.fromJson(response.body));
    } else {
      return const Left("Failed to load data");
    }
  }
}
