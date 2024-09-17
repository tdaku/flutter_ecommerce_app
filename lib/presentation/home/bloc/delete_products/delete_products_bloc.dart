// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecommerce_app/data/datasources/product_remote_datasources.dart';

part 'delete_products_bloc.freezed.dart';
part 'delete_products_event.dart';
part 'delete_products_state.dart';

class DeleteProductsBloc
    extends Bloc<DeleteProductsEvent, DeleteProductsState> {
  final ProductRemoteDatasources productRemoteDatasources;
  DeleteProductsBloc(
    this.productRemoteDatasources,
  ) : super(const _Initial()) {
    on<_DeleteProduct>((event, emit) async {
      emit(const _Loading());
      final result = await productRemoteDatasources.deleteProduct(event.id);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(const _Success()),
      );
    });
  }
}
