part of 'delete_products_bloc.dart';

@freezed
class DeleteProductsEvent with _$DeleteProductsEvent {
  const factory DeleteProductsEvent.started() = _Started;
  const factory DeleteProductsEvent.deleteProduct({required int id}) =
      _DeleteProduct;
}
