part of 'update_products_bloc.dart';

@freezed
class UpdateProductsState with _$UpdateProductsState {
  const factory UpdateProductsState.initial() = _Initial;
  const factory UpdateProductsState.loading() = _Loading;
  const factory UpdateProductsState.success() = _Success;
  const factory UpdateProductsState.error(String message) = _Error;
}
