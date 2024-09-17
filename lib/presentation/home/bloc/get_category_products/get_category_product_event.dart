part of 'get_category_product_bloc.dart';

@freezed
class GetCategoryProductEvent with _$GetCategoryProductEvent {
  const factory GetCategoryProductEvent.started() = _Started;
  const factory GetCategoryProductEvent.getCategories() = _GetCategories;
}
