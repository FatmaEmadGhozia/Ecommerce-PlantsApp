import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/dashboard/modules/cart/controller/cart_cubit.dart';
import 'package:flutter_application_1/features/dashboard/modules/cart/view/component/cart_item_widget.dart';
import 'package:flutter_application_1/features/dashboard/modules/favorite/controller/favorite_cubit.dart';
import 'package:flutter_application_1/features/dashboard/modules/favorite/view/component/favorite_item_widget.dart';
import 'package:flutter_application_1/features/dashboard/modules/product/controller/product_cubit.dart';
import 'package:flutter_application_1/features/dashboard/modules/product/view/component/product_item_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocBuilder<CartCubit, CarState>(
        builder: (context, state) {
          final CartCubit controller = context.read<CartCubit>();
          return Scaffold(
            body:  state is ProductStateLoading?
           const CircularProgressIndicator():
            state is FavoriteStateEmpty?
           const Icon(CupertinoIcons.delete):
            ListView.builder(
              itemBuilder:(_,int index)=>CartItemWidget(productModel:controller.products[index],
              controller: controller,
              ) ,
            itemCount: controller.products.length,
            ),
          );
        },
      ),
    );
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/features/dashboard/modules/product/controller/product_cubit.dart';
// import 'package:flutter_application_1/features/dashboard/modules/product/view/component/product_item_widget.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ProductPage extends StatelessWidget {
//   const ProductPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ProductCubit(),
//       child: BlocBuilder<ProductCubit, ProductState>(
//         builder: (context, state) {
//           final ProductCubit controller = context.read<ProductCubit>();
//           return Scaffold(
//             body: state is ProductStateLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : state is ProductStateEmpty
//                     ? const Center(child: Icon(CupertinoIcons.delete))
//                     : GridView.builder(
//                         padding: const EdgeInsets.all(8.0),
//                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 8.0,
//                           mainAxisSpacing: 8.0,
//                           childAspectRatio: 0.75, // Adjust this to control item height
//                         ),
//                         itemBuilder: (_, int index) => ProductItemWidget(
//                           productModel: controller.products[index],
//                           controller: controller,
//                         ),
//                         itemCount: controller.products.length,
//                       ),
//           );
//         },
//       ),
//     );
//   }
// }
