import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/dashboard/modules/product/controller/product_cubit.dart';
import 'package:flutter_application_1/features/dashboard/modules/product/model/entity_model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cart/controller/cart_cubit.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
    required this.productModel,
    required this.controller, 
  });
  final ProductModel productModel;
  final ProductCubit controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ///product info
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.memory(
                      productModel.image ?? Uint8List(5),
                      height: 150,
                      width: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productModel.name ?? 'product',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        productModel.desc ?? 'description',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        (productModel.avilabequantity ?? 0).toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Divider(
                thickness: 0.5,
              ),

              ///actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ///like
                  InkWell(
                    child: productModel.favorite == 1
                        ? const Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.red,
                          )
                        : const Icon(
                            CupertinoIcons.heart,
                            color: Colors.red,
                          ),
                    // onTap: () {
                    //   if (productModel.favorite == 1) {
                    //     controller.addItemtofavorite(productModel.id ?? 0,0);
                    //   }
                    //    else {
                    //     controller.addItemtofavorite(productModel.id ?? 0, 1);
                    //   }
                    // },
                    onTap: () {
  final newFavoriteStatus = productModel.favorite == 1 ? 0 : 1;
  controller.addItemtofavorite(productModel.id ?? 0, newFavoriteStatus);
},
 
                  ),

                  ///divider
                  Container(
                    height: 30,
                    width: 0.5,
                    color: Colors.grey,
                  ),

                  ///cart
                  InkWell(
                    child: productModel.cart == 1
                        ? const Icon(
                            CupertinoIcons.cart,
                            color: Colors.green,
                          )
                        : const Icon(
                            CupertinoIcons.cart,
                            color: Colors.green,
                          ),
                    onTap: () {
                  _showAddToCartBottomSheet(context, productModel);

                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

    void _showAddToCartBottomSheet(BuildContext context, ProductModel product) {
    final TextEditingController quantityController = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'choose quantity',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                  hintText:  'Add quantity',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final int quantity = int.parse(quantityController.text);
                  context.read<CartCubit>().addItemToCart(productModel, quantity);
                  Navigator.pop(context);
                },
                child: const Text('Add To Cart'),
                ),
            ],
          ),
        );
      },
    );
  }
}