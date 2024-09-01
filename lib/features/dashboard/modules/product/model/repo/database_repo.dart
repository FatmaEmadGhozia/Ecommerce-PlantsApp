
import 'dart:developer';
import 'dart:typed_data';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_application_1/features/dashboard/modules/product/model/entity_model/product_model.dart';

class DatabaseRepo {
  late Database myObjectDB;

  Future<void> initDB() async {
    myObjectDB = await openDatabase(
      (await getDatabasesPath()) + '/productDB.db',
      version: 1,
      onCreate: (db, version) {
        db.execute(
          '''CREATE TABLE product (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            description TEXT,
            image BLOB,
            quantity INTEGER,
            available_quantity INTEGER,
            favorite INTEGER,
            price INTEGER,
            cart INTEGER
          )''',
        );
      },
    );
  }


  Future<List<ProductModel>> fetchProducts() async {
    log((await myObjectDB.getVersion()).toString());
    return (await myObjectDB.query('product'))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<List<ProductModel>> fetchFavoriteProducts() async {
    return (await myObjectDB
            .query('product', where: 'favorite=?', whereArgs: [1]))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<List<ProductModel>> fetchCartProducts() async {
    final List<Map<String, dynamic>> maps = await myObjectDB.query(
      'product',
      where: 'cart = ?',
      whereArgs: [1],
    );
    return List.generate(maps.length, (i) {
      return ProductModel.fromJson(maps[i]);
    });
  }

  Future<void> insertProduct(String name, String description, int quantity,
      int availableQuantity, Uint8List image) async {
    await myObjectDB.insert(
      'product',
      {
        'name': name,
        'description': description,
        'quantity': quantity,
        'available_quantity': availableQuantity,
        'image': image,
        'favorite': 0,
        'cart': 0,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateQuantity(int id, int quantity) async {
    await myObjectDB.update(
      'product',
      {'available_quantity': quantity},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateCart(int id, int value) async {
    await myObjectDB.update(
      'product',
      {'cart': value},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateFavorite(int id, int value) async {
    await myObjectDB.update(
      'product',
      {'favorite': value},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteProduct(int id) async {
    await myObjectDB.delete(
      'product',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

 
  // دالة لإدراج المنتج إلى السلة
  Future<void> insertProductToCart(ProductModel product, int quantity) async {
    await myObjectDB.insert('cart', product.toJson()..['quantity'] = quantity);
  }

  // دالة لاسترجاع المنتجات من السلة
  Future<List<ProductModel>> fetchCartItems() async {
    final List<Map<String, dynamic>> maps = await myObjectDB.query('cart');

    return List.generate(maps.length, (i) {
      return ProductModel.fromJson(maps[i]);
    });
  }
}

