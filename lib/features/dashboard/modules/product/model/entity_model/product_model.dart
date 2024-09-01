// import 'dart:developer';
// import 'dart:typed_data';

// class ProductModel {
//   String? name, desc;
//   int? favorite, cart, id, avilabequantity, quantity, price;
//   Uint8List? image;

//   ProductModel.fromJson(Map m) {
//     name = m['name'];
//     desc = m['description'];
//     image = m['image'];
//     quantity = m['quantity'];
//     avilabequantity = m['available_quantity'];
//     cart = m['cart'];
//     favorite = m['favorite'];
//     price = m['price'];
//     id = m['id'];
//   }
// }
import 'dart:typed_data';

class ProductModel {
  String? name, desc;
  int? favorite, cart, id, avilabequantity, quantity, price;
  Uint8List? image;

  // إضافة دالة البناء الأساسية لتسهيل إنشاء الكائنات
  ProductModel({
    this.name,
    this.desc,
    this.favorite,
    this.cart,
    this.id,
    this.avilabequantity,
    this.quantity,
    this.price,
    this.image,
  });

  // دالة لتحويل JSON إلى كائن ProductModel
  ProductModel.fromJson(Map<String, dynamic> m) {
    name = m['name'];
    desc = m['description'];
    image = m['image'];
    quantity = m['quantity'];
    avilabequantity = m['available_quantity'];
    cart = m['cart'];
    favorite = m['favorite'];
    price = m['price'];
    id = m['id'];
  }

  // دالة لتحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': desc,
      'image': image,
      'quantity': quantity,
      'available_quantity': avilabequantity,
      'cart': cart,
      'favorite': favorite,
      'price': price,
      'id': id,
    };
  }
}
