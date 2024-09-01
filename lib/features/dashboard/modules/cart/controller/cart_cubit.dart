// import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/features/dashboard/modules/product/controller/product_cubit.dart';
import 'package:flutter_application_1/features/dashboard/modules/product/model/entity_model/product_model.dart';
import 'package:flutter_application_1/features/dashboard/modules/product/model/repo/database_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CarState> {
  CartCubit() : super(CarStateLoading()) {
    init();
  }

  List<ProductModel> products = [];
  DatabaseRepo repo = DatabaseRepo();

  Future<void> init() async {
    emit(CarStateLoading());
    await repo.initDB();
    products = await repo.fetchFavoriteProducts();
    if (products.isEmpty) {
      emit(CarStateEmpty());
    } else {
      emit(CarStateLoaded());
    }
  }

  Future<void> addItemToFavorite(int id, int value) async {
    await repo.updateFavorite(value, id);
    await ProductCubit.instance.init();
    await init();
  }

  Future<void> addItemToCart(ProductModel product, int quantity) async {
    await repo.updateCart(1, product.id ?? 0);
    // تحديث المنتج بإضافة الكمية الجديدة
    product.cart = 1;
    product.avilabequantity = (product.avilabequantity ?? 0) - quantity;

    // إضافة المنتج إلى السلة
    await repo.insertProductToCart(product, quantity);
    await init();
  }
  
}
