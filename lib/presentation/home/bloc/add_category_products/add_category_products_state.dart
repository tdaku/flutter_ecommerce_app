part of 'add_category_products_bloc.dart';

@freezed
class AddCategoryProductsState with _$AddCategoryProductsState {
  const factory AddCategoryProductsState.initial() = _Initial;
  const factory AddCategoryProductsState.loading() = _Loading;
  const factory AddCategoryProductsState.loaded() = _Loaded;
  const factory AddCategoryProductsState.error(String message) = _Error;
}
