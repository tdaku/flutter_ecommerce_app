// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecommerce_app/data/datasources/category_remote_datasources.dart';

import '../../../../data/models/response/category_response_model.dart';

part 'get_category_product_bloc.freezed.dart';
part 'get_category_product_event.dart';
part 'get_category_product_state.dart';

class GetCategoryProductBloc
    extends Bloc<GetCategoryProductEvent, GetCategoryProductState> {
  final CategoryRemoteDatasources categoryRemoteDatasources;
  GetCategoryProductBloc(
    this.categoryRemoteDatasources,
  ) : super(const _Initial()) {
    on<_GetCategories>((event, emit) async {
      emit(const _Loading());
      final result = await categoryRemoteDatasources.getCategories();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data!)),
      );
    });
  }
}
