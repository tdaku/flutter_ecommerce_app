// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecommerce_app/data/datasources/category_remote_datasources.dart';

part 'add_category_products_bloc.freezed.dart';
part 'add_category_products_event.dart';
part 'add_category_products_state.dart';

class AddCategoryProductsBloc
    extends Bloc<AddCategoryProductsEvent, AddCategoryProductsState> {
  final CategoryRemoteDatasources categoryRemoteDatasources;
  AddCategoryProductsBloc(
    this.categoryRemoteDatasources,
  ) : super(const _Initial()) {
    on<_AddCategoryProduct>((event, emit) async {
      emit(const _Loading());
      final result = await categoryRemoteDatasources.createCategory(event.name);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(const _Loaded()),
      );
    });
  }
}
