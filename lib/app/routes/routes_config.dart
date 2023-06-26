import 'package:get/get.dart';
import 'package:quan_ly_kho/app/modules/categories_management/bindings.dart';
import 'package:quan_ly_kho/app/modules/categories_management/categories_management_view.dart';
import 'package:quan_ly_kho/app/modules/home/home_view.dart';

import '../modules/categories_management/widgets/create/bindings.dart';
import '../modules/categories_management/widgets/create/create_view.dart';

class RouteConfig {
  static const String home = "/";
  static const String category = "/catgory";
  static const String detail = "/detail";
  static const String create = "/create";

  static final List<GetPage> getPages = [
    GetPage(
      name: home,
      page: () => const AppHome(),
    ),
    GetPage(
        name: category,
        page: () => const CategorieManagementView(),
        binding: CategoryManagementBindings(),
        children: [
          GetPage(
              name: create,
              page: () => CategoryCreateView(isCreate: true),
              binding: CategoryCreateBinding()),
          GetPage(
              name: detail,
              page: () => CategoryCreateView(isCreate: false),
              binding: CategoryCreateBinding()),
        ])
  ];
}
