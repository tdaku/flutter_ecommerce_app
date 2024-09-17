// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecommerce_app/data/datasources/product_remote_datasources.dart';

import '../../../../data/models/request/products_request_model.dart';

part 'create_product_bloc.freezed.dart';
part 'create_product_event.dart';
part 'create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final ProductRemoteDatasources productRemoteDatasources;
  CreateProductBloc(
    this.productRemoteDatasources,
  ) : super(const _Initial()) {
    on<_CreateProduct>((event, emit) async {
      emit(const _Loading());
      final result = await productRemoteDatasources.createProducts(event.data);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(const _Success()),
      );
    });
  }
}
