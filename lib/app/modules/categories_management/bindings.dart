import 'package:get/get.dart';
import 'package:quan_ly_kho/app/modules/categories_management/categories_management_logic.dart';

class CategoryManagementBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryManagementLogic());
  }
}
