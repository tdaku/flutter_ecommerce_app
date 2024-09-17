part of 'get_category_product_bloc.dart';

@freezed
class GetCategoryProductState with _$GetCategoryProductState {
  const factory GetCategoryProductState.initial() = _Initial;
  const factory GetCategoryProductState.loading() = _Loading;
  const factory GetCategoryProductState.loaded(List<Category> categories) =
      _Loaded;
  const factory GetCategoryProductState.error(String message) = _Error;
}
