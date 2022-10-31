import 'package:bozorbek_login/widget/all_products_container.dart';
import 'package:bozorbek_login/widget/discount_products_container.dart';
import 'package:bozorbek_login/widget/row_container.dart';
import 'package:bozorbek_login/widget/top_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required String title});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top bar
            const TopBarContainer(
              page: 'mainP',
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    RowContainer(),
                    Text(
                      '    Все продукты',
                      style: TextStyle(fontSize: 20, color: Color(0xff42445A)),
                    ),
                    AllProductsContainer(),
                    Text(
                      '    Вкусные скидки',
                      style: TextStyle(fontSize: 20, color: Color(0xff42445A)),
                    ),
                    DiscountProductsContainer(),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
