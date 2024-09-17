part of 'delete_products_bloc.dart';

@freezed
class DeleteProductsState with _$DeleteProductsState {
  const factory DeleteProductsState.initial() = _Initial;
  const factory DeleteProductsState.loading() = _Loading;
  const factory DeleteProductsState.success() = _Success;
  const factory DeleteProductsState.error(String message) = _Error;
}
