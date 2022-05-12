import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_project/layers/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

part 'products_state.dart';

part 'products_event.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<CreateProduct>((event, emit) async {});
    on<ReadProducts>((event, emit) async {});
    on<UpdateProduct>((event, emit) async {});
    on<DeleteProduct>((event, emit) async {});
  }
}
