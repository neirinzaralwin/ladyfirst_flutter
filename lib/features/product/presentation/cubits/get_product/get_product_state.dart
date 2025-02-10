part of 'get_product_cubit.dart';

sealed class GetProductState extends Equatable {
  const GetProductState();

  @override
  List<Object> get props => [];
}

final class GetProductInitial extends GetProductState {}

final class GetProductLoading extends GetProductState {}

final class GetProductLoaded extends GetProductState {
  final Product product;

  const GetProductLoaded(this.product);

  @override
  List<Object> get props => [product];
}

final class GetProductError extends GetProductState {
  final String message;

  const GetProductError(this.message);

  @override
  List<Object> get props => [message];
}
