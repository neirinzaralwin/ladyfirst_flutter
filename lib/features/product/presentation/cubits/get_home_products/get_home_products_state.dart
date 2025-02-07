part of 'get_home_products_cubit.dart';

@immutable
sealed class GetHomeProductsState {}

final class GetHomeProductsInitial extends GetHomeProductsState {}

final class GetHomeProductsLoading extends GetHomeProductsState {}

final class GetHomeProductsLoaded extends GetHomeProductsState {
  final List<Product> products;

  GetHomeProductsLoaded(this.products);
}

final class GetHomeProductsEmpty extends GetHomeProductsState {}

final class GetHomeProductsError extends GetHomeProductsState {
  final String message;

  GetHomeProductsError(this.message);
}
