part of 'add_category_products_bloc.dart';

@freezed
class AddCategoryProductsEvent with _$AddCategoryProductsEvent {
  const factory AddCategoryProductsEvent.started() = _Started;
  const factory AddCategoryProductsEvent.addCategoryProduct({
    required String name,
  }) = _AddCategoryProduct;
}
