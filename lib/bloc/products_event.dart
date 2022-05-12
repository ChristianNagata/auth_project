part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class CreateProduct extends ProductsEvent {}

class ReadProducts extends ProductsEvent {}

class UpdateProduct extends ProductsEvent {}

class DeleteProduct extends ProductsEvent {}
