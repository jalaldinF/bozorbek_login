import 'package:bozorbek_login/screen/main_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  List<Widget> screens = [
    const MainPage(title: ''),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentPage = const MainPage(title: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      //backgroundColor: const Colors.,
      body: PageStorage(
        bucket: bucket,
        child: currentPage,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.search,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 7,
        child: Container(
          //decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.only(right: 25),
          // color: Colors.transparent,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      // color: Colors.red,
                      padding: const EdgeInsets.only(top: 5),
                      height: 55,
                      width: 55,
                      //  color: Colors.red,
                      child: Column(
                        children: const [
                          Icon(
                            Icons.home_outlined,
                            size: 30,
                          ),
                          Text('Главная',
                              style: TextStyle(
                                fontSize: 11,
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.only(top: 5),
                      height: 55,
                      width: 55,
                      //  color: Colors.red,
                      child: Column(
                        children: const [
                          Icon(
                            Icons.assignment_outlined,
                            size: 30,
                          ),
                          Text(
                            'Каталог',
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      //  color: Colors.red,
                      padding: const EdgeInsets.only(top: 5),
                      height: 55,
                      //  width: 55,
                      //  color: Colors.red,
                      child: Column(
                        children: const [
                          Icon(
                            Icons.shopping_basket_outlined,
                            size: 30,
                          ),
                          Text(
                            'Корзина',
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      //  color: Colors.red,
                      padding: const EdgeInsets.only(top: 5),
                      height: 55,
                      //  width: 55,
                      //  color: Colors.red,
                      child: Column(
                        children: const [
                          Icon(
                            Icons.person_outline,
                            size: 30,
                          ),
                          Text(
                            'Профиль',
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
