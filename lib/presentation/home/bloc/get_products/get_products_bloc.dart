// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecommerce_app/data/datasources/product_remote_datasources.dart';

import '../../../../data/models/response/products_response_model.dart';

part 'get_products_bloc.freezed.dart';
part 'get_products_event.dart';
part 'get_products_state.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  final ProductRemoteDatasources productRemoterDatasources;
  GetProductsBloc(
    this.productRemoterDatasources,
  ) : super(const _Initial()) {
    on<_GetProducts>((event, emit) async {
      emit(const _Loading());
      final result = await productRemoterDatasources.getProducts();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r.data ?? [])),
      );
    });
  }
}
