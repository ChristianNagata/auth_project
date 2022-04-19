import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
}