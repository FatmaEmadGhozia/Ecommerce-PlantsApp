// 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/dashboard/controller/dashboard_controller.dart';
import 'package:flutter_application_1/features/dashboard/controller/dashboard_state.dart';
import 'package:flutter_application_1/features/dashboard/modules/cart/view/page/cart_page.dart';
import 'package:flutter_application_1/features/dashboard/modules/favorite/view/page/favorite_page.dart';
import 'package:flutter_application_1/features/dashboard/modules/product/view/page/product_page.dart';
import 'package:flutter_application_1/features/dashboard/modules/users/view/page/user_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  final List<String> titles = const ['Products', 'Favourite', 'Cart'];

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardController(),
      child: BlocBuilder<DashboardController, DashboardState>(
        builder: (context, state) {
          DashboardController controller = context.read<DashboardController>();

          return Scaffold(
            appBar: AppBar(
              
              backgroundColor: Colors.green,
              title: Text(
                titles[controller.selectedTapIndex],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'new_product');
                  },
                  icon: Icon(CupertinoIcons.plus),
                ),
              ],
            ),
            body: PageView(
              controller: controller.pageController,
              onPageChanged: controller.onChangeTabIndex,
              children: const [
                ProductPage(),
                FavoritePage(),
                CartPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.selectedTapIndex,
              onTap: (index) {
                controller.onChangeTabIndex(index);
                if (index == 0) {
                  // This line ensures that the PageView scrolls to the correct page
                  controller.pageController.jumpToPage(index);
                }
              },
              unselectedItemColor: Colors.black,
              showUnselectedLabels: true,
              unselectedLabelStyle: const TextStyle(fontSize: 15, color: Colors.red),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.collections),
                  label: 'Products',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart),
                  label: 'Cart',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
