// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecommerce_app/data/datasources/rajaongkir_remote_datasource.dart';

import '../../../../data/models/city_response_model.dart';

part 'get_city_bloc.freezed.dart';
part 'get_city_event.dart';
part 'get_city_state.dart';

class GetCityBloc extends Bloc<GetCityEvent, GetCityState> {
  final RajaongkirRemoteDatasource rajaongkirRemoteDatasource;
  GetCityBloc(
    this.rajaongkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetCity>((event, emit) async {
      emit(const _Loading());
      final result = await rajaongkirRemoteDatasource.getCity(event.provinceId);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.rajaongkir!.results!)),
      );
    });
  }
}
