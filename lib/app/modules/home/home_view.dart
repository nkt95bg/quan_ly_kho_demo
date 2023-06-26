import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quan_ly_kho/app/routes/routes_config.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App demo'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RouteConfig.category);
                  },
                  child: const Text(
                    'Tất cả danh mục',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Nhập kho',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Xuất kho',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'kiểm kho',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Danh sách kho',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
