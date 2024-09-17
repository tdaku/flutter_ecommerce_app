part of 'create_product_bloc.dart';

@freezed
class CreateProductState with _$CreateProductState {
  const factory CreateProductState.initial() = _Initial;
  const factory CreateProductState.loading() = _Loading;
  const factory CreateProductState.success() = _Success;
  const factory CreateProductState.error(String message) = _Error;
}
