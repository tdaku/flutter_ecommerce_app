// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecommerce_app/data/datasources/product_remote_datasources.dart';
import 'package:flutter_ecommerce_app/data/models/request/update_products_request_model.dart';

part 'update_products_bloc.freezed.dart';
part 'update_products_event.dart';
part 'update_products_state.dart';

class UpdateProductsBloc
    extends Bloc<UpdateProductsEvent, UpdateProductsState> {
  final ProductRemoteDatasources productRemoteDatasources;
  UpdateProductsBloc(
    this.productRemoteDatasources,
  ) : super(const _Initial()) {
    on<_UpdateProduct>((event, emit) async {
      emit(const _Loading());
      final result = await productRemoteDatasources.updateProduct(event.data);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(const _Success()),
      );
    });
  }
}
